# frozen_string_literal: true

# name: sysaru
# about: Branded public welcome screen for unauthenticated visitors
# version: 1.0.0
# authors: DPN MEDiA WORKS
# url: https://dpnmediaworks.com
# meta_url: https://dpnmediaworks.com

enabled_site_setting :sysaru_enabled

add_admin_route "sysaru.admin.title", "sysaru", use_new_show_route: true

register_asset "stylesheets/sysaru/admin.css", :admin

require "base64"

after_initialize do
  module ::Sysaru
    PLUGIN_NAME = "sysaru"
    PLUGIN_DIR  = File.expand_path("..", __FILE__)
  end

  require_relative "lib/sysaru/icons"
  require_relative "lib/sysaru/helpers"
  require_relative "lib/sysaru/data_fetcher"
  require_relative "lib/sysaru/style_builder"
  require_relative "lib/sysaru/page_builder"

  # ── Public Landing Page Controller ──
  class ::Sysaru::LandingController < ::ApplicationController
    requires_plugin Sysaru::PLUGIN_NAME

    skip_before_action :check_xhr
    skip_before_action :redirect_to_login_if_required
    skip_before_action :preload_json, raise: false
    content_security_policy false

    def index
      data = Sysaru::DataFetcher.fetch

      css = load_file("assets", "stylesheets", "sysaru", "landing.css")
      js  = load_file("assets", "javascripts", "sysaru", "landing.js")

      html = Sysaru::PageBuilder.new(data: data, css: css, js: js).build

      base_url = Discourse.base_url
      csp = "default-src 'self' #{base_url}; " \
            "script-src 'self' 'unsafe-inline'; " \
            "style-src 'self' 'unsafe-inline' https://fonts.googleapis.com https://cdnjs.cloudflare.com; " \
            "style-src-elem 'self' 'unsafe-inline' https://fonts.googleapis.com https://cdnjs.cloudflare.com; " \
            "img-src 'self' #{base_url} data: https:; " \
            "font-src 'self' #{base_url} https://fonts.gstatic.com https://cdnjs.cloudflare.com; " \
            "media-src 'self' https:; " \
            "connect-src 'self' #{base_url}; " \
            "frame-src https://www.youtube.com https://www.youtube-nocookie.com; " \
            "frame-ancestors 'self'"
      response.headers["Content-Security-Policy"] = csp

      render html: html.html_safe, layout: false, content_type: "text/html"
    rescue => e
      bt = e.backtrace&.first(15)&.join("\n") rescue ""
      error_page = <<~HTML
        <!DOCTYPE html>
        <html><head><meta charset="UTF-8"><title>Landing Page Error</title>
        <style>body{font-family:monospace;padding:2em;background:#111;color:#eee}
        pre{background:#1a1a2e;padding:1em;overflow-x:auto;border-radius:8px;font-size:13px}</style></head>
        <body>
        <h1 style="color:#e74c3c">Sysaru Error</h1>
        <p><strong>#{ERB::Util.html_escape(e.class)}</strong>: #{ERB::Util.html_escape(e.message)}</p>
        <pre>#{ERB::Util.html_escape(bt)}</pre>
        </body></html>
      HTML
      render html: error_page.html_safe, layout: false, content_type: "text/html", status: 500
    end

    private

    def load_file(*path_parts)
      File.read(File.join(Sysaru::PLUGIN_DIR, *path_parts))
    rescue StandardError => e
      "/* Error loading #{path_parts.last}: #{e.message} */"
    end
  end

  # ── Upload Pinning Controller ──
  class ::Sysaru::AdminUploadsController < ::ApplicationController
    requires_plugin Sysaru::PLUGIN_NAME
    before_action :ensure_admin

    ALLOWED_UPLOAD_SETTINGS = %w[
      og_image_url favicon_url logo_dark_url logo_light_url footer_logo_url
      hero_background_image_url hero_image_url hero_image_urls about_image_url
      about_background_image_url ios_app_badge_image_url
      android_app_badge_image_url app_cta_image_url
      splits_background_image_url
      preloader_logo_dark_url preloader_logo_light_url
    ].freeze

    def pin_upload
      upload = Upload.find(params[:upload_id])
      setting_name = params[:setting_name].to_s
      raise Discourse::InvalidParameters unless ALLOWED_UPLOAD_SETTINGS.include?(setting_name)

      key = "upload_pin_#{setting_name}"
      existing = PluginStore.get("sysaru", key)
      existing_ids = existing ? existing.to_s.split(",").map(&:to_i) : []
      existing_ids << upload.id unless existing_ids.include?(upload.id)
      PluginStore.set("sysaru", key, existing_ids.join(","))

      row = PluginStoreRow.find_by(plugin_name: "sysaru", key: key)
      UploadReference.ensure_exist!(upload_ids: existing_ids, target: row) if row

      render json: { success: true, upload_id: upload.id }
    end
  end

  # ── Badge Verification Controller ──
  class ::Sysaru::AdminVerificationController < ::ApplicationController
    requires_plugin Sysaru::PLUGIN_NAME
    before_action :ensure_admin

    def verify
      hostname = Discourse.current_hostname

      stored = PluginStore.get("sysaru", "badge_verified")
      if stored == "true"
        render json: { verified: true, hostname: hostname }
        return
      end

      begin
        response = Excon.get(
          "https://api.dpnmediaworks.com/sysaru/verify?domain=#{CGI.escape(hostname)}",
          connect_timeout: 5,
          read_timeout: 10
        )
        result = JSON.parse(response.body)

        if result["verified"]
          PluginStore.set("sysaru", "badge_verified", "true")
          PluginStore.set("sysaru", "badge_verified_at", Time.now.iso8601)
          render json: { verified: true, hostname: hostname }
        else
          render json: { verified: false, hostname: hostname, message: result["message"] }
        end
      rescue => e
        render json: { verified: false, error: e.message }, status: 502
      end
    end

    def status
      verified = PluginStore.get("sysaru", "badge_verified") == "true"
      render json: { verified: verified }
    end
  end

  # ── Routes ──
  Discourse::Application.routes.prepend do
    post "/sysaru/admin/pin-upload" =>
      "sysaru/admin_uploads#pin_upload",
      constraints: AdminConstraint.new

    get "/sysaru/admin/verify-badge" =>
      "sysaru/admin_verification#verify",
      constraints: AdminConstraint.new

    get "/sysaru/admin/badge-status" =>
      "sysaru/admin_verification#status",
      constraints: AdminConstraint.new

    root to: "sysaru/landing#index",
         constraints: ->(req) {
           req.cookies["_t"].blank? &&
             SiteSetting.sysaru_enabled
         }
  end
end

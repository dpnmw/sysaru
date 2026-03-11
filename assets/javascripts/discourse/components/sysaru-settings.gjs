import Component from "@glimmer/component";
import { service } from "@ember/service";
import { array } from "@ember/helper";
import AdminConfigAreaCard from "admin/components/admin-config-area-card";
import SysaruSettingToggle from "./sysaru/setting-toggle";
import SysaruSettingText from "./sysaru/setting-text";
import SysaruSettingTextarea from "./sysaru/setting-textarea";
import SysaruSettingColor from "./sysaru/setting-color";
import SysaruSettingEnum from "./sysaru/setting-enum";
import SysaruSettingInteger from "./sysaru/setting-integer";
import SysaruSettingImageUpload from "./sysaru/setting-image-upload";
import SysaruSettingList from "./sysaru/setting-list";

export default class SysaruAdminSettings extends Component {
  @service siteSettings;

  <template>
    <div class="sysaru-admin-settings">
      <AdminConfigAreaCard @heading="Layout">
        <SysaruSettingList
          @settingName="sysaru_section_order"
          @label="Section Order"
        />
        <SysaruSettingTextarea
          @settingName="sysaru_custom_css"
          @label="Custom CSS"
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="SEO">
        <SysaruSettingText
          @settingName="sysaru_meta_description"
          @label="Meta Description"
        />
        <SysaruSettingImageUpload
          @settingName="sysaru_og_image_url"
          @label="OG Image URL"
        />
        <SysaruSettingImageUpload
          @settingName="sysaru_favicon_url"
          @label="Favicon URL"
        />
        <SysaruSettingToggle
          @settingName="sysaru_json_ld_enabled"
          @label="JSON-LD Enabled"
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="Branding">
        <SysaruSettingImageUpload
          @settingName="sysaru_logo_dark_url"
          @label="Logo Dark URL"
        />
        <SysaruSettingImageUpload
          @settingName="sysaru_logo_light_url"
          @label="Logo Light URL"
        />
        <SysaruSettingInteger
          @settingName="sysaru_logo_height"
          @label="Logo Height"
          @min={{16}}
          @max={{80}}
        />
        <SysaruSettingToggle
          @settingName="sysaru_logo_use_accent_color"
          @label="Logo Use Accent Color"
        />
        <SysaruSettingImageUpload
          @settingName="sysaru_footer_logo_url"
          @label="Footer Logo URL"
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="Colors">
        <SysaruSettingColor
          @settingName="sysaru_accent_color"
          @label="Accent Color"
        />
        <SysaruSettingColor
          @settingName="sysaru_accent_hover_color"
          @label="Accent Hover Color"
        />
        <SysaruSettingColor
          @settingName="sysaru_dark_bg_color"
          @label="Dark Background Color"
        />
        <SysaruSettingColor
          @settingName="sysaru_light_bg_color"
          @label="Light Background Color"
        />
        <SysaruSettingColor
          @settingName="sysaru_orb_color"
          @label="Orb Color"
        />
        <SysaruSettingInteger
          @settingName="sysaru_orb_opacity"
          @label="Orb Opacity"
          @min={{0}}
          @max={{100}}
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="Animations">
        <SysaruSettingEnum
          @settingName="sysaru_scroll_animation"
          @label="Scroll Animation"
          @choices={{(array "fade_up" "fade_in" "slide_left" "slide_right" "zoom_in" "flip_up" "none")}}
        />
        <SysaruSettingToggle
          @settingName="sysaru_staggered_reveal_enabled"
          @label="Staggered Reveal Enabled"
        />
        <SysaruSettingToggle
          @settingName="sysaru_dynamic_background_enabled"
          @label="Dynamic Background Enabled"
        />
        <SysaruSettingToggle
          @settingName="sysaru_mouse_parallax_enabled"
          @label="Mouse Parallax Enabled"
        />
        <SysaruSettingToggle
          @settingName="sysaru_scroll_progress_enabled"
          @label="Scroll Progress Enabled"
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="Fonts">
        <SysaruSettingText
          @settingName="sysaru_google_font_name"
          @label="Google Font Name"
        />
        <SysaruSettingText
          @settingName="sysaru_title_font_name"
          @label="Title Font Name"
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="Icons">
        <SysaruSettingEnum
          @settingName="sysaru_icon_library"
          @label="Icon Library"
          @choices={{(array "none" "fontawesome" "google")}}
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="Preloader">
        <SysaruSettingToggle
          @settingName="sysaru_preloader_enabled"
          @label="Preloader Enabled"
        />
        <SysaruSettingImageUpload
          @settingName="sysaru_preloader_logo_dark_url"
          @label="Preloader Logo Dark URL"
        />
        <SysaruSettingImageUpload
          @settingName="sysaru_preloader_logo_light_url"
          @label="Preloader Logo Light URL"
        />
        <SysaruSettingColor
          @settingName="sysaru_preloader_bg_dark"
          @label="Preloader Background Dark"
        />
        <SysaruSettingColor
          @settingName="sysaru_preloader_bg_light"
          @label="Preloader Background Light"
        />
        <SysaruSettingColor
          @settingName="sysaru_preloader_text_color_dark"
          @label="Preloader Text Color Dark"
        />
        <SysaruSettingColor
          @settingName="sysaru_preloader_text_color_light"
          @label="Preloader Text Color Light"
        />
        <SysaruSettingColor
          @settingName="sysaru_preloader_bar_color"
          @label="Preloader Bar Color"
        />
        <SysaruSettingInteger
          @settingName="sysaru_preloader_min_duration"
          @label="Preloader Min Duration"
          @min={{0}}
          @max={{5000}}
        />
      </AdminConfigAreaCard>
    </div>
  </template>
}

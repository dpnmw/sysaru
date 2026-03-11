import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { action } from "@ember/object";
import { service } from "@ember/service";
import { i18n } from "discourse-i18n";
import { ajax } from "discourse/lib/ajax";
import { on } from "@ember/modifier";
import AdminConfigAreaCard from "admin/components/admin-config-area-card";
import SysaruSettingToggle from "./sysaru/setting-toggle";
import SysaruVerifyBadgeButton from "./sysaru/verify-badge-button";

export default class SysaruAdminSetup extends Component {
  @service siteSettings;
  @tracked badgeVerified = false;
  @tracked verifying = false;
  @tracked verifyError = null;

  constructor() {
    super(...arguments);
    this.checkBadgeStatus();
  }

  async checkBadgeStatus() {
    try {
      const result = await ajax("/sysaru/admin/badge-status");
      this.badgeVerified = result.verified;
    } catch (e) {
      // ignore
    }
  }

  @action
  async verifyBadge() {
    this.verifying = true;
    this.verifyError = null;
    try {
      const result = await ajax("/sysaru/admin/verify-badge");
      this.badgeVerified = result.verified;
      if (!result.verified) {
        this.verifyError =
          result.message || i18n("sysaru.admin.setup.verify_failed");
      }
    } catch (e) {
      this.verifyError = e.message || i18n("sysaru.admin.setup.verify_failed");
    } finally {
      this.verifying = false;
    }
  }

  <template>
    <div class="sysaru-admin-setup">
      <AdminConfigAreaCard
        @heading={{i18n "sysaru.admin.setup.plugin_info"}}
      >
        <div class="sysaru-plugin-info">
          <h3>Sysaru - Welcome Screen</h3>
          <dl class="sysaru-plugin-info__details">
            <dt>{{i18n "sysaru.admin.setup.version"}}</dt>
            <dd>1.0.0</dd>
            <dt>{{i18n "sysaru.admin.setup.author"}}</dt>
            <dd>
              <a
                href="https://dpnmediaworks.com"
                target="_blank"
                rel="noopener noreferrer"
              >DPN MEDiA WORKS</a>
            </dd>
          </dl>
        </div>
      </AdminConfigAreaCard>

      <AdminConfigAreaCard
        @heading={{i18n "sysaru.admin.setup.enable_plugin"}}
      >
        <SysaruSettingToggle
          @settingName="sysaru_enabled"
          @label={{i18n "sysaru.admin.setup.enable_label"}}
          @description={{i18n "sysaru.admin.setup.enable_description"}}
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard
        @heading={{i18n "sysaru.admin.setup.developer"}}
      >
        <div class="sysaru-developer-section">
          {{#if this.badgeVerified}}
            <div class="sysaru-badge-verified">
              <span class="sysaru-badge-verified__icon">&#10003;</span>
              {{i18n "sysaru.admin.setup.badge_verified_message"}}
            </div>
          {{else}}
            <p class="sysaru-developer-section__message">
              {{i18n "sysaru.admin.setup.support_message"}}
            </p>
            <a
              href="https://dpnmediaworks.com/donate"
              target="_blank"
              rel="noopener noreferrer"
              class="btn btn-default"
            >{{i18n "sysaru.admin.setup.support_developer"}}</a>

            <hr class="sysaru-developer-section__divider" />

            <p class="sysaru-developer-section__message">
              {{i18n "sysaru.admin.setup.remove_badge_message"}}
            </p>
            <a
              href="https://dpnmediaworks.com/sysaru/license"
              target="_blank"
              rel="noopener noreferrer"
              class="btn btn-default"
            >{{i18n "sysaru.admin.setup.remove_badge"}}</a>

            <hr class="sysaru-developer-section__divider" />

            <SysaruVerifyBadgeButton
              @verified={{this.badgeVerified}}
              @verifying={{this.verifying}}
              @error={{this.verifyError}}
              @onVerify={{this.verifyBadge}}
            />
          {{/if}}
        </div>
      </AdminConfigAreaCard>
    </div>
  </template>
}

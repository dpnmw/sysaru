import Component from "@glimmer/component";
import { service } from "@ember/service";
import { array } from "@ember/helper";
import AdminConfigAreaCard from "discourse/admin/components/admin-config-area-card";
import SysaruSettingToggle from "./sysaru/setting-toggle";
import SysaruSettingText from "./sysaru/setting-text";
import SysaruSettingColor from "./sysaru/setting-color";
import SysaruSettingEnum from "./sysaru/setting-enum";
import SysaruSettingInteger from "./sysaru/setting-integer";
import SysaruSettingImageUpload from "./sysaru/setting-image-upload";
import SysaruSectionDisabledNotice from "./sysaru/section-disabled-notice";

export default class SysaruAdminAppCta extends Component {
  @service siteSettings;

  get sectionEnabled() {
    return this.siteSettings.sysaru_show_app_ctas;
  }

  <template>
    <div class="sysaru-admin-app-cta">
      {{#unless this.sectionEnabled}}
        <SysaruSectionDisabledNotice @section="App CTA" />
      {{/unless}}

      <AdminConfigAreaCard @heading="sysaru.admin.app_cta.general">
        <:content>
          <SysaruSettingToggle
            @settingName="sysaru_show_app_ctas"
            @label="Show App CTAs"
          />
          <SysaruSettingText
            @settingName="sysaru_app_cta_headline"
            @label="App CTA Headline"
          />
          <SysaruSettingInteger
            @settingName="sysaru_app_cta_title_size"
            @label="App CTA Title Size"
            @min={{0}}
            @max={{80}}
          />
          <SysaruSettingText
            @settingName="sysaru_app_cta_subtext"
            @label="App CTA Subtext"
          />
          <SysaruSettingImageUpload
            @settingName="sysaru_app_cta_image_url"
            @label="App CTA Image URL"
          />
        </:content>
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="sysaru.admin.app_cta.badges">
        <:content>
          <SysaruSettingText
            @settingName="sysaru_ios_app_url"
            @label="iOS App URL"
          />
          <SysaruSettingText
            @settingName="sysaru_android_app_url"
            @label="Android App URL"
          />
          <SysaruSettingImageUpload
            @settingName="sysaru_ios_app_badge_image_url"
            @label="iOS App Badge Image URL"
          />
          <SysaruSettingImageUpload
            @settingName="sysaru_android_app_badge_image_url"
            @label="Android App Badge Image URL"
          />
          <SysaruSettingInteger
            @settingName="sysaru_app_badge_height"
            @label="App Badge Height"
            @min={{30}}
            @max={{80}}
          />
          <SysaruSettingEnum
            @settingName="sysaru_app_badge_style"
            @label="App Badge Style"
            @choices={{(array "rounded" "pill" "square")}}
          />
        </:content>
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="sysaru.admin.app_cta.gradient">
        <:content>
          <SysaruSettingColor
            @settingName="sysaru_app_cta_gradient_start_dark"
            @label="Gradient Start Dark"
          />
          <SysaruSettingColor
            @settingName="sysaru_app_cta_gradient_start_light"
            @label="Gradient Start Light"
          />
          <SysaruSettingColor
            @settingName="sysaru_app_cta_gradient_mid_dark"
            @label="Gradient Mid Dark"
          />
          <SysaruSettingColor
            @settingName="sysaru_app_cta_gradient_mid_light"
            @label="Gradient Mid Light"
          />
          <SysaruSettingColor
            @settingName="sysaru_app_cta_gradient_end_dark"
            @label="Gradient End Dark"
          />
          <SysaruSettingColor
            @settingName="sysaru_app_cta_gradient_end_light"
            @label="Gradient End Light"
          />
          <SysaruSettingColor
            @settingName="sysaru_app_cta_headline_color_dark"
            @label="Headline Color Dark"
          />
          <SysaruSettingColor
            @settingName="sysaru_app_cta_headline_color_light"
            @label="Headline Color Light"
          />
          <SysaruSettingColor
            @settingName="sysaru_app_cta_subtext_color_dark"
            @label="Subtext Color Dark"
          />
          <SysaruSettingColor
            @settingName="sysaru_app_cta_subtext_color_light"
            @label="Subtext Color Light"
          />
        </:content>
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="sysaru.admin.app_cta.styling">
        <:content>
          <SysaruSettingColor
            @settingName="sysaru_app_cta_bg_dark"
            @label="Section Background Dark"
          />
          <SysaruSettingColor
            @settingName="sysaru_app_cta_bg_light"
            @label="Section Background Light"
          />
          <SysaruSettingInteger
            @settingName="sysaru_app_cta_min_height"
            @label="Min Height"
            @min={{0}}
            @max={{2000}}
          />
          <SysaruSettingEnum
            @settingName="sysaru_app_cta_border_style"
            @label="Border Style"
            @choices={{(array "none" "solid" "dashed" "dotted")}}
          />
        </:content>
      </AdminConfigAreaCard>
    </div>
  </template>
}

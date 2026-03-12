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

export default class SysaruAdminAbout extends Component {
  @service siteSettings;

  get sectionEnabled() {
    return this.siteSettings.sysaru_about_enabled;
  }

  <template>
    <div class="sysaru-admin-about">
      {{#unless this.sectionEnabled}}
        <SysaruSectionDisabledNotice @section="About" />
      {{/unless}}

      <AdminConfigAreaCard @heading="sysaru.admin.about.content">
        <SysaruSettingToggle
          @settingName="sysaru_about_enabled"
          @label="About Enabled"
        />
        <SysaruSettingToggle
          @settingName="sysaru_about_heading_enabled"
          @label="About Heading Enabled"
        />
        <SysaruSettingText
          @settingName="sysaru_about_heading"
          @label="About Heading"
        />
        <SysaruSettingText
          @settingName="sysaru_about_title"
          @label="About Title"
        />
        <SysaruSettingInteger
          @settingName="sysaru_about_title_size"
          @label="About Title Size"
          @min={{0}}
          @max={{80}}
        />
        <SysaruSettingText
          @settingName="sysaru_about_role"
          @label="About Role"
        />
        <SysaruSettingText
          @settingName="sysaru_about_body"
          @label="About Body"
        />
        <SysaruSettingImageUpload
          @settingName="sysaru_about_image_url"
          @label="About Image URL"
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="sysaru.admin.about.card_styling">
        <SysaruSettingColor
          @settingName="sysaru_about_card_color_dark"
          @label="Card Color Dark"
        />
        <SysaruSettingColor
          @settingName="sysaru_about_card_color_light"
          @label="Card Color Light"
        />
        <SysaruSettingImageUpload
          @settingName="sysaru_about_background_image_url"
          @label="Background Image URL"
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="sysaru.admin.about.section_styling">
        <SysaruSettingColor
          @settingName="sysaru_about_bg_dark"
          @label="Section Background Dark"
        />
        <SysaruSettingColor
          @settingName="sysaru_about_bg_light"
          @label="Section Background Light"
        />
        <SysaruSettingInteger
          @settingName="sysaru_about_min_height"
          @label="Min Height"
          @min={{0}}
          @max={{2000}}
        />
        <SysaruSettingEnum
          @settingName="sysaru_about_border_style"
          @label="Border Style"
          @choices={{(array "none" "solid" "dashed" "dotted")}}
        />
      </AdminConfigAreaCard>
    </div>
  </template>
}

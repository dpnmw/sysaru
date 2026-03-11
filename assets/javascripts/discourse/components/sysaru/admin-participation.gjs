import Component from "@glimmer/component";
import { service } from "@ember/service";
import { array } from "@ember/helper";
import AdminConfigAreaCard from "admin/components/admin-config-area-card";
import SysaruSettingToggle from "./setting-toggle";
import SysaruSettingText from "./setting-text";
import SysaruSettingColor from "./setting-color";
import SysaruSettingEnum from "./setting-enum";
import SysaruSettingInteger from "./setting-integer";
import SysaruSectionDisabledNotice from "./section-disabled-notice";

export default class SysaruAdminParticipation extends Component {
  @service siteSettings;

  get sectionEnabled() {
    return this.siteSettings.sysaru_participation_enabled;
  }

  <template>
    <div class="sysaru-admin-participation">
      {{#unless this.sectionEnabled}}
        <SysaruSectionDisabledNotice @section="Participation" />
      {{/unless}}

      <AdminConfigAreaCard @heading="General">
        <SysaruSettingToggle
          @settingName="sysaru_participation_enabled"
          @label="Participation Enabled"
        />
        <SysaruSettingToggle
          @settingName="sysaru_participation_title_enabled"
          @label="Participation Title Enabled"
        />
        <SysaruSettingText
          @settingName="sysaru_participation_title"
          @label="Participation Title"
        />
        <SysaruSettingInteger
          @settingName="sysaru_participation_title_size"
          @label="Participation Title Size"
          @min={{0}}
          @max={{80}}
        />
        <SysaruSettingInteger
          @settingName="sysaru_participation_bio_max_length"
          @label="Bio Max Length"
          @min={{50}}
          @max={{500}}
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="Stat Labels">
        <SysaruSettingText
          @settingName="sysaru_participation_topics_label"
          @label="Topics Label"
        />
        <SysaruSettingText
          @settingName="sysaru_participation_posts_label"
          @label="Posts Label"
        />
        <SysaruSettingText
          @settingName="sysaru_participation_likes_label"
          @label="Likes Label"
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="Styling">
        <SysaruSettingColor
          @settingName="sysaru_participation_icon_color"
          @label="Icon Color"
        />
        <SysaruSettingColor
          @settingName="sysaru_participation_card_bg_dark"
          @label="Card Background Dark"
        />
        <SysaruSettingColor
          @settingName="sysaru_participation_card_bg_light"
          @label="Card Background Light"
        />
        <SysaruSettingColor
          @settingName="sysaru_participation_bg_dark"
          @label="Section Background Dark"
        />
        <SysaruSettingColor
          @settingName="sysaru_participation_bg_light"
          @label="Section Background Light"
        />
        <SysaruSettingInteger
          @settingName="sysaru_participation_min_height"
          @label="Min Height"
          @min={{0}}
          @max={{2000}}
        />
        <SysaruSettingEnum
          @settingName="sysaru_participation_border_style"
          @label="Border Style"
          @choices={{(array "none" "solid" "dashed" "dotted")}}
        />
        <SysaruSettingColor
          @settingName="sysaru_participation_stat_color"
          @label="Stat Color"
        />
        <SysaruSettingColor
          @settingName="sysaru_participation_stat_label_color"
          @label="Stat Label Color"
        />
        <SysaruSettingColor
          @settingName="sysaru_participation_bio_color"
          @label="Bio Color"
        />
        <SysaruSettingColor
          @settingName="sysaru_participation_name_color"
          @label="Name Color"
        />
        <SysaruSettingColor
          @settingName="sysaru_participation_meta_color"
          @label="Meta Color"
        />
      </AdminConfigAreaCard>
    </div>
  </template>
}

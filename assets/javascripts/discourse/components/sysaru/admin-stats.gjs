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

export default class SysaruAdminStats extends Component {
  @service siteSettings;

  get sectionEnabled() {
    return this.siteSettings.sysaru_stats_enabled;
  }

  <template>
    <div class="sysaru-admin-stats">
      {{#unless this.sectionEnabled}}
        <SysaruSectionDisabledNotice @section="Stats" />
      {{/unless}}

      <AdminConfigAreaCard @heading="General">
        <SysaruSettingToggle
          @settingName="sysaru_stats_enabled"
          @label="Stats Enabled"
        />
        <SysaruSettingToggle
          @settingName="sysaru_stat_labels_enabled"
          @label="Stat Labels Enabled"
        />
        <SysaruSettingToggle
          @settingName="sysaru_stats_title_enabled"
          @label="Stats Title Enabled"
        />
        <SysaruSettingText
          @settingName="sysaru_stats_title"
          @label="Stats Title"
        />
        <SysaruSettingInteger
          @settingName="sysaru_stats_title_size"
          @label="Stats Title Size"
          @min={{0}}
          @max={{80}}
        />
        <SysaruSettingEnum
          @settingName="sysaru_stat_card_style"
          @label="Stat Card Style"
          @choices={{(array "rectangle" "rounded" "pill" "minimal")}}
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="Labels">
        <SysaruSettingText
          @settingName="sysaru_stat_members_label"
          @label="Members Label"
        />
        <SysaruSettingText
          @settingName="sysaru_stat_topics_label"
          @label="Topics Label"
        />
        <SysaruSettingText
          @settingName="sysaru_stat_posts_label"
          @label="Posts Label"
        />
        <SysaruSettingText
          @settingName="sysaru_stat_likes_label"
          @label="Likes Label"
        />
        <SysaruSettingText
          @settingName="sysaru_stat_chats_label"
          @label="Chats Label"
        />
        <SysaruSettingToggle
          @settingName="sysaru_stat_round_numbers"
          @label="Round Numbers"
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="Card Styling">
        <SysaruSettingColor
          @settingName="sysaru_stat_icon_color"
          @label="Icon Color"
        />
        <SysaruSettingColor
          @settingName="sysaru_stat_icon_bg_color"
          @label="Icon Background Color"
        />
        <SysaruSettingEnum
          @settingName="sysaru_stat_icon_shape"
          @label="Icon Shape"
          @choices={{(array "circle" "rounded")}}
        />
        <SysaruSettingColor
          @settingName="sysaru_stat_counter_color"
          @label="Counter Color"
        />
        <SysaruSettingColor
          @settingName="sysaru_stat_card_bg_dark"
          @label="Card Background Dark"
        />
        <SysaruSettingColor
          @settingName="sysaru_stat_card_bg_light"
          @label="Card Background Light"
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="Section Styling">
        <SysaruSettingColor
          @settingName="sysaru_stats_bg_dark"
          @label="Section Background Dark"
        />
        <SysaruSettingColor
          @settingName="sysaru_stats_bg_light"
          @label="Section Background Light"
        />
        <SysaruSettingInteger
          @settingName="sysaru_stats_min_height"
          @label="Min Height"
          @min={{0}}
          @max={{2000}}
        />
        <SysaruSettingEnum
          @settingName="sysaru_stats_border_style"
          @label="Border Style"
          @choices={{(array "none" "solid" "dashed" "dotted")}}
        />
      </AdminConfigAreaCard>
    </div>
  </template>
}

import Component from "@glimmer/component";
import { service } from "@ember/service";
import { array } from "@ember/helper";
import AdminConfigAreaCard from "discourse/admin/components/admin-config-area-card";
import SysaruSettingToggle from "./sysaru/setting-toggle";
import SysaruSettingText from "./sysaru/setting-text";
import SysaruSettingColor from "./sysaru/setting-color";
import SysaruSettingEnum from "./sysaru/setting-enum";
import SysaruSettingInteger from "./sysaru/setting-integer";
import SysaruSectionDisabledNotice from "./sysaru/section-disabled-notice";

export default class SysaruAdminTopics extends Component {
  @service siteSettings;

  get sectionEnabled() {
    return this.siteSettings.sysaru_topics_enabled;
  }

  <template>
    <div class="sysaru-admin-topics">
      {{#unless this.sectionEnabled}}
        <SysaruSectionDisabledNotice @section="Topics" />
      {{/unless}}

      <AdminConfigAreaCard @heading="sysaru.admin.topics.content">
        <:content>
          <SysaruSettingToggle
            @settingName="sysaru_topics_enabled"
            @label="Topics Enabled"
          />
          <SysaruSettingToggle
            @settingName="sysaru_topics_title_enabled"
            @label="Topics Title Enabled"
          />
          <SysaruSettingText
            @settingName="sysaru_topics_title"
            @label="Topics Title"
          />
          <SysaruSettingInteger
            @settingName="sysaru_topics_title_size"
            @label="Topics Title Size"
            @min={{0}}
            @max={{80}}
          />
          <SysaruSettingInteger
            @settingName="sysaru_topics_count"
            @label="Topics Count"
          />
        </:content>
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="sysaru.admin.topics.styling">
        <:content>
          <SysaruSettingColor
            @settingName="sysaru_topics_card_bg_dark"
            @label="Card Background Dark"
          />
          <SysaruSettingColor
            @settingName="sysaru_topics_card_bg_light"
            @label="Card Background Light"
          />
          <SysaruSettingColor
            @settingName="sysaru_topics_bg_dark"
            @label="Section Background Dark"
          />
          <SysaruSettingColor
            @settingName="sysaru_topics_bg_light"
            @label="Section Background Light"
          />
          <SysaruSettingInteger
            @settingName="sysaru_topics_min_height"
            @label="Min Height"
            @min={{0}}
            @max={{2000}}
          />
          <SysaruSettingEnum
            @settingName="sysaru_topics_border_style"
            @label="Border Style"
            @choices={{(array "none" "solid" "dashed" "dotted")}}
          />
        </:content>
      </AdminConfigAreaCard>
    </div>
  </template>
}

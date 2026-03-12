import Component from "@glimmer/component";
import { service } from "@ember/service";
import { array } from "@ember/helper";
import AdminConfigAreaCard from "discourse/admin/components/admin-config-area-card";
import SysaruSettingText from "./sysaru/setting-text";
import SysaruSettingColor from "./sysaru/setting-color";
import SysaruSettingEnum from "./sysaru/setting-enum";

export default class SysaruAdminFooter extends Component {
  @service siteSettings;

  <template>
    <div class="sysaru-admin-footer">
      <AdminConfigAreaCard @heading="sysaru.admin.footer.content">
        <:content>
          <SysaruSettingText
            @settingName="sysaru_footer_description"
            @label="Footer Description"
          />
          <SysaruSettingText
            @settingName="sysaru_footer_text"
            @label="Footer Text"
          />
          <SysaruSettingText
            @settingName="sysaru_footer_links"
            @label="Footer Links"
            @placeholder='[{"label":"Terms","url":"/tos"}]'
          />
        </:content>
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="sysaru.admin.footer.styling">
        <:content>
          <SysaruSettingColor
            @settingName="sysaru_footer_bg_dark"
            @label="Footer Background Dark"
          />
          <SysaruSettingColor
            @settingName="sysaru_footer_bg_light"
            @label="Footer Background Light"
          />
          <SysaruSettingColor
            @settingName="sysaru_footer_text_color_dark"
            @label="Footer Text Color Dark"
          />
          <SysaruSettingColor
            @settingName="sysaru_footer_text_color_light"
            @label="Footer Text Color Light"
          />
          <SysaruSettingEnum
            @settingName="sysaru_footer_border_style"
            @label="Footer Border Style"
            @choices={{(array "none" "solid" "dashed" "dotted")}}
          />
        </:content>
      </AdminConfigAreaCard>
    </div>
  </template>
}

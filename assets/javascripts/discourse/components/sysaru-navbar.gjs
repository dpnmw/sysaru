import Component from "@glimmer/component";
import { service } from "@ember/service";
import { array } from "@ember/helper";
import AdminConfigAreaCard from "discourse/admin/components/admin-config-area-card";
import SysaruSettingToggle from "./sysaru/setting-toggle";
import SysaruSettingText from "./sysaru/setting-text";
import SysaruSettingColor from "./sysaru/setting-color";
import SysaruSettingEnum from "./sysaru/setting-enum";

export default class SysaruAdminNavbar extends Component {
  @service siteSettings;

  <template>
    <div class="sysaru-admin-navbar">
      <AdminConfigAreaCard @heading="sysaru.admin.navbar.auth_buttons">
        <SysaruSettingText
          @settingName="sysaru_navbar_signin_label"
          @label="Sign In Label"
        />
        <SysaruSettingToggle
          @settingName="sysaru_navbar_signin_enabled"
          @label="Sign In Button Enabled"
        />
        <SysaruSettingColor
          @settingName="sysaru_navbar_signin_color_dark"
          @label="Sign In Color Dark"
        />
        <SysaruSettingColor
          @settingName="sysaru_navbar_signin_color_light"
          @label="Sign In Color Light"
        />
        <SysaruSettingText
          @settingName="sysaru_navbar_join_label"
          @label="Join Label"
        />
        <SysaruSettingToggle
          @settingName="sysaru_navbar_join_enabled"
          @label="Join Button Enabled"
        />
        <SysaruSettingColor
          @settingName="sysaru_navbar_join_color_dark"
          @label="Join Color Dark"
        />
        <SysaruSettingColor
          @settingName="sysaru_navbar_join_color_light"
          @label="Join Color Light"
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="sysaru.admin.navbar.appearance">
        <SysaruSettingColor
          @settingName="sysaru_navbar_bg_color"
          @label="Navbar Background Color"
        />
        <SysaruSettingEnum
          @settingName="sysaru_navbar_border_style"
          @label="Navbar Border Style"
          @choices={{(array "none" "solid" "dashed" "dotted")}}
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="sysaru.admin.navbar.social_links">
        <SysaruSettingText
          @settingName="sysaru_social_twitter_url"
          @label="Twitter URL"
        />
        <SysaruSettingText
          @settingName="sysaru_social_facebook_url"
          @label="Facebook URL"
        />
        <SysaruSettingText
          @settingName="sysaru_social_instagram_url"
          @label="Instagram URL"
        />
        <SysaruSettingText
          @settingName="sysaru_social_youtube_url"
          @label="YouTube URL"
        />
        <SysaruSettingText
          @settingName="sysaru_social_tiktok_url"
          @label="TikTok URL"
        />
        <SysaruSettingText
          @settingName="sysaru_social_github_url"
          @label="GitHub URL"
        />
      </AdminConfigAreaCard>
    </div>
  </template>
}

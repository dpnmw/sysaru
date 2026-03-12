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
import SysaruSettingList from "./sysaru/setting-list";

export default class SysaruAdminHero extends Component {
  @service siteSettings;

  <template>
    <div class="sysaru-admin-hero">
      <AdminConfigAreaCard @heading="sysaru.admin.hero.content">
        <SysaruSettingText
          @settingName="sysaru_hero_title"
          @label="Hero Title"
        />
        <SysaruSettingInteger
          @settingName="sysaru_hero_accent_word"
          @label="Hero Accent Word"
          @min={{0}}
          @max={{50}}
        />
        <SysaruSettingInteger
          @settingName="sysaru_hero_title_size"
          @label="Hero Title Size"
          @min={{0}}
          @max={{120}}
        />
        <SysaruSettingText
          @settingName="sysaru_hero_subtitle"
          @label="Hero Subtitle"
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="sysaru.admin.hero.layout">
        <SysaruSettingToggle
          @settingName="sysaru_hero_card_enabled"
          @label="Hero Card Enabled"
        />
        <SysaruSettingToggle
          @settingName="sysaru_hero_image_first"
          @label="Hero Image First"
        />
        <SysaruSettingInteger
          @settingName="sysaru_hero_image_weight"
          @label="Hero Image Weight"
          @min={{1}}
          @max={{3}}
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="sysaru.admin.hero.images">
        <SysaruSettingImageUpload
          @settingName="sysaru_hero_background_image_url"
          @label="Hero Background Image URL"
        />
        <SysaruSettingImageUpload
          @settingName="sysaru_hero_image_url"
          @label="Hero Image URL"
        />
        <SysaruSettingToggle
          @settingName="sysaru_hero_multiple_images_enabled"
          @label="Multiple Images Enabled"
        />
        <SysaruSettingList
          @settingName="sysaru_hero_image_urls"
          @label="Hero Image URLs"
        />
        <SysaruSettingInteger
          @settingName="sysaru_hero_image_max_height"
          @label="Hero Image Max Height"
          @min={{100}}
          @max={{1200}}
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="sysaru.admin.hero.buttons">
        <SysaruSettingToggle
          @settingName="sysaru_hero_primary_button_enabled"
          @label="Primary Button Enabled"
        />
        <SysaruSettingText
          @settingName="sysaru_hero_primary_button_label"
          @label="Primary Button Label"
        />
        <SysaruSettingText
          @settingName="sysaru_hero_primary_button_url"
          @label="Primary Button URL"
        />
        <SysaruSettingToggle
          @settingName="sysaru_hero_secondary_button_enabled"
          @label="Secondary Button Enabled"
        />
        <SysaruSettingText
          @settingName="sysaru_hero_secondary_button_label"
          @label="Secondary Button Label"
        />
        <SysaruSettingText
          @settingName="sysaru_hero_secondary_button_url"
          @label="Secondary Button URL"
        />
        <SysaruSettingColor
          @settingName="sysaru_hero_primary_btn_color_dark"
          @label="Primary Button Color Dark"
        />
        <SysaruSettingColor
          @settingName="sysaru_hero_primary_btn_color_light"
          @label="Primary Button Color Light"
        />
        <SysaruSettingColor
          @settingName="sysaru_hero_secondary_btn_color_dark"
          @label="Secondary Button Color Dark"
        />
        <SysaruSettingColor
          @settingName="sysaru_hero_secondary_btn_color_light"
          @label="Secondary Button Color Light"
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="sysaru.admin.hero.video">
        <SysaruSettingText
          @settingName="sysaru_hero_video_url"
          @label="Hero Video URL"
        />
        <SysaruSettingColor
          @settingName="sysaru_hero_video_button_color"
          @label="Video Button Color"
        />
        <SysaruSettingToggle
          @settingName="sysaru_hero_video_blur_on_hover"
          @label="Video Blur on Hover"
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="sysaru.admin.hero.section_styling">
        <SysaruSettingColor
          @settingName="sysaru_hero_bg_dark"
          @label="Hero Background Dark"
        />
        <SysaruSettingColor
          @settingName="sysaru_hero_bg_light"
          @label="Hero Background Light"
        />
        <SysaruSettingInteger
          @settingName="sysaru_hero_min_height"
          @label="Hero Min Height"
          @min={{0}}
          @max={{2000}}
        />
        <SysaruSettingEnum
          @settingName="sysaru_hero_border_style"
          @label="Hero Border Style"
          @choices={{(array "none" "solid" "dashed" "dotted")}}
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="sysaru.admin.hero.card_styling">
        <SysaruSettingColor
          @settingName="sysaru_hero_card_bg_dark"
          @label="Hero Card Background Dark"
        />
        <SysaruSettingColor
          @settingName="sysaru_hero_card_bg_light"
          @label="Hero Card Background Light"
        />
        <SysaruSettingText
          @settingName="sysaru_hero_card_opacity"
          @label="Hero Card Opacity"
          @placeholder="0.85"
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="sysaru.admin.hero.contributors">
        <SysaruSettingToggle
          @settingName="sysaru_contributors_enabled"
          @label="Contributors Enabled"
        />
        <SysaruSettingText
          @settingName="sysaru_contributors_title"
          @label="Contributors Title"
        />
        <SysaruSettingToggle
          @settingName="sysaru_contributors_title_enabled"
          @label="Contributors Title Enabled"
        />
        <SysaruSettingText
          @settingName="sysaru_contributors_count_label"
          @label="Contributors Count Label"
        />
        <SysaruSettingToggle
          @settingName="sysaru_contributors_count_label_enabled"
          @label="Contributors Count Label Enabled"
        />
        <SysaruSettingEnum
          @settingName="sysaru_contributors_alignment"
          @label="Contributors Alignment"
          @choices={{(array "center" "left")}}
        />
        <SysaruSettingInteger
          @settingName="sysaru_contributors_pill_max_width"
          @label="Contributors Pill Max Width"
          @min={{200}}
          @max={{600}}
        />
        <SysaruSettingColor
          @settingName="sysaru_contributors_pill_bg_dark"
          @label="Contributors Pill Background Dark"
        />
        <SysaruSettingColor
          @settingName="sysaru_contributors_pill_bg_light"
          @label="Contributors Pill Background Light"
        />
        <SysaruSettingInteger
          @settingName="sysaru_contributors_days"
          @label="Contributors Days"
        />
        <SysaruSettingInteger
          @settingName="sysaru_contributors_count"
          @label="Contributors Count"
        />
      </AdminConfigAreaCard>
    </div>
  </template>
}

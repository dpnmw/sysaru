import Component from "@glimmer/component";
import { service } from "@ember/service";
import { array } from "@ember/helper";
import AdminConfigAreaCard from "discourse/admin/components/admin-config-area-card";
import SysaruSettingToggle from "./sysaru/setting-toggle";
import SysaruSettingText from "./sysaru/setting-text";
import SysaruSettingTextarea from "./sysaru/setting-textarea";
import SysaruSettingColor from "./sysaru/setting-color";
import SysaruSettingEnum from "./sysaru/setting-enum";
import SysaruSettingInteger from "./sysaru/setting-integer";
import SysaruSettingImageUpload from "./sysaru/setting-image-upload";
import SysaruSettingList from "./sysaru/setting-list";
import SysaruSectionDisabledNotice from "./sysaru/section-disabled-notice";

export default class SysaruAdminSplits extends Component {
  @service siteSettings;

  get groupsEnabled() {
    return this.siteSettings.sysaru_groups_enabled;
  }

  get faqEnabled() {
    return this.siteSettings.sysaru_faq_enabled;
  }

  <template>
    <div class="sysaru-admin-splits">
      {{#unless this.groupsEnabled}}
        <SysaruSectionDisabledNotice @section="Community Spaces" />
      {{/unless}}
      {{#unless this.faqEnabled}}
        <SysaruSectionDisabledNotice @section="FAQ" />
      {{/unless}}

      <AdminConfigAreaCard @heading="sysaru.admin.splits.section_styling">
        <SysaruSettingImageUpload
          @settingName="sysaru_splits_background_image_url"
          @label="Splits Background Image URL"
        />
        <SysaruSettingColor
          @settingName="sysaru_splits_bg_dark"
          @label="Section Background Dark"
        />
        <SysaruSettingColor
          @settingName="sysaru_splits_bg_light"
          @label="Section Background Light"
        />
        <SysaruSettingInteger
          @settingName="sysaru_splits_min_height"
          @label="Min Height"
          @min={{0}}
          @max={{800}}
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="sysaru.admin.splits.spaces">
        <SysaruSettingToggle
          @settingName="sysaru_groups_enabled"
          @label="Groups Enabled"
        />
        <SysaruSettingToggle
          @settingName="sysaru_groups_title_enabled"
          @label="Groups Title Enabled"
        />
        <SysaruSettingText
          @settingName="sysaru_groups_title"
          @label="Groups Title"
        />
        <SysaruSettingInteger
          @settingName="sysaru_groups_title_size"
          @label="Groups Title Size"
          @min={{0}}
          @max={{80}}
        />
        <SysaruSettingInteger
          @settingName="sysaru_groups_count"
          @label="Groups Count"
        />
        <SysaruSettingList
          @settingName="sysaru_groups_selected"
          @label="Selected Groups"
        />
        <SysaruSettingToggle
          @settingName="sysaru_groups_show_description"
          @label="Show Description"
        />
        <SysaruSettingInteger
          @settingName="sysaru_groups_description_max_length"
          @label="Description Max Length"
          @min={{30}}
          @max={{500}}
        />
        <SysaruSettingColor
          @settingName="sysaru_groups_card_bg_dark"
          @label="Groups Card Background Dark"
        />
        <SysaruSettingColor
          @settingName="sysaru_groups_card_bg_light"
          @label="Groups Card Background Light"
        />
      </AdminConfigAreaCard>

      <AdminConfigAreaCard @heading="sysaru.admin.splits.faq">
        <SysaruSettingToggle
          @settingName="sysaru_faq_enabled"
          @label="FAQ Enabled"
        />
        <SysaruSettingToggle
          @settingName="sysaru_faq_title_enabled"
          @label="FAQ Title Enabled"
        />
        <SysaruSettingText
          @settingName="sysaru_faq_title"
          @label="FAQ Title"
        />
        <SysaruSettingInteger
          @settingName="sysaru_faq_title_size"
          @label="FAQ Title Size"
          @min={{0}}
          @max={{80}}
        />
        <SysaruSettingTextarea
          @settingName="sysaru_faq_items"
          @label="FAQ Items"
          @rows={{6}}
        />
        <SysaruSettingColor
          @settingName="sysaru_faq_card_bg_dark"
          @label="FAQ Card Background Dark"
        />
        <SysaruSettingColor
          @settingName="sysaru_faq_card_bg_light"
          @label="FAQ Card Background Light"
        />
        <SysaruSettingInteger
          @settingName="sysaru_faq_mobile_max_height"
          @label="FAQ Mobile Max Height"
          @min={{0}}
          @max={{1200}}
        />
      </AdminConfigAreaCard>
    </div>
  </template>
}

import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { action } from "@ember/object";
import { service } from "@ember/service";
import { ajax } from "discourse/lib/ajax";
import { on } from "@ember/modifier";
import SysaruSettingRow from "./setting-row";

export default class SysaruSettingToggle extends Component {
  @service siteSettings;
  @tracked saving = false;

  get value() {
    return this.siteSettings[this.args.settingName];
  }

  @action
  async toggle() {
    if (this.saving) return;
    this.saving = true;
    const newValue = !this.value;
    try {
      await ajax(`/admin/site_settings/${this.args.settingName}`, {
        type: "PUT",
        data: { [this.args.settingName]: newValue },
      });
      this.siteSettings[this.args.settingName] = newValue;
    } catch (e) {
      // revert on error
    } finally {
      this.saving = false;
    }
  }

  <template>
    <SysaruSettingRow
      @settingName={{@settingName}}
      @label={{@label}}
      @description={{@description}}
    >
      <label class="sysaru-toggle">
        <input
          type="checkbox"
          checked={{this.value}}
          {{on "change" this.toggle}}
          disabled={{this.saving}}
        />
        <span class="sysaru-toggle__slider"></span>
      </label>
    </SysaruSettingRow>
  </template>
}

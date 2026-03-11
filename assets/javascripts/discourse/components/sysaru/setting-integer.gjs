import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { action } from "@ember/object";
import { service } from "@ember/service";
import { ajax } from "discourse/lib/ajax";
import { on } from "@ember/modifier";
import SysaruSettingRow from "./setting-row";

export default class SysaruSettingInteger extends Component {
  @service siteSettings;
  @tracked saving = false;
  @tracked localValue = null;

  get value() {
    if (this.localValue !== null) return this.localValue;
    const val = this.siteSettings[this.args.settingName];
    return val !== undefined ? val : 0;
  }

  @action
  onInput(event) {
    this.localValue = parseInt(event.target.value, 10) || 0;
  }

  @action
  async save() {
    if (this.saving) return;
    this.saving = true;
    try {
      await ajax(`/admin/site_settings/${this.args.settingName}`, {
        type: "PUT",
        data: { [this.args.settingName]: this.value },
      });
      this.siteSettings[this.args.settingName] = this.value;
      this.localValue = null;
    } catch (e) {
      // handle error
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
      <input
        type="number"
        value={{this.value}}
        min={{@min}}
        max={{@max}}
        {{on "input" this.onInput}}
        {{on "blur" this.save}}
        class="sysaru-input sysaru-input--number"
      />
    </SysaruSettingRow>
  </template>
}

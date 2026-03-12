import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { action } from "@ember/object";
import { service } from "@ember/service";
import { ajax } from "discourse/lib/ajax";
import { on } from "@ember/modifier";
import { eq } from "truth-helpers";
import SysaruSettingRow from "./setting-row";

export default class SysaruSettingEnum extends Component {
  @service siteSettings;
  @tracked saving = false;

  get value() {
    return this.siteSettings[this.args.settingName] || "";
  }

  @action
  async onChange(event) {
    if (this.saving) return;
    this.saving = true;
    const newValue = event.target.value;
    try {
      await ajax(`/admin/site_settings/${this.args.settingName}`, {
        type: "PUT",
        data: { [this.args.settingName]: newValue },
      });
      this.siteSettings[this.args.settingName] = newValue;
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
      <select
        class="sysaru-select"
        {{on "change" this.onChange}}
        disabled={{this.saving}}
      >
        {{#each @choices as |choice|}}
          <option
            value={{choice}}
            selected={{eq choice this.value}}
          >{{choice}}</option>
        {{/each}}
      </select>
    </SysaruSettingRow>
  </template>
}

import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { action } from "@ember/object";
import { service } from "@ember/service";
import { ajax } from "discourse/lib/ajax";
import { on } from "@ember/modifier";
import SysaruSettingRow from "./setting-row";

export default class SysaruSettingColor extends Component {
  @service siteSettings;
  @tracked saving = false;
  @tracked localValue = null;

  get value() {
    if (this.localValue !== null) return this.localValue;
    return this.siteSettings[this.args.settingName] || "";
  }

  get hexValue() {
    const v = this.value.replace("#", "");
    return v ? `#${v}` : "#000000";
  }

  @action
  onColorInput(event) {
    this.localValue = event.target.value.replace("#", "");
  }

  @action
  onTextInput(event) {
    this.localValue = event.target.value.replace("#", "");
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

  @action
  async clear() {
    this.localValue = "";
    this.saving = true;
    try {
      await ajax(`/admin/site_settings/${this.args.settingName}`, {
        type: "PUT",
        data: { [this.args.settingName]: "" },
      });
      this.siteSettings[this.args.settingName] = "";
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
      <div class="sysaru-color-input">
        <input
          type="color"
          value={{this.hexValue}}
          {{on "input" this.onColorInput}}
          {{on "change" this.save}}
          class="sysaru-color-picker"
        />
        <input
          type="text"
          value={{this.value}}
          {{on "input" this.onTextInput}}
          {{on "blur" this.save}}
          class="sysaru-input sysaru-input--color-text"
          placeholder="hex value"
          maxlength="6"
        />
        {{#if this.value}}
          <button
            type="button"
            class="btn btn-small sysaru-color-clear"
            {{on "click" this.clear}}
          >x</button>
        {{/if}}
      </div>
    </SysaruSettingRow>
  </template>
}

import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { action } from "@ember/object";
import { service } from "@ember/service";
import { ajax } from "discourse/lib/ajax";
import { on } from "@ember/modifier";
import { i18n } from "discourse-i18n";
import SysaruSettingRow from "./setting-row";

export default class SysaruSettingImageUpload extends Component {
  @service siteSettings;
  @tracked uploading = false;
  @tracked localValue = null;

  get value() {
    if (this.localValue !== null) return this.localValue;
    return this.siteSettings[this.args.settingName] || "";
  }

  @action
  onUrlInput(event) {
    this.localValue = event.target.value;
  }

  @action
  async saveUrl() {
    const val = this.value;
    try {
      await ajax(`/admin/site_settings/${this.args.settingName}`, {
        type: "PUT",
        data: { [this.args.settingName]: val },
      });
      this.siteSettings[this.args.settingName] = val;
      this.localValue = null;
    } catch (e) {
      // handle error
    }
  }

  @action
  triggerUpload() {
    const input = document.createElement("input");
    input.type = "file";
    input.accept = "image/*";
    input.onchange = (e) => this.handleUpload(e.target.files[0]);
    input.click();
  }

  async handleUpload(file) {
    if (!file) return;
    this.uploading = true;

    const formData = new FormData();
    formData.append("file", file);
    formData.append("type", "composer");

    try {
      const result = await ajax("/uploads.json", {
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
      });

      const url = result.url || result.short_url;
      this.localValue = url;

      await ajax(`/admin/site_settings/${this.args.settingName}`, {
        type: "PUT",
        data: { [this.args.settingName]: url },
      });
      this.siteSettings[this.args.settingName] = url;

      // Pin the upload
      try {
        const settingShort = this.args.settingName.replace("sysaru_", "");
        await ajax("/sysaru/admin/pin-upload", {
          type: "POST",
          data: { upload_id: result.id, setting_name: settingShort },
        });
      } catch (e) {
        // pin failed, non-critical
      }

      this.localValue = null;
    } catch (e) {
      // handle error
    } finally {
      this.uploading = false;
    }
  }

  @action
  async remove() {
    this.localValue = "";
    try {
      await ajax(`/admin/site_settings/${this.args.settingName}`, {
        type: "PUT",
        data: { [this.args.settingName]: "" },
      });
      this.siteSettings[this.args.settingName] = "";
      this.localValue = null;
    } catch (e) {
      // handle error
    }
  }

  <template>
    <SysaruSettingRow
      @settingName={{@settingName}}
      @label={{@label}}
      @description={{@description}}
    >
      <div class="sysaru-upload">
        <div class="sysaru-upload__url-row">
          <input
            type="text"
            value={{this.value}}
            {{on "input" this.onUrlInput}}
            {{on "blur" this.saveUrl}}
            class="sysaru-input"
            placeholder="Image URL"
          />
          <button
            type="button"
            class="btn btn-default sysaru-upload__btn"
            {{on "click" this.triggerUpload}}
            disabled={{this.uploading}}
          >
            {{#if this.uploading}}
              {{i18n "sysaru.admin.upload.uploading"}}
            {{else}}
              {{i18n "sysaru.admin.upload.button"}}
            {{/if}}
          </button>
          {{#if this.value}}
            <button
              type="button"
              class="btn btn-danger sysaru-upload__remove"
              {{on "click" this.remove}}
            >{{i18n "sysaru.admin.upload.remove"}}</button>
          {{/if}}
        </div>
        {{#if this.value}}
          <div class="sysaru-upload__preview">
            <img src={{this.value}} alt="Preview" />
          </div>
        {{/if}}
      </div>
    </SysaruSettingRow>
  </template>
}

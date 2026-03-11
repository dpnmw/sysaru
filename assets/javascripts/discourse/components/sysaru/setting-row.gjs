import Component from "@glimmer/component";
import { i18n } from "discourse-i18n";

export default class SysaruSettingRow extends Component {
  <template>
    <div class="sysaru-setting-row" data-setting={{@settingName}}>
      <div class="sysaru-setting-row__label">
        <h4>{{@label}}</h4>
      </div>
      <div class="sysaru-setting-row__control">
        {{yield}}
      </div>
      {{#if @description}}
        <div class="sysaru-setting-row__desc">{{@description}}</div>
      {{/if}}
    </div>
  </template>
}

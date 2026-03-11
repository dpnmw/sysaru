import Component from "@glimmer/component";
import { i18n } from "discourse-i18n";
import { on } from "@ember/modifier";

export default class SysaruVerifyBadgeButton extends Component {
  <template>
    <div class="sysaru-verify-badge">
      {{#if @verified}}
        <div class="sysaru-verify-badge__success">
          {{i18n "sysaru.admin.setup.verify_success"}}
        </div>
      {{else}}
        <button
          type="button"
          class="btn btn-primary"
          {{on "click" @onVerify}}
          disabled={{@verifying}}
        >
          {{#if @verifying}}
            {{i18n "sysaru.admin.setup.verify_checking"}}
          {{else}}
            {{i18n "sysaru.admin.setup.verify_payment"}}
          {{/if}}
        </button>
        {{#if @error}}
          <div class="sysaru-verify-badge__error">{{@error}}</div>
        {{/if}}
      {{/if}}
    </div>
  </template>
}

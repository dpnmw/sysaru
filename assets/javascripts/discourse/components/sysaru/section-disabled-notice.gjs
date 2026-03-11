import Component from "@glimmer/component";
import { i18n } from "discourse-i18n";

export default class SysaruSectionDisabledNotice extends Component {
  get message() {
    return i18n("sysaru.admin.disabled_notice", {
      section: this.args.section || "This section",
    });
  }

  <template>
    <div class="sysaru-disabled-notice">
      {{this.message}}
    </div>
  </template>
}

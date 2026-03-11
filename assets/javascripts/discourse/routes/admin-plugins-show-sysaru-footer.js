import DiscourseRoute from "discourse/routes/discourse";
import { i18n } from "discourse-i18n";

export default class AdminPluginsShowSysaruFooterRoute extends DiscourseRoute {
  titleToken() {
    return i18n("sysaru.admin.tabs.footer");
  }
}

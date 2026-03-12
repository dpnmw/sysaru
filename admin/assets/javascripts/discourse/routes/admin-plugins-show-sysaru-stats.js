import DiscourseRoute from "discourse/routes/discourse";
import SiteSetting from "discourse/admin/models/site-setting";
import SiteSettingFilter from "discourse/admin/lib/site-setting-filter";

export default class AdminPluginsShowSysaruStatsRoute extends DiscourseRoute {
  async model() {
    const allSettings = await SiteSetting.findAll();
    const filter = new SiteSettingFilter(allSettings);
    return filter.filterSettings("sysaru_stat", {});
  }
}

import { withPluginApi } from "discourse/lib/plugin-api";

export default {
  name: "sysaru-admin-plugin-configuration-nav",

  initialize(container) {
    const currentUser = container.lookup("service:current-user");
    if (!currentUser || !currentUser.admin) {
      return;
    }

    withPluginApi("1.1.0", (api) => {
      api.addAdminPluginConfigurationNav("sysaru", [
        {
          label: "sysaru.admin.tabs.navbar",
          route: "adminPlugins.show.sysaru-navbar",
        },
        {
          label: "sysaru.admin.tabs.hero",
          route: "adminPlugins.show.sysaru-hero",
        },
        {
          label: "sysaru.admin.tabs.participation",
          route: "adminPlugins.show.sysaru-participation",
        },
        {
          label: "sysaru.admin.tabs.stats",
          route: "adminPlugins.show.sysaru-stats",
        },
        {
          label: "sysaru.admin.tabs.about",
          route: "adminPlugins.show.sysaru-about",
        },
        {
          label: "sysaru.admin.tabs.topics",
          route: "adminPlugins.show.sysaru-topics",
        },
        {
          label: "sysaru.admin.tabs.splits",
          route: "adminPlugins.show.sysaru-splits",
        },
        {
          label: "sysaru.admin.tabs.app_cta",
          route: "adminPlugins.show.sysaru-app-cta",
        },
        {
          label: "sysaru.admin.tabs.footer",
          route: "adminPlugins.show.sysaru-footer",
        },
      ]);
    });
  },
};

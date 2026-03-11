export default {
  resource: "admin.adminPlugins.show",
  path: "/plugins",
  map() {
    this.route("sysaru-navbar", { path: "navbar" });
    this.route("sysaru-hero", { path: "hero" });
    this.route("sysaru-participation", { path: "participation" });
    this.route("sysaru-stats", { path: "stats" });
    this.route("sysaru-about", { path: "about" });
    this.route("sysaru-topics", { path: "topics" });
    this.route("sysaru-splits", { path: "splits" });
    this.route("sysaru-app-cta", { path: "app-cta" });
    this.route("sysaru-footer", { path: "footer" });
  },
};

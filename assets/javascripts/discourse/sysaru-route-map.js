export default {
  resource: "admin.adminPlugins.show",
  path: "/plugins",
  map() {
    this.route("sysaru", { path: "sysaru" }, function () {
      this.route("setup", { path: "/" });
      this.route("settings", { path: "/settings" });
      this.route("navbar", { path: "/navbar" });
      this.route("hero", { path: "/hero" });
      this.route("participation", { path: "/participation" });
      this.route("stats", { path: "/stats" });
      this.route("about", { path: "/about" });
      this.route("topics", { path: "/topics" });
      this.route("splits", { path: "/splits" });
      this.route("app-cta", { path: "/app-cta" });
      this.route("footer", { path: "/footer" });
    });
  },
};

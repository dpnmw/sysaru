import Component from "@glimmer/component";
import { i18n } from "discourse-i18n";
import NavItem from "discourse/components/nav-item";
import DPageHeader from "discourse/components/d-page-header";
import DBreadcrumbsItem from "discourse/components/d-breadcrumbs-item";

export default class SysaruAdminLayout extends Component {
  <template>
    <div class="sysaru-admin">
      <DPageHeader
        @titleLabel={{i18n "sysaru.admin.title"}}
        @descriptionLabel={{i18n "sysaru.admin.description"}}
      >
        <:breadcrumbs>
          <DBreadcrumbsItem
            @path="/admin/plugins/sysaru"
            @label={{i18n "sysaru.admin.title"}}
          />
        </:breadcrumbs>
        <:tabs>
          <NavItem
            @route="adminPlugins.show.sysaru.setup"
            @label="sysaru.admin.tabs.setup"
            class="sysaru-tab"
          />
          <NavItem
            @route="adminPlugins.show.sysaru.settings"
            @label="sysaru.admin.tabs.settings"
            class="sysaru-tab"
          />
          <NavItem
            @route="adminPlugins.show.sysaru.navbar"
            @label="sysaru.admin.tabs.navbar"
            class="sysaru-tab"
          />
          <NavItem
            @route="adminPlugins.show.sysaru.hero"
            @label="sysaru.admin.tabs.hero"
            class="sysaru-tab"
          />
          <NavItem
            @route="adminPlugins.show.sysaru.participation"
            @label="sysaru.admin.tabs.participation"
            class="sysaru-tab"
          />
          <NavItem
            @route="adminPlugins.show.sysaru.stats"
            @label="sysaru.admin.tabs.stats"
            class="sysaru-tab"
          />
          <NavItem
            @route="adminPlugins.show.sysaru.about"
            @label="sysaru.admin.tabs.about"
            class="sysaru-tab"
          />
          <NavItem
            @route="adminPlugins.show.sysaru.topics"
            @label="sysaru.admin.tabs.topics"
            class="sysaru-tab"
          />
          <NavItem
            @route="adminPlugins.show.sysaru.splits"
            @label="sysaru.admin.tabs.splits"
            class="sysaru-tab"
          />
          <NavItem
            @route="adminPlugins.show.sysaru.app-cta"
            @label="sysaru.admin.tabs.app_cta"
            class="sysaru-tab"
          />
          <NavItem
            @route="adminPlugins.show.sysaru.footer"
            @label="sysaru.admin.tabs.footer"
            class="sysaru-tab"
          />
        </:tabs>
      </DPageHeader>

      <div class="admin-config-page__main-area">
        {{outlet}}
      </div>
    </div>
  </template>
}

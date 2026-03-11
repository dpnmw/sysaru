<p align="center">
  <img src="https://dpnmediaworks.com/assets/sysaru-banner.png" alt="Sysaru - Welcome Screen" width="100%" />
</p>

<h1 align="center">Sysaru - Welcome Screen</h1>

<p align="center">
  A branded public welcome screen plugin for <a href="https://www.discourse.org/">Discourse</a><br/>
  Built with native Ember/Glimmer admin UI following official Discourse plugin architecture
</p>

<p align="center">
  <img src="https://img.shields.io/badge/version-1.0.0-blue?style=flat-square" alt="Version" />
  <img src="https://img.shields.io/badge/discourse-3.2%2B-brightgreen?style=flat-square" alt="Discourse 3.2+" />
  <img src="https://img.shields.io/badge/ruby-3.1%2B-red?style=flat-square" alt="Ruby 3.1+" />
  <img src="https://img.shields.io/badge/license-custom-orange?style=flat-square" alt="License" />
</p>

<p align="center">
  <strong>Author:</strong> <a href="https://dpnmediaworks.com">DPN MEDiA WORKS</a>
</p>

---

## Overview

Sysaru replaces the default Discourse homepage for logged-out visitors with a modern, fully customizable landing page. The page is **server-rendered** for fast load times and SEO, while the admin interface uses Discourse's native Ember components (`DPageHeader`, `AdminConfigAreaCard`, `NavItem`) for a seamless admin experience.

> **176+ settings** across **11 admin tabs** — every section is fully customizable without touching code.

---

## What Visitors See

| Section | Description |
|---------|-------------|
| **Hero** | Headline with accent animation, subtitle, CTA buttons, images, video lightbox |
| **Top Creators** | Gold, silver, and bronze ranked contributors in the hero area |
| **Stats** | Animated counters for members, topics, posts, likes, and chats |
| **About** | Community description card with author attribution and avatar |
| **Participation** | Leaderboard bio cards for positions 4-10 |
| **Trending** | Horizontally scrollable topic cards with drag-to-scroll |
| **Spaces** | Public groups grid with colored icons and member counts |
| **FAQ** | Collapsible accordion with JSON-configured Q&A pairs |
| **App CTA** | Gradient banner with iOS/Android download badges |
| **Footer** | Logo, navigation links, copyright, and custom HTML |

---

## What Admins Get

| Feature | Details |
|---------|---------|
| **11-Tab Admin Panel** | Setup, Settings, Navbar, Hero, Participation, Stats, About, Topics, Splits, App CTA, Footer |
| **Native Ember UI** | `DPageHeader` headers, `AdminConfigAreaCard` groupings, `NavItem` tab navigation |
| **Image Uploads** | Upload button with preview, automatic Discourse upload pinning |
| **Dark/Light Support** | Per-section color overrides for both color schemes |
| **Conditional Visibility** | Disabled sections automatically hide their configuration settings |
| **Badge Verification** | One-click domain verification for badge removal |

---

## Installation

Add the plugin to your Discourse `app.yml`:

```yaml
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - git clone https://github.com/dpnmw/sysaru.git
```

Rebuild your container:

```bash
cd /var/discourse
./launcher rebuild app
```

---

## Quick Start

1. Navigate to **Admin > Plugins > Welcome Screen**
2. On the **Setup** tab, toggle **Enable** on
3. Switch to **Settings** and configure your accent color and logo
4. Customize each section tab as needed
5. Visit your site logged out to preview the landing page

---

## Admin Tabs

### Setup

The landing page for the admin panel. Contains:

- **Plugin Information** — name, version, author link
- **Enable Plugin** — master on/off toggle
- **Developer** — support/donate link, badge removal purchase, payment verification

---

### Settings

Global configuration organized into cards:

| Card | Settings |
|------|----------|
| **Layout & Section Order** | Drag-to-reorder sections, custom CSS injection |
| **SEO & Meta Tags** | Meta description, Open Graph image, favicon, JSON-LD |
| **Branding & Logo** | Dark/light mode logos, logo height, accent tint, footer logo |
| **Color Scheme** | Accent colors, background colors, orb colors and opacity |
| **Scroll Animations** | Animation style (fade, slide, zoom, flip), staggered reveal, parallax |
| **Fonts** | Google Font for body text, separate font for titles |
| **Icon Library** | None, FontAwesome 6, or Google Material Symbols |
| **Preloader** | Loading overlay with logo, progress bar, custom colors |

---

### Navbar

| Card | Settings |
|------|----------|
| **Auth Buttons** | Sign-in/join labels, enable toggles, dark/light colors |
| **Appearance** | Background color, bottom border style |
| **Social Links** | Twitter/X, Facebook, Instagram, YouTube, TikTok, GitHub URLs |

---

### Hero

| Card | Settings |
|------|----------|
| **Content** | Title, accent word position, title size, subtitle |
| **Layout** | Card mode toggle, image-first toggle, image weight |
| **Images** | Background image, hero image, multi-image rotation, max height |
| **Buttons** | Primary/secondary enable, labels, URLs, dark/light colors |
| **Video** | Video URL (MP4/YouTube), play button color, blur-on-hover |
| **Section Styling** | Background colors, min height, border style |
| **Card Styling** | Card background colors, opacity |
| **Contributors** | Enable, title, count label, alignment, pill width, lookback days |

---

### Participation

| Card | Settings |
|------|----------|
| **General** | Enable, title, title size, bio max length |
| **Stat Labels** | Topics/posts/likes label text |
| **Styling** | Icon color, card/section backgrounds, border, stat/label/bio/name/meta colors |

---

### Stats

| Card | Settings |
|------|----------|
| **General** | Enable, labels toggle, title toggle, title text, card style |
| **Labels** | Custom labels for members, topics, posts, likes, chats; number rounding |
| **Card Styling** | Icon color, icon background, icon shape, counter color, card backgrounds |
| **Section Styling** | Section backgrounds, min height, border style |

---

### About

| Card | Settings |
|------|----------|
| **Content** | Enable, heading, title, role, body (HTML), avatar image |
| **Card Styling** | Card colors, background image |
| **Section Styling** | Section backgrounds, min height, border style |

---

### Topics

| Card | Settings |
|------|----------|
| **Content** | Enable, title, topic count |
| **Styling** | Card/section backgrounds, min height, border style |

---

### Splits

| Card | Settings |
|------|----------|
| **Section Background** | Background image, dark/light colors, min height |
| **Community Spaces** | Enable, title, count, selected groups, descriptions, card colors |
| **FAQ Accordion** | Enable, title, JSON items, card colors, mobile max height |

---

### App CTA

| Card | Settings |
|------|----------|
| **General** | Enable, headline, subtext, promotional image |
| **Badges** | iOS/Android URLs, custom badge images, badge height/style |
| **Gradient** | 6-stop gradient (start/mid/end) for dark and light modes |
| **Section Styling** | Headline/subtext colors, section backgrounds, border style |

---

### Footer

| Card | Settings |
|------|----------|
| **Content** | Description paragraph, HTML text, navigation links (JSON) |
| **Styling** | Background colors, text colors, border style |

---

## Color System

Most visual elements support separate dark and light mode colors using the `_dark` / `_light` suffix pattern:

```
sysaru_hero_bg_dark       → Hero background in dark mode
sysaru_hero_bg_light      → Hero background in light mode
sysaru_stat_card_bg_dark  → Stat card background in dark mode
sysaru_stat_card_bg_light → Stat card background in light mode
```

Leave color fields blank to inherit from the default theme. The plugin uses CSS custom properties (`--cl-*`) for consistent theming across all sections.

---

## Theme Support

- Automatic detection via `prefers-color-scheme` media query
- Manual toggle via the theme switcher button in the navbar
- Per-section color overrides for both dark and light modes
- Smooth transitions between themes

---

## Developer Badge

Sysaru is **free to use**. A small developer attribution badge appears in the bottom-right corner of the landing page.

### Removing the Badge

| Step | Action |
|------|--------|
| **1** | Visit [dpnmediaworks.com/sysaru/license](https://dpnmediaworks.com/sysaru/license) to purchase a badge removal license |
| **2** | In Discourse admin, go to **Plugins > Welcome Screen > Setup** |
| **3** | Click **Verify Payment** |
| **4** | The plugin verifies your domain and permanently removes the badge |

> Badge removal is **per-domain** and **one-time** — no recurring checks or subscriptions.

### License Terms

The badge must remain visible unless a removal license is purchased. Hiding, removing, or obscuring the badge through any means (CSS, JavaScript, code modification, forking, etc.) without a valid license is a violation of the [license terms](LICENSE). See the LICENSE file for full details.

---

## Technical Architecture

### Server-Side

| File | Purpose |
|------|---------|
| `plugin.rb` | Plugin registration, controllers, routes |
| `lib/sysaru/page_builder.rb` | Server-rendered HTML generation |
| `lib/sysaru/style_builder.rb` | Dynamic CSS custom properties from settings |
| `lib/sysaru/data_fetcher.rb` | Database queries (contributors, groups, topics, stats) |
| `lib/sysaru/helpers.rb` | HTML escaping, hex color utilities |
| `lib/sysaru/icons.rb` | SVG icon constants |

### Client-Side

| Directory | Count | Purpose |
|-----------|-------|---------|
| `components/sysaru/` | 22 files | Glimmer components (11 tab pages + 11 reusable controls) |
| `routes/` | 12 files | Ember route definitions (parent + 11 sub-routes) |
| `templates/` | 12 files | Route templates (`.gjs` format) |
| `sysaru-route-map.js` | 1 file | Admin route tree registration |

### API Endpoints

| Endpoint | Method | Auth | Purpose |
|----------|--------|------|---------|
| `/` | GET | Public | Landing page (unauthenticated visitors only) |
| `/sysaru/admin/pin-upload` | POST | Admin | Pin uploaded images to prevent garbage collection |
| `/sysaru/admin/verify-badge` | GET | Admin | Verify domain for badge removal |
| `/sysaru/admin/badge-status` | GET | Admin | Check current badge verification status |

---

## Browser Support

| Browser | Minimum Version |
|---------|----------------|
| Chrome | 90+ |
| Firefox | 90+ |
| Safari | 14+ |
| Edge | 90+ |
| Mobile Safari | iOS 14+ |
| Chrome Android | 90+ |

---

## Requirements

| Dependency | Version |
|------------|---------|
| Discourse | 3.2+ |
| Ruby | 3.1+ |

---

## Support

| Channel | Link |
|---------|------|
| Issues | [GitHub Issues](https://github.com/dpnmw/sysaru/issues) |
| Website | [dpnmediaworks.com](https://dpnmediaworks.com) |
| Email | hello@dpnmediaworks.com |

---

<p align="center">
  <strong>Sysaru - Welcome Screen</strong><br/>
  Copyright &copy; 2026 <a href="https://dpnmediaworks.com">DPN MEDiA WORKS</a><br/>
  <em>See <a href="LICENSE">LICENSE</a> for details.</em>
</p>

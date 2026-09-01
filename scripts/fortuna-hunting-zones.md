# CB Studios — Fortuna Hunting Zones

<div style="text-align: center;">
  <img src="https://img.shields.io/badge/CB%20Studios-RedM%20Development-blue?style=for-the-badge" alt="CB Studios" />
  <img src="https://img.shields.io/badge/version-4.0.4-green?style=for-the-badge" alt="Version 4.0.4" />
  <img src="https://img.shields.io/badge/status-stable-brightgreen?style=for-the-badge" alt="Stable" />
  <img src="https://img.shields.io/badge/framework-VORP-orange?style=for-the-badge" alt="VORP" />
</div>

------------------------------------------------------------------------

# 📖 Overview

| Field | Value |
| --- | --- |
| Resource | `fortuna_huntingzones` |
| Author | **CB Studios** / `pichirin_cb` |
| Platform | RedM |
| Framework | VORP |
| Version | `4.0.4` |
| Status | Stable |
| Database | oxmysql |
| License | GPL-3.0-or-later |

### Description

> Fortuna Hunting Zones is a collaborative hunting heatmap for RedM. It detects configured groups of nearby wild animals, converts observations into anonymous grid cells and shares recent activity only with players close enough to use it.

The resource does not expose exact animal positions. Reports are validated by the server, grouped into configurable cells, filtered per character and removed as observations become stale.

------------------------------------------------------------------------

# ✨ Features

- Collaborative detection of locally streamed animal herds.
- Native green, yellow and red heat areas on the RedM map.
- Configurable species allowlist and minimum herd size per species.
- Category filters for big game, predators, medium game and small game.
- Individual-species filtering.
- Persistent visibility and filters for each VORP character.
- Built-in `vorp_menu` integration and custom-menu bridge.
- Six included locales: English, Portuguese, French, German, Spanish and Romanian.
- Native client-side town exclusion and server-side boundary validation.
- Anonymous grid coordinates and proximity-only heatmap synchronization.
- Score decay and strict stale-observation expiry.
- Rate-limited reports, requests and preference changes.
- Public client, shared and server exports.
- Bounded client/server cell collections for predictable resource usage.

------------------------------------------------------------------------

# 📦 Requirements

| Requirement | Details |
| --- | --- |
| RedM server | Current artifact with OneSync enabled |
| Framework | `vorp_core` |
| Database | `oxmysql` |
| Menu | `vorp_menu` by default; custom and disabled modes supported |

Required resources:

- `oxmysql`
- `vorp_core`

Optional resource:

- `vorp_menu`, when `Config.Bridge.Menu.Provider = 'vorp_menu'`

The manifest declares `vorp_core` and `oxmysql` as dependencies. The default menu provider also requires `vorp_menu` to be started before Fortuna Hunting Zones.

------------------------------------------------------------------------

# 📥 Installation

### 1️⃣ Download

Download the resource and extract it without changing its internal structure.

### 2️⃣ Place it in the resources folder

```text
resources/[cb-studios]/fortuna_huntingzones
```

The supported folder names are:

- `fortuna_huntingzones` — recommended.
- `fortuna-huntingzones` — accepted for legacy compatibility.

Other folder names fail resource validation and stop the script.

### 3️⃣ Install the database table

Import:

```text
INSTALL_FILES/fortuna_huntingzones.sql
```

The resource also creates the table and adds the filter column automatically when persistence is enabled. Manual import is recommended for a controlled deployment.

### 4️⃣ Add it to `server.cfg`

```cfg
## CB Studios
ensure oxmysql
ensure vorp_core
ensure vorp_menu
ensure fortuna_huntingzones
```

Remove the `vorp_menu` line only when using the custom bridge or disabling the menu.

### 5️⃣ Configure

Review `shared/config.lua` before starting the resource. Pay particular attention to locale, persistence, menu provider, species, heatmap thresholds, commands and hunting boundaries.

### 6️⃣ Restart and verify

```text
restart fortuna_huntingzones
```

The server console should display a successful CB Studios resource-name validation followed by normal resource startup. Review any configuration assertion or database error before allowing players to use it.

------------------------------------------------------------------------

# ⚙️ Configuration

The configuration file is `shared/config.lua`.

### Core settings

```lua
Config.Locale = "es" -- en / pt / fr / de / es / ro
Config.Debug = false
```

| Option | Description |
| --- | --- |
| `Locale` | Selects the included translation table. |
| `Debug` | Exposes the configured debug state in startup validation output. |

### Persistence

```lua
Config.Persistence = {
    Enabled = true,
    Table = "fortuna_huntingzones_preferences",
    DefaultVisible = false,
    RateLimitWindow = 10,
    MaxActionsPerWindow = 8,
    FilterSaveDebounce = 750
}
```

| Option | Description |
| --- | --- |
| `Enabled` | Saves visibility and filters by VORP character. |
| `Table` | SQL table name; only letters, numbers and underscores are accepted. |
| `DefaultVisible` | Initial visibility for a character without a saved preference. |
| `RateLimitWindow` | Rolling preference-action window in seconds. |
| `MaxActionsPerWindow` | Maximum accepted preference actions in the window. |
| `FilterSaveDebounce` | Client filter-save debounce in milliseconds. |

### Menu bridge

```lua
Config.Bridge = {
    Menu = {
        Enabled = true,
        Provider = 'vorp_menu', -- vorp_menu / custom / none
        CustomOpenEvent = 'fortuna_huntingzones:custom:openMenu'
    }
}
```

| Provider | Behavior |
| --- | --- |
| `vorp_menu` | Uses the included category/species menu implementation. |
| `custom` | Emits `CustomOpenEvent` so another client UI can take over. |
| `none` | Disables the menu; toggle and status commands remain available. |

### Species

Each supported model requires a unique key, display name, valid category and positive minimum group size:

```lua
Config.Species[1110710183] = {
    key = 'deer',
    name = 'Deer',
    category = 'big_game',
    minGroup = 3
}
```

Animals are clustered by exact model. Different species never combine to satisfy `minGroup`.

### Heatmap

```lua
Config.Heatmap.ScanInterval = 8000
Config.Heatmap.SyncInterval = 15000
Config.Heatmap.ScanRadius = 350.0
Config.Heatmap.HerdLinkDistance = 70.0
Config.Heatmap.CellSize = 90.0
Config.Heatmap.Lifetime = 180
Config.Heatmap.StaleAfter = 75
Config.Heatmap.RevealDistance = 1200.0
Config.Heatmap.MaxVisibleCells = 30
Config.Heatmap.MaxServerCells = 160
```

Scan, render and synchronization intervals use milliseconds. Lifetime, stale age and network cooldowns use seconds.

Heat styles must remain in ascending threshold order:

```lua
Config.Heatmap.Styles = {
    { threshold = 3.0,  locale = 'heat_weak',   style = joaat('BLIP_STYLE_DEBUG_GREEN'),  radius = 28.0 },
    { threshold = 10.0, locale = 'heat_recent', style = joaat('BLIP_STYLE_DEBUG_YELLOW'), radius = 38.0 },
    { threshold = 22.0, locale = 'heat_herd',   style = joaat('BLIP_STYLE_DEBUG_RED'),    radius = 50.0 }
}
```

### Boundaries

- `Config.HuntingRegions` defines internal report-validation areas; these are not rendered as fixed circles.
- `Config.TownExclusion` uses the native RDR2 `TOWN` zones on clients.
- `Config.ServerTownCores` rejects obvious forged urban reports on the server.

------------------------------------------------------------------------

# 🎮 Usage

### Commands

| Command | Description | Permission |
| --- | --- | --- |
| `/mapacaza` | Enables or disables the hunting heatmap. | Everyone |
| `/menucaza` | Opens category and species filters. | Everyone |
| `/caza` | Refreshes the display and reports nearby activity. | Everyone |

Command names can be changed under `Config.Commands`.

### Player workflow

1. Select a VORP character.
2. Enable the heatmap with `/mapacaza` or from `/menucaza`.
3. Select category or individual-species filters.
4. Explore a configured hunting region outside blocked towns.
5. Nearby qualifying herds contribute anonymous observations.
6. Recent shared activity appears as colored map areas within reveal distance.

No custom keybind is registered by the resource. Server owners or players may map commands through supported RedM console/key-mapping features outside this script.

------------------------------------------------------------------------

# 🔌 Developer Integration

## Shared export

```lua
local localeName, localeTable = exports.fortuna_huntingzones:GetLocale()
```

| Export | Side | Description |
| --- | --- | --- |
| `GetLocale` | Shared | Returns the selected locale name and translation table. |

## Client exports

```lua
local cells = exports.fortuna_huntingzones:GetNearbyHeatCells()
local enabled = exports.fortuna_huntingzones:IsHeatmapEnabled()
local filters = exports.fortuna_huntingzones:GetHuntingFilters()
exports.fortuna_huntingzones:OpenHuntingMenu()
```

| Export | Side | Description |
| --- | --- | --- |
| `GetNearbyHeatCells` | Client | Returns the cells currently available to the player. |
| `IsHeatmapEnabled` | Client | Returns the local heatmap visibility state. |
| `GetHuntingFilters` | Client | Returns the active category/species filters. |
| `OpenHuntingMenu` | Client | Opens the configured hunting menu provider. |

## Server export

```lua
local cells = exports.fortuna_huntingzones:GetHeatmap()
```

| Export | Side | Description |
| --- | --- | --- |
| `GetHeatmap` | Server | Returns the sanitized, decayed and merged public heatmap. |

Treat returned tables as read-only.

## Custom menu events

Open a custom interface by listening for the configured local client event:

```lua
AddEventHandler('fortuna_huntingzones:custom:openMenu', function(enabled, filters)
    -- Open your custom UI.
end)
```

Return sanitized choices through the local client event:

```lua
TriggerEvent('fortuna_huntingzones:client:setCustomFilters', {
    mode = 'categories',
    categories = {
        big_game = true,
        predators = false,
        medium_game = true,
        small_game = false
    },
    species = {}
})
```

Unknown keys are discarded. Do not call the internal network report or preference events from external client resources as an integration API.

------------------------------------------------------------------------

# 🔐 Security and Privacy

- Herd reports are treated as untrusted client input.
- The server validates report type, numeric values, model, group size, distance and boundaries.
- At most eight reports are processed from one accepted report event.
- Individual score contributions and event frequency are capped.
- Coordinates are anonymized into configured grid cells.
- Players receive only heat cells near their current location.
- Species layers are filtered and merged before public delivery.
- Preference inputs are allowlisted, sanitized, debounced and rate-limited.
- Server and client collections have hard size limits.

Ambient animals are client-streamed entities, so no RedM resource can independently guarantee every client observation. Use normal server anti-cheat and monitoring practices alongside this resource.

------------------------------------------------------------------------

# 🧪 Debugging & Common Issues

### Resource does not start

- Confirm the folder is named `fortuna_huntingzones` or the accepted legacy `fortuna-huntingzones`.
- Check that `oxmysql` and `vorp_core` start first.
- Review the console for configuration validation errors.
- Confirm every file declared by `fxmanifest.lua` exists.

### Database errors

- Verify the oxmysql connection credentials and selected database.
- Import `INSTALL_FILES/fortuna_huntingzones.sql`.
- Confirm the active VORP character provides a `charIdentifier`.
- Use only letters, numbers and underscores in `Config.Persistence.Table`.

### Menu is unavailable

- Confirm `Config.Bridge.Menu.Enabled = true`.
- Start `vorp_menu` before this resource when using the default provider.
- When using `custom`, register a handler for `CustomOpenEvent`.

### No heat areas appear

- Enable the map with `/mapacaza`.
- Check the active filters with `/menucaza`.
- Confirm the player is inside a hunting region and outside an excluded town.
- Confirm the animal model is listed in `Config.Species`.
- Ensure enough animals of the exact same model meet the configured `minGroup`.
- Remember that activity is only delivered inside `RevealDistance` and expires after `StaleAfter`.

### Map areas are too strong or expire too quickly

- Review `Styles`, `MaxReportContribution`, `Lifetime` and `StaleAfter` together.
- Keep style thresholds in ascending order.
- Avoid very short scan/sync intervals that create unnecessary client, server and network load.

------------------------------------------------------------------------

# 🔄 Updating the Script

1. Back up `shared/config.lua` and the preference table.
2. Stop `fortuna_huntingzones`.
3. Read `CHANGELOG.md` and compare configuration changes.
4. Replace the resource files.
5. Merge only your required settings into the new configuration.
6. Apply SQL changes from `INSTALL_FILES` when present.
7. Restart the resource and review both consoles.

Do not overwrite a newer configuration with an older copy without comparing its keys and value types.

------------------------------------------------------------------------

# License

Copyright © 2026 **pichirin_cb / CB Studios**.

This resource is licensed under the GNU General Public License v3.0 or later. You may use, study, modify and redistribute it under the license terms. Derivative distributions must preserve copyright and license notices and provide the corresponding source code under the GPL.

See the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.html) for the complete terms.

------------------------------------------------------------------------

# 📬 Support

When requesting support, provide:

| Information | Example |
| --- | --- |
| Script | `fortuna_huntingzones` v4.0.4 |
| Framework | VORP |
| Server build | RedM artifact and game build |
| Dependencies | vorp_core, oxmysql and menu versions |
| Issue | Clear steps to reproduce |
| Logs | Relevant client/server console output |

Do not include database credentials, webhooks, player identifiers, IP addresses or other private data.

- Store: https://pichirin-cb.tebex.io/
- Documentation: https://docs.pichirincb.com/#/
- Support Discord: https://discord.gg/hsx6AvBg5s

------------------------------------------------------------------------

<div style="text-align: center;">
  <strong>CB Studios</strong><br />
  RedM Development Resources
</div>

# CB Studios - Deadzone Extract Documentation

<div style="text-align: center;">
  <img src="https://img.shields.io/badge/CB%20Studios-FiveM%20Development-blue?style=for-the-badge" alt="CB Studios" />
  <img src="https://img.shields.io/badge/version-1.1.0-green?style=for-the-badge" alt="Version" />
  <img src="https://img.shields.io/badge/status-stable-brightgreen?style=for-the-badge" alt="Status" />
  <img src="https://img.shields.io/badge/framework-ESX%20%7C%20QB%20%7C%20QBX%20%7C%20Standalone-orange?style=for-the-badge" alt="Framework" />
</div>

------------------------------------------------------------------------

# 📺 Showcase

<div align="center" style="margin-bottom: 1.5rem;">
  
  <iframe
    width="640"
    height="360"
    src="https://www.youtube.com/embed/VIDEO_ID_HERE"
    title="cb_deadzone-extract showcase"
    frameborder="0"
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
    allowfullscreen
    style="max-width: 100%; border-radius: 12px;"
  ></iframe>
</div>

------------------------------------------------------------------------

# 📖 Overview

| Field | Value |
| --- | --- |
| Resource | `cb_deadzone-extract` |
| Author | **CB Studios** (`Pichirin_CB`) |
| Framework | ESX / QB / QBX / Standalone |
| Version | `1.1.0` |
| Status | Stable |

### Description

`cb_deadzone-extract` is a helicopter extraction system for deadzone gameplay with route traffic control, configurable extraction costs, SQL logging, and modular adapters for inventory and notifications.

Version `1.1.0` removes hard dependency on `hate-bridge`, adds more inventory compatibility (`qs_inventory`, `core_inventory`, `tgiann-inventory`), and introduces `custom.lua` hook files for custom integrations.

------------------------------------------------------------------------

# ✨ Features

- Route-based helicopter extraction (`baseN` / `baseN_return`)
- NUI extraction panel with dynamic route/cost/timer data
- Server-authoritative extraction cost validation and payment
- Optional SQL persistence for success/deny/failure logs
- Discord webhook admin logs with localized messages
- Inventory adapter auto-detection + custom adapter hooks
- Notification router with many supported resources
- Key interaction or target interaction modes
- Locales included: `en`, `es`, `tr`, `fr`, `pt`

------------------------------------------------------------------------

# 📦 Requirements

| Requirement | Details |
| --- | --- |
| FiveM Server | Latest recommended build (`fx_version: cerulean`) |
| Framework | ESX / QB / QBX / Standalone |
| Database | `oxmysql` |
| Dependencies | Inventory + notification/target resources depending on your setup |

Common optional dependencies:

- `ox_inventory` or `qs_inventory` or `core_inventory` or `tgiann-inventory`
- `ox_target` / `qb-target` / `qtarget` (if `Config.Interaction.UseKey = false`)
- `ox_lib`, `cb_opsNotify`, or other notify resource configured in `Config.Notifications.System`

------------------------------------------------------------------------

# 📥 Installation

### 1️⃣ Download

Download the resource and extract it.

### 2️⃣ Place in resources folder

```txt
resources/[your_folder]/cb_deadzone-extract
```

### 3️⃣ Add to server.cfg

```cfg
## CB Studios
ensure oxmysql
ensure cb_deadzone-extract
```

### 4️⃣ Import SQL (if persistence enabled)

Import:

```txt
INSTALL_FILES/sql/cb_deadzone_extract.sql
```

### 5️⃣ Add extraction item to your inventory

Use one snippet from:

- `INSTALL_FILES/item_ox_inventory.lua`
- `INSTALL_FILES/item_qb_inventory.lua`
- `INSTALL_FILES/item_core_inventory.lua`
- `INSTALL_FILES/item_tgiann_inventory.lua`
- `INSTALL_FILES/item_quasar_inventory.lua`

### 6️⃣ Restart server

```cfg
restart cb_deadzone-extract
```

------------------------------------------------------------------------

# ⚙️ Configuration

Example configuration:

```lua
Config = {}

Config.Locale = "en"
Config.Debug = false

Config.ExtractionCost = {
  Enabled = true,
  Item = "cigarette",
  MinAmount = 2,
  MaxAmount = 5,
  ShowOnUI = true,
  RequireBridge = true
}

Config.Persistence = {
  Enabled = true,
  AutoCreateTable = true,
  TableName = "cb_deadzone_extract_logs"
}

Config.Integrations = {
  Inventory = {
    Adapter = "auto",
    Client = "auto"
  }
}

Config.Notifications = {
  System = "cb_opsNotify",
  Title = "Extraction",
  Position = "top-right",
  Duration = 4500
}

Config.Interaction = {
  UseKey = false,
  KeyControl = 51,
  KeyDistance = 2.0,
  TargetResource = "auto"
}
```

### Config Explanation

| Option | Description |
| --- | --- |
| `Locale` | Script language (`en`, `es`, `tr`, `fr`, `pt`) |
| `Debug` | Enables debug logs |
| `ExtractionCost` | Item payment setup for extraction |
| `Persistence` | SQL logging behavior |
| `Integrations.Inventory` | Inventory adapter selection (`auto` / `custom` / specific adapter) |
| `Notifications` | Notify backend and style setup |
| `Interaction` | Key mode or target mode behavior |

------------------------------------------------------------------------

# 🎮 Usage

### Commands

| Command | Description | Permission |
| --- | --- | --- |
| `/cbextract_ui_test` | Opens extract menu with nearest extract NPC (debug command) | Everyone |

------------------------------------------------------------------------

### Keybinds

| Key | Action |
| --- | --- |
| `E` (`INPUT_CONTEXT`, code `51`) | Opens extraction interaction when `Config.Interaction.UseKey = true` |

------------------------------------------------------------------------

# 🔌 Developer Integration

## Server Events

```lua
AddEventHandler('cb_deadzone-extract:RouteSpawnFailed', function(routeKey, reason)
    print(('Route %s failed: %s'):format(routeKey, reason))
end)
```

| Event | Parameters | Description |
| --- | --- | --- |
| `cb_deadzone-extract:GetRouteStatus` | `routeKey, requestId` | Returns current route availability state |
| `cb_deadzone-extract:PrepareExtractionCost` | `routeKey, requestId` | Generates cost payload/token for client UI |
| `cb_deadzone-extract:RequestRouteSeat` | `routeKey, costToken` | Validates payment and starts extraction flow |
| `cb_deadzone-extract:RouteSpawnFailed` | `routeKey, reason` | Marks route as failed and logs failure |
| `cb_deadzone-extract:server:playerLoaded` | `playerSource` | Player lifecycle sync event for logs/state |

------------------------------------------------------------------------

## Client Events

```lua
RegisterNetEvent('cb_deadzone-extract:RequestDenied', function(routeKey, payload)
end)
```

| Event | Parameters | Description |
| --- | --- | --- |
| `cb_deadzone-extract:RouteStatus` | `routeKey, requestId, payload` | Receives route status response |
| `cb_deadzone-extract:ExtractionCostPrepared` | `routeKey, requestId, payload` | Receives extraction cost details for NUI |
| `cb_deadzone-extract:RequestDenied` | `routeKey, payload` | Receives denial reason/message |
| `cb_deadzone-extract:SpawnHeli` | `routeKey, serverData` | Spawns helicopter and starts extraction mission |
| `cb_deadzone-extract:ClientDisembark` | `heli, routeKey` | Forces final disembark on route completion |

------------------------------------------------------------------------

## Exports

Example usage:

```lua
local cfg = exports['cb_deadzone-extract']:GetResourceConfig()
local inventorySource = exports['cb_deadzone-extract']:GetInventoryAdapterSource()
```

| Export | Side | Description |
| --- | --- | --- |
| `GetResourceConfig` | Client/Server | Returns loaded resource configuration |
| `GetExtractionCostConfig` | Client/Server | Returns extraction cost config block |
| `GetRouteDataByKey` | Client | Returns route data from `shared/routes.lua` |
| `GetItemImagePath` | Client | Resolves item image path through client bridge |
| `GetInventoryBridgeSource` | Client | Returns current client inventory bridge source |
| `IsExtractionCostEnabled` | Server | Quick boolean for extraction cost state |
| `GetPersistenceConfig` | Server | Returns SQL persistence config block |
| `GetInventoryAdapterSource` | Server | Returns current server inventory adapter source |
| `SendAdminLog` | Server | Sends Discord admin embed log (`server/logs.lua`) |

------------------------------------------------------------------------

## Custom Integration Hooks

- `server/inventory/custom.lua` -> `CBExtractInventoryCustom.GetAdapter()`
- `client/inventory/custom.lua` -> `CBExtractClientInventoryCustom.GetBridge()`
- `client/notifications/custom.lua` -> `CBExtractNotifyCustom.Notify(payload, bridge)`

Use these files to integrate custom inventory or custom notification systems without editing core files.

------------------------------------------------------------------------

# 🧪 Debugging & Common Issues

### Resource does not start

- Verify folder name is `cb_deadzone-extract` (or legacy `cb_deadzone_extract`)
- Verify `ensure oxmysql` and `ensure cb_deadzone-extract`
- Check console errors from manifest/dependencies

### Item payment always denied

- Verify `Config.ExtractionCost.Item` exists in your inventory
- Verify `Config.Integrations.Inventory.Adapter` (or `auto` detection)
- Use custom adapter in `server/inventory/custom.lua` if needed

### Target interaction not working

- Verify target resource is running (`ox_target`, `qb-target`, or `qtarget`)
- Set `Config.Interaction.TargetResource` explicitly instead of `auto`
- Use key interaction (`Config.Interaction.UseKey = true`) as fallback

### SQL logs not saving

- Verify `oxmysql` is running
- Verify `Config.Persistence.Enabled = true`
- Verify table name and SQL import (`cb_deadzone_extract_logs`)

### No Discord logs

- Verify `Config.LogsEnabled = true`
- Verify a valid `Config.LogWebhook` URL in `shared/logs.lua`

------------------------------------------------------------------------

# 🔄 Updating the Script

1. Backup edited files (`shared/config.lua`, custom integration files).
2. Stop the resource.
3. Replace with the new version.
4. Merge your old config/custom changes into the new files.
5. Restart the resource and test one extraction route.

------------------------------------------------------------------------

# 📬 Support

When requesting support provide:

| Information | Example |
| --- | --- |
| Script | `cb_deadzone-extract v1.1.0` |
| Framework | `ESX` / `QB` / `QBX` / Standalone |
| Inventory | `ox_inventory` (or your custom adapter) |
| Server Build | Latest |
| Issue | Step-by-step reproduction |
| Logs | Server console output + relevant error lines |

------------------------------------------------------------------------

<div style="text-align: center;">
  <strong>CB Studios</strong><br />
  FiveM Development Resources
</div>

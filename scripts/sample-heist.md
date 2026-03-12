# 🚁 CB Deadzone Extract - Full GitBook Documentation

## 📌 Overview
`cb_deadzone-extract` is a complete helicopter extraction system for FiveM deadzone gameplay.

It includes:
- NPC-based extraction interaction (key or target systems)
- Multi-route flight system (`baseN` / `baseN_return`)
- Server-authoritative extraction cost validation (item payment)
- SQL persistence for extraction logs
- Discord administrative logging
- Multi-framework and multi-inventory built-in adapters
- NUI panel with dynamic route/timer/cost status

Current version: `1.0.0`  
License: `MIT`

---

## ✨ Core Features
- 🧭 Route-based extraction flow with configurable hubs and destinations
- 👮 Single active extraction state management (incoming -> boarding -> cooldown)
- 💸 Optional extraction payment with random amount range
- 🔁 Automatic refund on spawn failure edge-cases
- 📊 Optional SQL persistence for accepted/denied/failed requests
- 🛰️ Discord embed logs with localized text keys
- 🧩 Auto adapters for ESX/QB/QBX + multiple inventories
- 🔔 Notification router with many backend options
- 🖥️ Rich NUI dialog with typewriter text, status badges, timers, and cost block
- ⚙️ Performance tuning controls for polling loops and flight behavior

---

## 🏗️ Architecture
### Client
- Handles NPC spawn, interaction, UI rendering, helicopter missions, boarding/disembark logic
- Requests route status and extraction cost token from server
- Sends extraction lifecycle events to server

### Server
- Validates route state and extraction availability
- Charges extraction cost through inventory adapter
- Stores optional SQL records
- Sends Discord admin logs
- Tracks traffic counters (`in-air`, `arriving-soon`) and route state

### Shared
- Global config (`shared/config.lua`)
- Route flight data (`shared/routes.lua`)
- Log config (`shared/logs.lua`)
- Localization dictionaries (`locales/*.lua`)

---

## 📁 Resource Structure
- `fxmanifest.lua`: resource metadata and load order
- `shared/config.lua`: main configuration
- `shared/routes.lua`: route geometry + helicopter model per route
- `shared/logs.lua`: webhook/log type settings
- `server/main.lua`: extraction orchestration/state/cost/persistence
- `server/logs.lua`: Discord embed logger
- `server/inventory/*`: server inventory/framework adapters
- `server/sv_export.lua`: server exports
- `client/main.lua`: NPCs, interaction, flight AI, NUI sync
- `client/notifications/*`: notify backend router
- `client/inventory/*`: client bridge helpers
- `client/cl_export.lua`: client exports
- `html/*`: NUI (index, style, script)
- `INSTALL_FILES/*`: SQL + item snippets + icon
- `docs/README.*.md`: language-specific install docs

---

## 🔒 Resource Name Validation
At startup, the script validates folder name:
- ✅ `cb_deadzone-extract` (expected)
- ✅ `cb_deadzone_extract` (legacy-compatible)
- ❌ Any other name: resource self-stops for security validation

---

## 🧰 Requirements
- FiveM `cerulean`
- `oxmysql` (default manifest dependency)
- Optional framework/inventory resources based on your stack
- Optional notification resource (if not using `game` fallback)

---

## 🚀 Installation
1. Place folder in your resources directory.
2. Ensure in `server.cfg`:
   - `ensure oxmysql`
   - `ensure cb_deadzone-extract`
3. Import SQL if persistence is enabled:
   - `INSTALL_FILES/sql/cb_deadzone_extract.sql`
4. Add extraction item (`cigarette` by default) using matching snippet from `INSTALL_FILES/`.
5. Configure `shared/config.lua` and `shared/logs.lua`.

---

## ⚙️ Main Configuration (`shared/config.lua`)
### 🌐 Global
- `Config.Locale`
- `Config.Debug`
- `Config.DefaultHelicopterModel`

### ⚡ Performance
Fine-grained loop timing controls:
- `IdlePollMs`, `PausePollMs`, `NearNpcPollMs`
- Boarding loop/seat/door/stability ticks
- Pause recovery ticks
- Request/resource loading polling

### 🚁 Extraction Timings
- `Config.HelicopterArrivalDelay`
- `Config.HelicopterBoardingTime`
- `Config.ExtractionCooldown`

### 🛫 Flight AI Tuning
- Speed multipliers and mission speed clamps
- Cruise height tuning
- Turbulence/scalar control (when native exists)
- Transit and landing lateral stabilization

### 💸 Extraction Cost
- `Enabled`, `Item`, `MinAmount`, `MaxAmount`
- `ShowOnUI`, `RequireBridge`, `UseRandomDenyDialogs`

### 🧾 Persistence
- `Enabled`, `AutoCreateTable`, `TableName`
- `SaveSuccess`, `SaveDenied`, `SaveFailures`

### 🔔 Notifications
- `System`, `Title`, `Position`, `Duration`

### 🧩 Integrations
- `Config.Integrations.Inventory.Adapter`
- `Config.Integrations.Inventory.Client`

### 🎯 Interaction
- `UseKey` or target-based interaction
- `KeyControl`, `KeyDistance`
- `TargetDistance`, `TargetIcon`, `TargetResource`

### 🧍 NPC
- Model, freeze/invincible flags, heading offsets
- Optional torch emote (anim + prop attach config)
- Pilot NPC model

### 🗺️ Extract Points
`Config.ExtractHeli` entries define:
- Blip metadata
- World coordinates
- Route destination key (`Dest`)
- Optional hub destination list (`menuRoutes`)
- Optional per-point NPC override

### 🏷️ Route Labels and Alias
- `Config.RouteAliasMap`
- `Config.RouteLabels`
- Supports numeric scaling up to `Config.MaxBaseRoutes` (default 20)

---

## 🛣️ Routes (`shared/routes.lua`)
Routes are keyed as:
- `base1..baseN`
- `base1_return..baseN_return`

Each route can define:
- `spawn`, `heliSpawn`, `runaway1..3`, `waitingZone`
- `coords1`, `prepiste`, `ralenti1`, `startPiste`, `endPiste`, `postpos`
- `heliModel`, `seatpos`, `seatfree`

Active packaged routes:
- `base1` / `base1_return` (Strawberry)
- `base2` / `base2_return` (Elysian Harbor)
- `base3` / `base3_return` (Paleto Bay)
- `base4` / `base4_return` (Vespucci Dock)
- `base5` / `base5_return` (Chiliad)

---

## 💾 Persistence (SQL)
Table default: `cb_deadzone_extract_logs`

Stored fields include:
- Player source/identifier
- Route key
- Item and amount
- Status and reason
- JSON payload
- Timestamp

Persistence behavior is controlled by `Config.Persistence.*`.

---

## 📣 Discord Administrative Logs
Configured in `shared/logs.lua`:
- `Config.LogsEnabled`
- `Config.LogWebhook`
- `Config.LogsLocale` (`auto` follows `Config.Locale`)
- `Config.LogBotName`, `Config.LogBotAvatar`
- `Config.LogEmbedColor`, `Config.LogColors`
- `Config.LogTypes.*` toggles

Log module validates required `log_*` locale keys at startup and warns if missing.

---

## 🧩 Inventory Adapters
### Server adapter (`server/inventory/init.lua`)
Auto order:
1. `custom`
2. `tgiann_inventory`
3. `core_inventory`
4. `qs_inventory`
5. `ox_inventory`
6. `esx`
7. `qb`
8. `qbx`

### Client bridge (`client/inventory/init.lua`)
Auto order:
1. `custom`
2. `tgiann_inventory`
3. `core_inventory`
4. `qs_inventory`
5. `ox_inventory`
6. `qb`
7. `qbx`

### Custom hook points
- `server/inventory/custom.lua` -> `CBExtractInventoryCustom.GetAdapter()`
- `client/inventory/custom.lua` -> `CBExtractClientInventoryCustom.GetBridge()`

---

## 🔔 Notification Systems
Configured by `Config.Notifications.System`.

Supported:
- `auto`, `custom`, `bridge`, `ox_lib`
- `rtx_notify`, `brutal_notify`, `wasabi_notify`, `wasabi_uikit`
- `okokNotify`, `codem-notification`, `vms_notifyv2`
- `origen_notify`, `lation_ui`, `cb_opsNotify`
- `esx`, `qb`, `qbx`, `chat`, `game`

Custom notify hook:
- `client/notifications/custom.lua` -> `CBExtractNotifyCustom.Notify(payload, bridge)`

---

## 🛰️ Server Events
### Client -> Server
- `cb_deadzone-extract:RouteInAirAdd`
- `cb_deadzone-extract:RouteInAirGet`
- `cb_deadzone-extract:RouteInAirRemove`
- `cb_deadzone-extract:RouteArrivingSoonAdd`
- `cb_deadzone-extract:RouteArrivingSoonGet`
- `cb_deadzone-extract:RouteArrivingSoonRemove`
- `cb_deadzone-extract:RouteNoLongerWaiting`
- `cb_deadzone-extract:RouteDeparture`
- `cb_deadzone-extract:UpdateSeatPool`
- `cb_deadzone-extract:GetRouteStatus`
- `cb_deadzone-extract:PrepareExtractionCost`
- `cb_deadzone-extract:ClearPendingExtractionCost`
- `cb_deadzone-extract:BoardingStarted`
- `cb_deadzone-extract:RequestRouteSeat`
- `cb_deadzone-extract:ForceDisembark`
- `cb_deadzone-extract:RouteSpawnFailed`

### Player lifecycle
- `cb_deadzone-extract:server:playerLoaded`
- `hate-bridge:server:playerLoaded` (legacy compatibility)
- `playerDropped` handler

### Server -> Client (main ones)
- `cb_deadzone-extract:SendRouteTraffic`
- `cb_deadzone-extract:RouteStatus`
- `cb_deadzone-extract:ExtractionCostPrepared`
- `cb_deadzone-extract:RequestDenied`
- `cb_deadzone-extract:SpawnHeli`
- `cb_deadzone-extract:ClientDisembark`

---

## 🖥️ Client Events and NUI
### Registered client net events
- `cb_deadzone-extract:SendRouteTraffic`
- `cb_deadzone-extract:RequestControlEvent`
- `cb_deadzone-extract:RouteStatus`
- `cb_deadzone-extract:ExtractionCostPrepared`
- `cb_deadzone-extract:RequestDenied`
- `cb_deadzone-extract:SpawnHeli`
- `cb_deadzone-extract:HeliFull`
- `cb_deadzone-extract:BoardHeli`
- `cb_deadzone-extract:TeleportToHeli`
- `cb_deadzone-extract:RequestHeli`
- `cb_deadzone-extract:ClientDisembark`

### NUI callbacks (Lua receives)
- `cb_deadzone_extract_open_ack`
- `cb_deadzone_extract_boot_ack`
- `cb_deadzone_extract_confirm`
- `cb_deadzone_extract_close`
- Legacy compatibility:
  - `cb_deadzone_extract:confirm`
  - `cb_deadzone_extract:close`

### NUI message actions (JS receives)
- `cb_deadzone_extract:open_menu`
- `cb_deadzone_extract:update_dialog`
- `cb_deadzone_extract:close_menu`
- `cb_deadzone_extract:bootstrap_ping`

### Debug command
- `cbextract_ui_test`

---

## 🔌 Exports
### Server exports (`server/sv_export.lua`)
- `GetResourceConfig()`
- `GetExtractionCostConfig()`
- `IsExtractionCostEnabled()`
- `GetPersistenceConfig()`
- `GetInventoryAdapterSource()`

### Server export (`server/logs.lua`)
- `SendAdminLog(logType, source, actionKey, extraData, colorKey)`

### Client exports (`client/cl_export.lua`)
- `GetResourceConfig()`
- `GetExtractionCostConfig()`
- `GetRouteDataByKey()`
- `GetItemImagePath(itemName)`
- `GetInventoryBridgeSource()`

---

## 🌍 Localization
Locales included:
- `en`, `es`, `tr`, `fr`, `pt`

Localization loader:
- `locales/init.lua` (`_U(key, ...)`)
- Falls back to English if key/locale is missing

Includes UI strings, extraction status strings, deny dialogs, and log keys.

---

## 🎮 Interaction Modes
### Key mode
- Uses `E` (`Config.Interaction.KeyControl`) near NPC within `KeyDistance`

### Target mode
- Auto or forced target resource (`ox_target`, `qb-target`, `qtarget`)
- If target system is unavailable, script falls back to key interaction

---

## ➕ Adding New Routes (base6+)
1. Add `baseX` and `baseX_return` in `shared/routes.lua`.
2. Add extraction point in `Config.ExtractHeli` with `Dest = "baseX_return"`.
3. If hub, include `"baseX"` in hub `menuRoutes`.
4. Add labels in `Config.RouteLabels` (optional override).
5. Restart resource.

No client/server core logic edits are required for new numeric routes.

---

## 🧪 Quick Validation Checklist
- NPCs spawn at all `Config.ExtractHeli` points
- Interaction works (key or target)
- NUI opens and updates state/timers
- Route request accepted when idle
- Extraction denied correctly when item/payment fails
- Boarding and disembark flow works
- SQL entries appear when persistence is enabled
- Discord logs are delivered with valid webhook

---

## 🛠️ Troubleshooting
- `No extraction available`: check route key mapping and route data entries
- `Item always denied`: verify exact item name and adapter selection
- `No SQL logs`: verify `oxmysql`, table, and `Config.Persistence.Enabled`
- `No Discord logs`: verify `Config.LogWebhook` and `Config.LogsEnabled`
- `UI not opening`: verify `html/*` loaded and NUI callbacks/messages not blocked
- `Target not working`: force `Config.Interaction.TargetResource` or use key mode fallback

---

## 👤 Credits
- Author: `Pichirin_CB`
- Discord: `https://discord.gg/hsx6AvBg5s`
- Store: `https://pichirin-cb.tebex.io/`


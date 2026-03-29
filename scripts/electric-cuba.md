# CB Studios - Cuban Electric Company Documentation

<div style="text-align: center;">
  <img src="https://img.shields.io/badge/CB%20Studios-FiveM%20Development-blue?style=for-the-badge" alt="CB Studios" />
  <img src="https://img.shields.io/badge/version-1.0.0-green?style=for-the-badge" alt="Version" />
  <img src="https://img.shields.io/badge/status-stable-brightgreen?style=for-the-badge" alt="Status" />
  <img src="https://img.shields.io/badge/framework-ESX%20%7C%20QBCore%20%7C%20Standalone-orange?style=for-the-badge" alt="Framework" />
</div>

------------------------------------------------------------------------

# Showcase

<div align="center" style="margin-bottom: 1.5rem;">
  
  <iframe
    width="640"
    height="360"
    src="https://www.youtube.com/embed/DlzN8twIOi0"
    title="cb_electrica-cuba showcase"
    frameborder="0"
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
    allowfullscreen
    style="max-width: 100%; border-radius: 12px;"
  ></iframe>
</div>

------------------------------------------------------------------------

# Overview

| Field | Value |
| --- | --- |
| Resource | `cb_electrica-cuba` |
| Author | **Pichirin_CB / CB Studios** |
| Framework | ESX / QBCore / Standalone (adapter-based) |
| Version | `1.0.0` |
| Status | Stable |
| UI | React + Vite NUI |
| Dependency | `cb_electrica-truck` |

### Description

`cb_electrica-cuba` is a complete electrical-grid gameplay system for FiveM servers.
It combines circuit fuel management, dynamic blackouts, role-based control access, tanker logistics, waypoint guidance, panel-based NUI interaction, history persistence, webhooks, and modular adapter support.

The resource is designed to work on mixed environments and can auto-detect compatible integrations for framework, inventory, targeting, weather, progress bars, vehicle keys, notifications, and fuel systems.

------------------------------------------------------------------------

# Features

- Real-time circuit fuel simulation with configurable per-minute consumption
- Multi-circuit architecture (supports adding new circuits directly from `Config.Circuits`)
- Job workflow from start -> tanker request -> fill -> transfer -> finish/deliver
- Circuit control panel with permission gates by job and grade
- Automatic blackout handling when circuits are off or out of fuel
- Optional zone blackout visuals and filters
- Adapter-based compatibility layer for ESX/QBCore/Standalone stacks
- Auto adapter fallback logic and runtime adapter refresh on dependency restart
- Persistent state in MySQL (`circuits`, `runtime clock`, `history`)
- Webhook logging for jobs, transfers, blackouts, suspicious activity, and errors
- Target interactions + marker fallback mode (for servers without target systems)
- RP-emote integration for tablet-style UI sessions (when `rpemotes` is available)
- Sound system for UI and gameplay SFX through NUI
- Built-in anti-abuse controls (distance checks, cooldowns, transfer limits, sync limits)
- Developer exports for server and client integrations

------------------------------------------------------------------------

# Requirements

| Requirement | Details |
| --- | --- |
| FiveM Server | Current recommended artifact |
| Lua Runtime | Lua 5.4 (`lua54 'yes'`) |
| Database | `oxmysql` |
| Required Resource | `cb_electrica-truck` |
| Framework | QBCore / ESX / custom adapter |
| Build Tools (optional) | Node.js 18+ (for optional asset compilation) |

### Optional Integration Resources (Auto/Manual)

| Category | Supported Options |
| --- | --- |
| Framework Adapter | `qb`, `esx`, `custom` |
| Inventory Adapter | `ox`, `qb`, `qs`, `custom` |
| Fuel Adapter | `ox`, `legacy`, `ps`, `custom` |
| Target Adapter | `ox`, `qb`, `qtarget`, `custom` |
| Notify Adapter | `ox`, `qb`, `esx`, `custom` |
| Weather Adapter | `cd_easytime`, `qb`, `native`, `custom` |
| Progress Adapter | `ox`, `qb`, `native`, `custom` |
| Vehicle Keys Adapter | `qb`, `esx`, `custom` |

------------------------------------------------------------------------

# Installation

### 1. Download

Download and extract the full package.

### 2. Place in resources folder

Use this exact folder/resource name:

```text
resources/[your_folder]/[cb_electrica-cuba]/cb_electrica-cuba
```

Important:
- The resource validates its name at runtime.
- Expected name is `cb_electrica-cuba`.
- Legacy `cb_electrica` can still pass compatibility checks, but `cb_electrica-cuba` is recommended.

### 3. Import SQL

Import:

```text
INSTALL_FILES/database.sql
```

This creates and migration-updates:
- `cb_electrica_circuits`
- `cb_electrica_runtime`
- `cb_electrica_history`

### 4. Register payout item

Default payout item is `cup` (`Config.Payout.Item`).
Add the item in your inventory system using the included templates:

- `INSTALL_FILES/item_ox_inventory.lua`
- `INSTALL_FILES/item_qb_inventory.lua`
- `INSTALL_FILES/item_qs_inventory.lua`

### 5. Add to `server.cfg`

Recommended order:

```cfg
## Database
ensure oxmysql

## Framework
ensure qb-core
# or ensure es_extended

## Required CB dependency
ensure cb_electrica-truck

## Main resource
ensure cb_electrica-cuba
```

### 6. Restart server

Start or restart resource:

```cfg
restart cb_electrica-cuba
```

### 7. Verify startup

Validate:
- Resource starts without script errors
- Adapter selection logs are printed in console (if `Config.Debug = true`)
- UI opens from job/control NPCs
- Circuit data loads from DB

------------------------------------------------------------------------

# Configuration

Main configuration file:

```text
shared/config.lua
```

### Base Example

```lua
Config = {}

Config.Debug = false
Config.Locale = 'en'
Config.ServerName = 'My RP Server'

Config.Framework = 'auto'
Config.Inventory = 'auto'
Config.FuelSystem = 'auto'
Config.Target = 'auto'
Config.Notify = 'auto'
Config.Weather = 'auto'
Config.Progress = 'auto'
Config.VehicleKeys = 'auto'
```

## Config Reference

### Core

| Option | Type | Description |
| --- | --- | --- |
| `Config.Debug` | `boolean` | Enables debug console logs client/server |
| `Config.Locale` | `string` | Locale key (`en`, `es`, etc.) |
| `Config.ServerName` | `string` | Display name used in UI/webhook identity |

### Adapter Selection

| Option | Values |
| --- | --- |
| `Config.Framework` | `auto`, `qb`, `esx`, `custom` |
| `Config.Inventory` | `auto`, `ox`, `qb`, `qs`, `custom` |
| `Config.FuelSystem` | `auto`, `ox`, `legacy`, `ps`, `custom` |
| `Config.Target` | `auto`, `qb`, `ox`, `qtarget`, `custom` |
| `Config.Notify` | `auto`, `ox`, `qb`, `esx`, `custom` |
| `Config.Weather` | `auto`, `cd_easytime`, `qb`, `native`, `custom` |
| `Config.Progress` | `auto`, `ox`, `qb`, `native`, `custom` |
| `Config.VehicleKeys` | `auto`, `qb`, `esx`, `custom` |

### Persistence

| Option | Type | Description |
| --- | --- | --- |
| `Config.Database.Enabled` | `boolean` | Enables DB persistence |
| `Config.Database.UseHistory` | `boolean` | Stores actions in history table |

### Clock and Consumption

| Option | Description |
| --- | --- |
| `Config.Clock.SyncIntervalMs` | Client -> server clock sync interval |
| `Config.Clock.MinSyncIntervalMs` | Anti-spam floor for sync requests |
| `Config.Clock.TickIntervalMs` | Consumption processing frequency |
| `Config.Clock.MaxDeltaMinutesPerTick` | Desync jump clamp |
| `Config.Clock.SyncSourceTimeoutSeconds` | How long one sync authority is kept |
| `Config.Clock.SaveEveryTicks` | Forced periodic DB save |

### Security / Anti-Abuse

| Option | Description |
| --- | --- |
| `Config.Security.ActionCooldownMs` | Global action cooldown |
| `Config.Security.TransferWindowSeconds` | Time window for transfer limits |
| `Config.Security.MaxTransfersPerWindow` | Max transfer actions per window |
| `Config.Security.MaxFuelPerWindow` | Max liters per window |
| `Config.Security.ClockJumpLogCooldownMs` | Cooldown between jump security logs |
| `Config.Security.EnableDistanceValidation` | Distance checks for critical actions |
| `Config.Security.MaxActionDistance` | Max interact distance |
| `Config.Security.RequireTankerForTransfer` | Requires assigned tanker/nozzle workflow |

### Job and Permissions

| Option | Description |
| --- | --- |
| `Config.Job.RequireJob` | Restrict job panel usage by job |
| `Config.Job.Name` | Main required job (legacy-style) |
| `Config.Job.AllowedJobs` | Allowed jobs for refuel job |
| `Config.ControlPanel.RequireJob` | Restrict control panel |
| `Config.ControlPanel.AllowedJobs` | Job whitelist for control panel |
| `Config.ControlPanel.AllowedGrades` | Optional per-job grade whitelist |

### Payout System

| Option | Description |
| --- | --- |
| `Config.Payout.Item` | Reward item name |
| `Config.Payout.Mode` | `fixed` or `consumption` |
| `Config.Payout.Amount` | Fixed mode amount |
| `Config.Payout.DefaultPerLiter` | Base conversion in consumption mode |
| `Config.Payout.CircuitPerLiter` | Optional per-circuit conversion override |
| `Config.Payout.RoundMode` | `floor`, `round`, or `ceil` |
| `Config.Payout.MinAmount` | Minimum payout |
| `Config.Payout.MaxAmount` | Max payout (`0` = uncapped) |

### Streaming and Performance

| Option | Description |
| --- | --- |
| `Config.Streaming.Enabled` | Enables dynamic spawn/despawn for static world entities |
| `Config.Streaming.SpawnDistance` | Spawn distance |
| `Config.Streaming.DespawnDistance` | Despawn distance |
| `Config.Streaming.CheckIntervalMsNear` | Near check interval |
| `Config.Streaming.CheckIntervalMsFar` | Far check interval |
| `Config.Streaming.KeepSpawnedWhileUiOpen` | Prevent despawn while panel is open |
| `Config.Streaming.KeepSpawnedWhileNozzleActive` | Prevent despawn while nozzle is active |
| `Config.Streaming.NpcCullingRadius` | NPC culling radius |
| `Config.Streaming.PropCullingRadius` | Prop culling radius |

### Tanker Setup

| Option | Description |
| --- | --- |
| `Config.Tanker.model` | Spawn model name |
| `Config.Tanker.spawnCoords` | Spawn location |
| `Config.Tanker.returnCoords` | Delivery/return point |
| `Config.Tanker.capacity` | Tanker max liters |
| `Config.Tanker.fillPerAction` | Fill liters per fill action |
| `Config.Tanker.transferPerAction` | Default transfer liters per action |
| `Config.Tanker.minTransfer` | Min transfer amount |
| `Config.Tanker.maxTransfer` | Max transfer amount |
| `Config.Tanker.FillVehicleMaxDistance` | Depot-to-vehicle fill range |
| `Config.Tanker.FillPlayerToVehicleDistance` | Player-to-vehicle fill range |
| `Config.Tanker.FillFromTankerInteraction` | Enables tanker-based fill interaction |
| `Config.Tanker.NozzleFromTankerInteraction` | Enables nozzle interaction from tanker |
| `Config.Tanker.FuelActionDurationMs` | Base duration for full fill |
| `Config.Tanker.TransferActionDurationMultiplier` | Transfer duration factor |
| `Config.Tanker.Rope` | Hose rope simulation settings |

### UI / Interaction

| Option | Description |
| --- | --- |
| `Config.SoundVolume` | Master sound volume `0.0` to `1.0` |
| `Config.TargetFallback.Enabled` | Enables marker/key fallback when no target |
| `Config.TargetFallback.Key` | Fallback key code (`38` = `E`) |
| `Config.TargetOptions` | Icon and target interaction tuning |
| `Config.ProgressBar` | Progress labels and control lock behavior |

### Blips / Blackout / Notification Filters

| Option | Description |
| --- | --- |
| `Config.Blips` | Full blip behavior and style setup |
| `Config.Blackout` | Zone/global blackout visual behavior |
| `Config.Notifications` | Inform-message filter by configured zone |

### Circuits

Each circuit object in `Config.Circuits` supports:

| Field | Description |
| --- | --- |
| `id` | Unique circuit identifier |
| `name` | Circuit label |
| `center` | Zone center (`vec3`) |
| `radius` | Circuit area radius |
| `fuelCapacity` | Max circuit fuel |
| `fuelConsumptionPerGameMinute` | Drain amount per in-game minute |
| `propCoords` | Tank/prop interaction coordinates |
| `propModel` | Visual model |
| `spawnProp` | Whether prop is spawned by script |

### Webhooks

Webhook channels available in `Config.Webhooks`:
- `job_start`
- `job_complete`
- `fuel_transfer`
- `fill_tanker`
- `circuit_blackout`
- `circuit_toggle`
- `suspicious_activity`
- `errors`

Recommended:
- Replace webhook URLs before production
- Keep webhook channels separated if you want cleaner Discord logs

### Commands and ACE

| Option | Description |
| --- | --- |
| `Config.Commands.Debug` | Debug command name (default `electric_debug`) |
| `Config.Commands.ForceCircuit` | Force circuit state command |
| `Config.Commands.SetFuel` | Set circuit fuel command |
| `Config.Commands.AdminAce` | Required ACE permission (default `cb_electrica.admin`) |

------------------------------------------------------------------------

# Usage

### Player Job Flow

1. Go to the job NPC.
2. Open job panel and start job.
3. Request/spawn tanker.
4. Fill tanker at depot.
5. Go to circuits and transfer fuel.
6. Repeat refill + transfer as needed.
7. Finish job from UI.
8. If tanker was spawned, return/deliver tanker at return point to receive final completion.

Important behavior:
- If the player never spawned/requested a tanker, finishing the job is allowed immediately.
- If tanker exists, finish switches to `returnPending` and requires delivery.

### Control Panel Flow

1. Go to control NPC.
2. Open control panel (requires permission if enabled).
3. Toggle circuits ON/OFF.
4. Monitor fuel and state in real time.

### Commands

| Command | Side | Description | Permission |
| --- | --- | --- | --- |
| `/electric_debug` | Server | Prints system/adapters/circuit debug state | ACE `cb_electrica.admin` |
| `/electric_force <id> <on\|off>` | Server | Force circuit state | ACE `cb_electrica.admin` |
| `/electric_setfuel <id> <fuel>` | Server | Set circuit fuel value | ACE `cb_electrica.admin` |
| `/electric_nozzle` | Client | Toggle nozzle state (test/manual) | Player |
| `/electric_ui_test [job\|control]` | Client | Opens debug UI payload | Developer/Test |

Note:
- Command names are configurable in `Config.Commands`.

### Keybinds

| Key | Action |
| --- | --- |
| `E` (`INPUT_CONTEXT`, code 38) | Fallback interaction when target fallback is enabled |

------------------------------------------------------------------------

# Developer Integration

## Server Events (incoming)

| Event | Parameters | Description |
| --- | --- | --- |
| `cb_electrica:server:syncClock` | `hour, minute` | Clock sync input |
| `cb_electrica:server:requestJobPanel` | none | Open/send job panel payload |
| `cb_electrica:server:requestControlPanel` | none | Open/send control panel payload |
| `cb_electrica:server:requestPanelRefresh` | `panel` | Refresh a panel (`job/control`) |
| `cb_electrica:server:requestCircuitSync` | none | Full circuit sync |
| `cb_electrica:server:requestClientState` | none | Session sync |
| `cb_electrica:server:startJob` | none | Start job session |
| `cb_electrica:server:requestJobVehicle` | none | Spawn/reissue tanker |
| `cb_electrica:server:finishJob` | none | Finish request (may set return pending) |
| `cb_electrica:server:deliverJobVehicle` | none | Final tanker delivery |
| `cb_electrica:server:setNozzleState` | `shouldHold` | Set nozzle holding state |
| `cb_electrica:server:fillTanker` | none | Fill tanker action |
| `cb_electrica:server:transferFuel` | `circuitId, amount` | Transfer to circuit |
| `cb_electrica:server:toggleCircuit` | `circuitId, desiredOn` | Change circuit state |

## Client Events (incoming)

| Event | Parameters | Description |
| --- | --- | --- |
| `cb_electrica:client:openJobUi` | `payload` | Open job panel UI |
| `cb_electrica:client:openControlUi` | `payload` | Open control panel UI |
| `cb_electrica:client:updatePanel` | `payload` | Update visible panel |
| `cb_electrica:client:syncCircuits` | `circuits` | Replace local circuits |
| `cb_electrica:client:syncClientState` | `payload` | Session state sync |
| `cb_electrica:client:circuitChanged` | `circuit, reason` | Circuit update signal |
| `cb_electrica:client:notify` | `message, notifyType` | Notification bridge |
| `cb_electrica:client:blackoutNotify` | `circuitName` | Blackout notice |
| `cb_electrica:client:nozzleState` | `active` | Nozzle state signal |
| `cb_electrica:client:setWaypoint` | `coords, notifyKey, routeType` | GPS routing |
| `cb_electrica:client:jobTransferAction` | `circuitId, amount` | Triggers transfer flow |
| `cb_electrica:client:jobVehicleSpawned` | `netId` | Tanker spawn confirmation |

## NUI Callbacks

| Callback | Direction | Description |
| --- | --- | --- |
| `uiReady` | NUI -> Lua | NUI ready handshake |
| `close` | NUI -> Lua | Close panel |
| `jobStart` | NUI -> Lua | Trigger job start |
| `jobFinish` | NUI -> Lua | Trigger finish |
| `jobFill` | NUI -> Lua | Trigger tanker request |
| `jobTransfer` | NUI -> Lua | Trigger transfer |
| `controlToggle` | NUI -> Lua | Toggle circuit |
| `refresh` | NUI -> Lua | Request panel refresh |
| `trackCircuit` | NUI -> Lua | Track selected circuit |

## Exports

### Client Core Exports

| Export | Description |
| --- | --- |
| `OpenElectricJob()` | Open job UI |
| `OpenControlPanel()` | Open control UI |
| `CloseElectricUi()` | Close current UI |
| `IsUiOpen()` | Returns panel open state |
| `Notify(message, type)` | Send notify through resolved adapter |
| `GetResolvedTarget()` | Active target adapter |
| `GetResolvedNotify()` | Active notify adapter |
| `GetResolvedKeys()` | Active keys adapter |
| `GetResolvedWeather()` | Active weather adapter |
| `GetResolvedProgress()` | Active progress adapter |
| `GetCircuitsLocal()` | Returns local circuit cache |

### Server Core Exports

| Export | Description |
| --- | --- |
| `GetCircuits()` | Full circuits table |
| `GetCircuit(circuitId)` | Single circuit |
| `GetClock()` | Runtime clock |
| `SetCircuitState(circuitId, shouldBeOn, manualAction)` | Set ON/OFF |
| `SetCircuitFuel(circuitId, fuel, options)` | Set fuel |
| `AddCircuitFuel(circuitId, amount, options)` | Add fuel |
| `RemoveCircuitFuel(circuitId, amount)` | Remove fuel |
| `SyncGameClock(hour, minute, src)` | Inject clock update |
| `StartPlayerJob(src)` | Start job session |
| `FinishPlayerJob(src)` | Finish job session |
| `DeliverPlayerJobVehicle(src)` | Complete delivery step |
| `GetPlayerJobState(src)` | Current session data |
| `SetCustomFrameworkAdapter(name, adapterTable)` | Register custom framework |
| `SetCustomInventoryAdapter(name, adapterTable)` | Register custom inventory |
| `SetCustomFuelAdapter(name, adapterTable)` | Register custom fuel |

Compatibility aliases are included on both client and server exports (legacy naming supported).

### Example Export Usage

```lua
-- Server: force a circuit ON
local ok, err = exports['cb_electrica-cuba']:SetCircuitState(1, true, true)
if not ok then
    print(('Failed to set circuit: %s'):format(tostring(err)))
end
```

```lua
-- Client: open job panel from another resource
exports['cb_electrica-cuba']:OpenElectricJob()
```

------------------------------------------------------------------------

# Debugging & Common Issues

### Resource does not start

- Ensure the folder/resource name is valid (`cb_electrica-cuba` recommended).
- Ensure `cb_electrica-truck` is started first.
- Ensure `oxmysql` is running.
- Check startup logs for adapter selection errors.

### "No permission" on admin commands

- Add ACE permission for your admin group:

```cfg
add_ace group.admin cb_electrica.admin allow
```

### Player cannot finish job

- If tanker was spawned/requested, the script requires tanker delivery to finish.
- If tanker was never spawned, finish is allowed directly.
- Confirm player is near configured return point (`Config.Tanker.returnCoords`) when delivering.

### No payout at job completion

- Confirm payout item exists in inventory system (`Config.Payout.Item`).
- Verify inventory adapter is detected correctly.
- Check webhook/error logs for `job_reward_failed`.

### Circuit does not receive fuel

- Confirm active job session.
- Confirm nozzle is active when transfer requires it.
- Confirm player is near assigned circuit tank/area.
- Check `Config.Security.RequireTankerForTransfer` and distance limits.

### UI sound does not play

- Ensure audio files are present in source sound folder before build.
- Rebuild NUI with `npm run build` inside your NUI source folder.
- Verify generated `html/assets/sounds-manifest.json` exists.
- Ensure `Config.SoundVolume > 0`.

### NUI does not update / stale panel

- Use panel refresh action.
- Validate `cb_electrica:server:requestPanelRefresh` receives correct panel type.
- Check for JS build mismatch in `html/assets`.

### Database mismatch after update

- Re-run `INSTALL_FILES/database.sql` (includes migration-safe `ALTER TABLE` statements).
- Confirm tables exist and columns were added successfully.

------------------------------------------------------------------------

# Updating the Script

1. Backup `shared/config.lua` and custom adapter edits.
2. Stop the resource.
3. Replace files with new version.
4. Re-run `INSTALL_FILES/database.sql`.
5. Rebuild NUI only if you changed NUI source files:

```bash
cd <nui-source-folder>
npm install
npm run build
```

6. Start resource and verify startup logs.

------------------------------------------------------------------------

# Support

When requesting support, include:

| Information | Example |
| --- | --- |
| Script | `cb_electrica-cuba v1.0.0` |
| Framework | `QBCore` or `ESX` |
| Inventory/Fuel/Target | Current adapter stack |
| Server Build | FxServer artifact version |
| Issue | Exact steps to reproduce |
| Logs | Full console output (server + client) |
| Config Context | Relevant `shared/config.lua` sections |

Support links:
- Discord: https://discord.gg/hsx6AvBg5s
- Store: https://store.pichirincb.com
- Docs: https://docs.pichirincb.com

------------------------------------------------------------------------

<div style="text-align: center;">
  <strong>CB Studios</strong><br />
  FiveM Development Resources
</div>

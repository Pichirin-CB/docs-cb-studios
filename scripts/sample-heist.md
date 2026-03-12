# sample-heist

Status: `stable`  
Version: `1.2.0`  
Last updated: `2026-03-11`

## Overview

`sample-heist` is a multi-phase robbery system with global cooldown, required police count, and configurable rewards.

## Features

- Start via item usage or admin command
- Multi-step phase flow with checkpoints
- Police dispatch alerts
- Server-wide cooldown lock
- Hooks for external logs and analytics

## Requirements

| Item | Value |
| --- | --- |
| Framework | `QBCore` (ESX adaptable) |
| Dependencies | `ox_lib`, `oxmysql`, `ox_target` |
| Runtime | OneSync enabled |

## Installation

1. Copy `sample-heist` to `resources/[local]/sample-heist`.
2. Import SQL data if your build includes persistence tables.
3. Ensure dependencies and script in `server.cfg`:

```cfg
ensure ox_lib
ensure oxmysql
ensure ox_target
ensure sample-heist
```

## Quick Configuration

```lua
Config.Debug = false
Config.Locale = "en"
Config.RequiredPolice = 2
Config.GlobalCooldown = 45 -- minutes
Config.StartItem = "heist_card"
```

```lua
Config.Rewards = {
  money = { min = 5000, max = 8000 },
  items = {
    { name = "goldbar", chance = 30, amount = { min = 1, max = 2 } },
    { name = "diamond", chance = 10, amount = { min = 1, max = 1 } }
  }
}
```

## Integrations

- Inventory: `ox_inventory`
- Target: `ox_target`
- Database: `oxmysql`

## Events

### `sample-heist:server:start`

Runs start validation for the heist flow.

Parameters:

- `source` (`number`)
- `zoneId` (`string`)

### `sample-heist:server:finish`

Applies rewards and starts cooldown.

Parameters:

- `source` (`number`)
- `result` (`table`)

### `sample-heist:client:beginPhase`

Starts the phase visuals and objective logic.

Parameters:

- `phaseId` (`number`)
- `data` (`table`)

### `sample-heist:client:policeAlert`

Pushes dispatch data to police players.

Parameters:

- `coords` (`vector3`)
- `label` (`string`)

## Exports

### `IsInHeist()`

Returns whether the local player is currently in an active heist.

```lua
local inHeist = exports["sample-heist"]:IsInHeist()
```

### `GetHeistState()`

Returns the current global heist state object.

```lua
local state = exports["sample-heist"]:GetHeistState()
print(state.cooldownEndsAt)
```

### `ForceResetHeist()`

Force-resets active state and cooldown (admin/maintenance usage).

```lua
exports["sample-heist"]:ForceResetHeist()
```

## Commands

### `/heiststart`

Force-starts a heist session (staff only).

Suggested permission:

- `group.admin`

### `/heistreset`

Resets cooldown and active state.

Suggested permission:

- `group.superadmin`

```cfg
add_ace group.admin command.heiststart allow
add_ace group.superadmin command.heistreset allow
```

## Changelog

### `1.2.0` - `2026-03-11`

- Added configurable global cooldown
- Improved phase synchronization
- Added `GetHeistState` export

### `1.1.0` - `2026-02-20`

- Added `ox_target` support
- Rebalanced zone reward values

### `1.0.0` - `2026-01-30`

- Initial release

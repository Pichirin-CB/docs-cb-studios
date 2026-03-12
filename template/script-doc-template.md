# <script-name>

Status: `stable`  
Version: `0.1.0`  
Last updated: `YYYY-MM-DD`

## Overview

Write a short description of what the resource does and which server problem it solves.

## Feature Highlights

- Key feature 1
- Key feature 2
- Key feature 3

## Requirements

| Item | Value |
| --- | --- |
| FXServer artifact | `xxxx` |
| Framework | `ESX` or `QBCore` |
| Dependencies | `ox_lib`, `oxmysql`, etc. |

## Installation

1. Copy the resource folder to `resources/[local]/<script-name>`.
2. Verify required dependencies are installed.
3. Add ensures in `server.cfg`:

```cfg
ensure <dependency-1>
ensure <dependency-2>
ensure <script-name>
```

## Quick Configuration

```lua
Config.Debug = false
Config.Locale = "en"
Config.Framework = "qb"
```

## Basic Usage

Explain the normal player flow and any admin/staff controls.

## Integrations

- Inventory: `ox_inventory` / `qb-inventory`
- Target: `ox_target` / `qb-target`
- UI: `ox_lib`

## Events

### `resource:server:eventName`

What it does, plus required parameters.

### `resource:client:eventName`

What it does, plus required parameters.

## Exports

### `GetState()`

Describe return shape and usage.

```lua
local state = exports["<script-name>"]:GetState()
```

## Commands

### `/<command>`

What it does and who can use it.

```cfg
add_ace group.admin command.<command> allow
```

## Changelog

### `0.1.0` - `YYYY-MM-DD`

- Initial release notes

## FAQ

### Resource does not start

- Confirm ensure order in `server.cfg`.
- Confirm dependency names and folder names.

### Event is not firing

- Verify exact event name and the correct side (`client` or `server`).

## Support

Add your official support channel (Discord, GitHub Issues, or ticket system).

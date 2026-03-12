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

## Gameplay Flow

1. Player interacts with the start point.
2. Script validates police count and cooldown state.
3. Phase sequence begins and synchronizes to involved players.
4. Completion triggers payout and cooldown.

## Technical Reference

- [Config](./config.md)
- [Events](./events.md)
- [Exports](./exports.md)
- [Commands](./commands.md)
- [Changelog](./changelog.md)

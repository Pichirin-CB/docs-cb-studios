# <script-name>

Status: `stable`  
Version: `0.1.0`  
Last updated: `YYYY-MM-DD`

## Overview

Short description of what this script does.

## Features

- Feature 1
- Feature 2
- Feature 3

## Requirements

- Framework: `QBCore` or `ESX`
- Dependencies: `ox_lib`, `oxmysql`, etc.

## Installation

```cfg
ensure <dependency-1>
ensure <dependency-2>
ensure <script-name>
```

## Quick Configuration

```lua
Config.Debug = false
Config.Locale = "en"
```

## Events

### `script:server:eventName`

Describe server-side event.

### `script:client:eventName`

Describe client-side event.

## Exports

### `GetState()`

```lua
local state = exports["<script-name>"]:GetState()
```

## Commands

### `/command`

What it does and required permission.

## Changelog

### `0.1.0` - `YYYY-MM-DD`

- Initial release

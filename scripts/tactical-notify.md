# CB Studios - Tactical Notification Documentation

<div style="text-align: center;">
  <img src="https://img.shields.io/badge/CB%20Studios-FiveM%20Development-blue?style=for-the-badge" alt="CB Studios" />
  <img src="https://img.shields.io/badge/version-1.0.0-green?style=for-the-badge" alt="Version" />
  <img src="https://img.shields.io/badge/status-stable-brightgreen?style=for-the-badge" alt="Status" />
  <img src="https://img.shields.io/badge/framework-ESX%20%7C%20QBCore%20%7C%20Standalone-orange?style=for-the-badge" alt="Framework" />
</div>


<!-- # 📺 Showcase

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
</div> -->

------------------------------------------------------------------------

# 📖 Overview

| Field | Value |
|---|---|
| Resource | `cb_opsNotify` |
| Author | **CB Studios** |
| Framework | ESX / QBCore / Standalone |
| Version | `1.0.0` |
| Status | Stable |
| License | `MIT` |

### Description

> `cb_opsNotify` is a tactical and lightweight notification + help-prompt system for FiveM servers, with NUI UI, sound feedback, client/server exports, and automatic compatibility hooks for ESX and QBCore.

------------------------------------------------------------------------

# ✨ Features

- Tactical/survival NUI notification style
- Help prompt API (`CreateHelp` / `RemoveHelp`)
- Sound-enabled feedback (`html/sounds/pop.ogg`)
- Flexible payload parser (string and table signatures)
- Client and server exports for easy integration
- Built-in compatibility listeners for common ESX/QBCore events
- Auto-hook support for `QBCore.Functions.Notify` and `ESX.ShowNotification`
- Resource lifecycle safety handling (restart/stop cleanup)
- Folder-name validation and anti-rename protection

------------------------------------------------------------------------

# 📦 Requirements

| Requirement | Details |
|---|---|
| FiveM Server | Latest recommended build |
| Framework | ESX / QBCore / Standalone |
| Database | Not required |
| fxmanifest | `fx_version 'cerulean'`, `game 'gta5'`, `lua54 'yes'` |
| Dependencies | None mandatory |

Optional framework resources for auto-hook features:

- `qb-core`
- `es_extended`

------------------------------------------------------------------------

# 📥 Installation

### 1️⃣ Download

Download the resource and extract it.

### 2️⃣ Place in resources folder

```text
resources/[your_folder]/cb_opsNotify
```

### 3️⃣ Add to server.cfg

```cfg
## CB Studios
ensure cb_opsNotify
```

### 4️⃣ Restart server

```cfg
restart cb_opsNotify
```

### 5️⃣ Verify

Check the server console and confirm the resource starts without errors.

------------------------------------------------------------------------

# ⚙️ Configuration

This script does not include a dedicated `config.lua` by default.

Main tunable values are in code:

```lua
-- html/script.js
-- notificationSound.volume = 0.35
-- default duration fallback = 5000 ms
-- minimum duration clamp = 300 ms

-- client.lua / server.lua
-- notification type normalization
-- payload parsing signatures
-- ESX/QBCore hook behavior
```

### Config Explanation

| Option | Description |
|---|---|
| `notificationSound.volume` | Notification sound volume |
| default duration | Used when duration is not provided |
| minimum duration | Prevents too-short notifications |
| hook behavior | Controls ESX/QBCore compatibility patching |

------------------------------------------------------------------------

# 🎮 Usage

### Commands

| Command | Description | Permission |
|---|---|---|
| `/cbopsnotify-unbug` | Releases NUI input/focus if controls get stuck | Everyone |
| `/test-key` | Shows a help prompt for 5 seconds | Everyone (test command) |
| `/notify-success` | Shows a success notification | Everyone (test command) |
| `/notify-warning` | Shows a warning notification | Everyone (test command) |
| `/notify-error` | Shows an error notification | Everyone (test command) |
| `/notify-business` | Shows business style (mapped to `primary`) | Everyone (test command) |
| `/notify` | Shows a default info notification | Everyone (test command) |

------------------------------------------------------------------------

### Keybinds

| Key | Action |
|---|---|
| Dynamic | No fixed keybind. Keys are defined when calling `CreateHelp(key, text)` |

------------------------------------------------------------------------

# 🔌 Developer Integration

## Server Events

```lua
RegisterNetEvent('cb_opsNotify:server:showNotification', function(target, arg1, arg2, arg3, arg4)
    -- Sends notification payload to target client
end)
```

| Event | Parameters | Description |
|---|---|---|
| `cb_opsNotify:server:showNotification` | `target, arg1, arg2, arg3, arg4` | Sends notification to a target player (or fallback to source if target is invalid) |

------------------------------------------------------------------------

## Client Events

```lua
RegisterNetEvent('cb_opsNotify:client:showNotification', function(data)
    -- Shows notification payload in NUI
end)
```

| Event | Parameters | Description |
|---|---|---|
| `cb_opsNotify:client:showNotification` | `data` | Main event to display notification payload |
| `QBCore:Notify` | `message, notifyType, length` | QBCore compatibility listener |
| `esx:showNotification` | `message, notifyType, length, title` | ESX compatibility listener |
| `esx:showAdvancedNotification` | `sender, subject, msg` | ESX advanced compatibility listener |

------------------------------------------------------------------------

## Exports

Example usage:

```lua
-- Client
exports['cb_opsNotify']:ShowNotification('Welcome', 'success', 5000)
local id = exports['cb_opsNotify']:CreateHelp('E', 'Press to interact')
exports['cb_opsNotify']:RemoveHelp(id)

-- Server
exports['cb_opsNotify']:ShowNotification(source, 'Server restart in 10 minutes', 'warning', 7000)
```

| Export | Side | Description |
|---|---|---|
| `ShowNotification(...)` | Client | Displays notifications (supports multiple signatures) |
| `CreateHelp(key, text)` | Client | Creates a help prompt and returns an ID |
| `RemoveHelp(id)` | Client | Removes one prompt by ID or all prompts if `id` is nil |
| `ShowNotification(target, ...)` | Server | Sends a notification payload to a client |

------------------------------------------------------------------------

# 🧪 Debugging & Common Issues

### Resource does not start

- Verify folder name is exactly `cb_opsNotify` (legacy `cb_opsnotify` still accepted)
- Check `server.cfg` entry
- Look for validation logs in server console

### Notifications not visible

- Verify NUI files exist in `html/`
- Confirm `ui_page` and `files` entries in `fxmanifest.lua`

### Controls stuck after restart

- Run `/cbopsnotify-unbug`
- Restart `cb_opsNotify`

### Framework notifications not redirected

- Ensure `qb-core` or `es_extended` started correctly
- Restart `cb_opsNotify` after framework resources

------------------------------------------------------------------------

# 🔄 Updating the Script

1. Backup any custom changes (`custom/main.lua`, NUI files, etc.)
2. Stop the resource
3. Replace old version with the new version
4. Re-apply custom changes
5. Restart the resource and test with `/notify` or `/test-key`

------------------------------------------------------------------------

# 📬 Support

When requesting support provide:

| Information | Example |
|---|---|
| Script | `cb_opsNotify v1.0.0` |
| Framework | ESX / QBCore / Standalone |
| Server Build | Latest recommended |
| Issue | Steps to reproduce |
| Logs | Server/client console output |
| Folder Name | `cb_opsNotify` |

------------------------------------------------------------------------

<div style="text-align: center;">
  <strong>CB Studios</strong><br />
  FiveM Development Resources
</div>

# 🔔 cb_opsNotify - Full Documentation

# 📌 OVERVIEW

`cb_opsNotify` is a complete tactical notification and help-prompt system for FiveM servers.

It includes:

- NUI notification system with tactical/survival visual style
- Help prompt interaction API (`CreateHelp` / `RemoveHelp`)
- Sound-enabled feedback with bundled `pop.ogg`
- Flexible notification payload parser (string and table signatures)
- Client and server exports for easy integration
- Built-in compatibility listeners for common QBCore and ESX notification events
- Auto-hook support for `QBCore.Functions.Notify` and `ESX.ShowNotification`
- Resource lifecycle safety handling (startup/stop cleanup and focus release)
- Folder-name security validation and anti-rename protection

Current version: `1.0.0`  
License: `MIT`

---

# 📦 REQUIREMENTS

- ✅ FiveM server (recommended latest artifacts)
- ✅ `fx_version 'cerulean'`
- ✅ `lua54 'yes'`
- ❌ Database dependency required: **No**
- ❌ Framework dependency required: **No**

Optional frameworks for auto-hook features:
- `qb-core`
- `es_extended`

---

# 📥 INSTALLATION

1. Place the resource in your server `resources` folder:

```text
resources/[cb_script]/cb_opsNotify
```

2. Add this to `server.cfg`:

```cfg
## CB Studios
ensure cb_opsNotify
```

3. Restart your server or resource:

```cfg
restart cb_opsNotify
```

4. Check server console for startup validation logs.

---

# 🧱 RESOURCE STRUCTURE

```text
cb_opsNotify/
  client.lua
  server.lua
  fxmanifest.lua
  LICENSE
  README.md
  custom/
    main.lua
  html/
    index.html
    style.css
    script.js
    sounds/
      pop.ogg
```

---

# ⚙️ CONFIGURATION

This script has **no dedicated `config.lua`** by default.

Main tunable values are inside code:

- `html/script.js`
  - `notificationSound.volume = 0.35`
  - default duration fallback (`5000` ms)
  - minimum duration clamp (`300` ms)
- `client.lua` / `server.lua`
  - notification type normalization
  - payload parsing (table/text signatures)
  - framework hook behavior

### Notification Types

Supported types:

- `info`
- `success`
- `success-dark`
- `error`
- `warning`
- `primary`
- `business` (auto-mapped to `primary`)

---

# 🎮 USAGE

## Commands

| Command | Description | Permission / Notes |
|---|---|---|
| `/cbopsnotify-unbug` | Releases NUI input/focus if controls get stuck after restart. | Everyone |
| `/test-key` | Shows a help prompt for 5 seconds. | Test command (`custom/main.lua`) |
| `/notify-success` | Shows a success notification. | Test command |
| `/notify-warning` | Shows a warning notification. | Test command |
| `/notify-error` | Shows an error notification. | Test command |
| `/notify-business` | Shows business notification style (`primary`). | Test command |
| `/notify` | Shows default info notification. | Test command |

## Player/Staff Flow

- Trigger notifications from scripts using exports or events.
- Use `CreateHelp` / `RemoveHelp` to manage interaction prompts.
- UI appears in top-right (notifications) and bottom-center (help prompts).

---

# 🔌 EVENTS & EXPORTS (DEVELOPERS)

## Client Events

| Event name | Parameters | Description |
|---|---|---|
| `cb_opsNotify:client:showNotification` | `data` (table) | Main event to display notification payload. |
| `QBCore:Notify` | `message`, `notifyType`, `length` | Compatibility listener for QBCore-style notifications. |
| `esx:showNotification` | `message`, `notifyType`, `length`, `title` | Compatibility listener when ESX is not actively handling it. |
| `esx:showAdvancedNotification` | `sender`, `subject`, `msg` | Compatibility listener for ESX advanced format. |

## Server Events

| Event name | Parameters | Description |
|---|---|---|
| `cb_opsNotify:server:showNotification` | `target`, `arg1`, `arg2`, `arg3`, `arg4` | Sends notification payload to a target player (or fallback to source if target is not a number). |

## Client Exports

```lua
exports['cb_opsNotify']:ShowNotification(...)
exports['cb_opsNotify']:CreateHelp(key, text)
exports['cb_opsNotify']:RemoveHelp(id) -- pass nil to remove all
```

### `ShowNotification` supported signatures (client)

1. `ShowNotification(title, message, type, duration)`
2. `ShowNotification(message, type, duration)`
3. `ShowNotification({ title=..., message=..., type=..., duration=... })`

Accepted table aliases:
- `message` also accepts `text`, `msg`, `description`
- `duration` also accepts `time`, `length`

## Server Export

```lua
exports['cb_opsNotify']:ShowNotification(target, ...)
```

### Example

```lua
exports['cb_opsNotify']:ShowNotification(source, 'Welcome to the server', 'success', 5000)

exports['cb_opsNotify']:ShowNotification(source, {
    title = 'Server',
    message = 'Restart in 10 minutes',
    type = 'warning',
    duration = 7000
})
```

---

# 🧩 FRAMEWORK COMPATIBILITY

## Auto-Hook Behavior

When framework resources are already started (or start later), `cb_opsNotify` attempts to hook:

- `qb-core`
  - overrides `QBCore.Functions.Notify`
- `es_extended`
  - overrides `ESX.ShowNotification`
  - overrides `ESX.ShowAdvancedNotification`

The script retries hooks for up to ~60 seconds on startup and also re-checks when `qb-core` or `es_extended` starts.

## Standalone Mode

If no framework is running, the resource still works fully via native events/exports.

---

# 🎨 UI & UX DETAILS

- 🔊 Notification sound: `html/sounds/pop.ogg`
- 🔉 Sound preload enabled on UI load
- ⏱️ Minimum duration: `300 ms`
- ⏱️ Default duration: `5000 ms`
- 📍 Notification placement: top-right
- 📍 Help prompt placement: bottom-center
- 📱 Responsive CSS for small screens (`@media max-width: 600px`)

---

# 🛡️ SECURITY VALIDATION

`server.lua` validates folder name before allowing the resource to run:

- Expected name: `cb_opsNotify`
- Legacy accepted: `cb_opsnotify` (with warning)
- Any other name: resource is stopped and blocked

This prevents renamed-resource misuse and prints clear console diagnostics.

---

# 🧪 DEBUGGING & COMMON ISSUES

1. **Resource does not start**
   - Verify folder name is exactly `cb_opsNotify`.
   - Check console validation output from `server.lua`.
   - Confirm `ensure cb_opsNotify` is in `server.cfg`.

2. **Notifications not visible**
   - Confirm NUI files exist (`html/index.html`, `html/style.css`, `html/script.js`).
   - Make sure `ui_page` and `files` are intact in `fxmanifest.lua`.

3. **Controls stuck after restart**
   - Run `/cbopsnotify-unbug`.
   - Restart the resource once.

4. **Framework notifications still using default UI**
   - Ensure `qb-core` / `es_extended` is started and not failing.
   - Restart `cb_opsNotify` after framework startup.

5. **Metadata parse issues in manifest**
   - Keep `fxmanifest.lua` encoded as UTF-8 (without BOM).

---

# 🔄 UPDATES

1. Backup any edited files (`custom/main.lua`, NUI style/scripts, framework modifications).
2. Stop the resource.
3. Replace with the new version.
4. Re-apply custom changes.
5. Start the resource and test with:
   - `/notify`
   - `/notify-success`
   - `/test-key`

---

# 📌 NOTES

- `custom/main.lua` contains demo commands and can be customized.
- `escrow_ignore` includes `custom/*.lua` for safe customization.
- You can integrate this resource entirely through exports/events without editing framework core files.

---

# 📬 SUPPORT

When requesting support, provide:

- Script name and version: `cb_opsNotify v1.0.0`
- Framework in use: `Standalone`, `QBCore`, or `ESX`
- FiveM artifact version
- Exact reproduction steps
- Server/client console logs
- Confirmation of folder name (`cb_opsNotify`)

---

## 👤 Credits
- Author: `Pichirin_CB`
- Discord: `https://discord.gg/hsx6AvBg5s`
- Store: `https://store.pichirincb.com/`
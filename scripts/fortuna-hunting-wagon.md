# Fortuna Hunting Wagon

<div style="text-align: center;">
  <img src="https://img.shields.io/badge/CB%20Studios-RedM%20Development-blue?style=for-the-badge" alt="CB Studios" />
  <img src="https://img.shields.io/badge/version-2.1.0-green?style=for-the-badge" alt="Version 2.1.0" />
  <img src="https://img.shields.io/badge/game-RedM-red?style=for-the-badge" alt="RedM" />
  <img src="https://img.shields.io/badge/framework-Standalone%20%7C%20VORP-orange?style=for-the-badge" alt="Standalone and VORP compatible" />
  <img src="https://img.shields.io/badge/license-GPL--3.0-blueviolet?style=for-the-badge" alt="GPL-3.0-or-later" />
</div>

---

# 📖 Overview

| Field | Value |
| --- | --- |
| Resource | `fortuna_huntingwagon` |
| Studio | **CB Studios** |
| Author | **pichirin_cb** |
| Game | RedM |
| Framework | Standalone, with automatic VORP notification support |
| Version | `2.1.0` |
| Database | Not required |
| License | GPL-3.0-or-later |

### Description

> Fortuna Hunting Wagon is a secure and immersive session-based cargo system for the native RedM `huntercart01`. Players can store dead animals and carriable pelts, load otherwise uncarryable large carcasses from the rear of the wagon, retrieve cargo safely, and see the native wagon tarp react to occupied capacity.

The resource uses server-side validation, per-player and per-wagon transaction locks, confirmed entity deletion, reserved retrieval capacity, network-entity validation and automatic rollback to reduce duplication and invalid cargo operations.

---

# ✨ Features

- Secure storage for supported carcasses and large pelts.
- Direct loading of large dead animals that cannot be carried by hand.
- Configurable capacity and individual cargo sizes.
- Native `huntercart01` tarp visualization.
- Last-in, first-out cargo retrieval.
- Server validation of models, entity types, health, distance and capacity.
- Per-player and per-wagon transaction locking.
- Confirmed entity deletion before a store transaction is committed.
- Reserved capacity while a retrieval is pending.
- Validation of the newly created network entity before retrieval completes.
- Automatic rollback after failed creation, timeout or disconnect.
- Protection against network ID reuse by pairing IDs with entity handles.
- State-bag cleanup when the resource starts or stops.
- Public, ACE, state-bag and custom wagon access modes.
- VORP, chat and custom notification adapters.
- Localized Discord embeds with queueing and rate-limit retries.
- English, Portuguese, French, German, Spanish and Romanian locales.
- Client and server exports for third-party integrations.
- No SQL, menu library, target system or mandatory framework dependency.

---

# 📦 Requirements

| Requirement | Details |
| --- | --- |
| Server | Current RedM server artifact |
| Networking | OneSync/state awareness enabled |
| Wagon | A resource that creates or sells `huntercart01` |
| Hunting | Optional; required only to sell/process retrieved cargo |
| Database | None |
| Framework | None required |

The resource was designed around VORP Hunting and VORP Stables, but its cargo core does not import VORP APIs. When VORP is unavailable, the automatic notification adapter falls back to the standard chat resource or client console.

---

# 📥 Installation

### 1️⃣ Download

Download the resource and keep its folder name as:

```text
fortuna_huntingwagon
```

### 2️⃣ Place it in the resources folder

```text
resources/[standalone]/fortuna_huntingwagon
```

### 3️⃣ Add it to `server.cfg`

Start the resource after the stable or wagon resource:

```cfg
## CB Studios
ensure vorp_stables
ensure fortuna_huntingwagon
```

If another resource supplies `huntercart01`, replace `vorp_stables` with that resource name.

### 4️⃣ Configure

Edit:

```text
fortuna_huntingwagon/shared/config.lua
```

### 5️⃣ Restart

```text
restart fortuna_huntingwagon
```

### 6️⃣ Verify

The server console should show:

```text
[Fortuna Hunting Wagon] v2.1.0 loaded successfully — by pichirin_cb
```

No SQL import is required.

---

# ⚙️ Configuration

## Core settings

```lua
Config.Locale = "es" -- en, pt, fr, de, es, ro
Config.Debug = false

Config.WagonModel = `huntercart01`
Config.MaxCapacity = 14
Config.InteractionDistance = 1.65
Config.PlayerValidationDistance = 2.75
Config.CargoValidationDistance = 3.25
Config.GroundCargoDistance = 2.0
Config.Control = 0xE30CD707 -- R
```

| Option | Description |
| --- | --- |
| `Locale` | Language used by prompts, notifications and Discord logs |
| `Debug` | Enables additional diagnostic output |
| `WagonModel` | Supported hunting-wagon model |
| `MaxCapacity` | Maximum capacity units per wagon |
| `InteractionDistance` | Client interaction distance from the rear of the wagon |
| `PlayerValidationDistance` | Server validation margin for the player |
| `CargoValidationDistance` | Server validation margin for cargo |
| `GroundCargoDistance` | Maximum distance for direct loading from the ground |
| `Control` | RedM control hash used by the hold prompt |

## Capacity

Cargo sizes are defined in `Config.Cargo`:

```lua
Config.Cargo = {
    [`a_c_rabbit_01`] = 1,
    [`a_c_deer_01`] = 2,
    [`p_cs_pelt_xlarge_alligator`] = 2
}
```

With the default capacity of `14`:

- Small or medium cargo using one unit: up to 14 pieces.
- Large carcasses or pelts using two units: up to 7 pieces.
- Different cargo sizes may be combined until the maximum is reached.

Every model and size is validated by the server. Sizes must be positive integers.

## Notifications

```lua
Config.Notification = {
    System = "auto", -- auto, vorp, chat, custom
    CustomEvent = ""
}
```

For a custom notification resource:

```lua
Config.Notification.System = "custom"
Config.Notification.CustomEvent = "my_notifications:show"
```

The custom event receives:

```lua
message, duration
```

## Wagon access

### Public access

```lua
Config.Access.Mode = "public"
```

Every nearby player may use every hunting wagon.

### ACE access

```lua
Config.Access.Mode = "ace"
Config.Access.AcePermission = "fortuna_huntingwagon.use"
```

Example permission:

```cfg
add_ace group.hunter fortuna_huntingwagon.use allow
```

### State-bag ownership

```lua
Config.Access.Mode = "statebag"
Config.Access.OwnerStateBag = "owner"
```

The configured state-bag value must match the player's server ID or one of the player's identifiers.

### Custom stable integration

```lua
Config.Access.CustomCheck = function(source, wagon)
    local wagonNetId = NetworkGetNetworkIdFromEntity(wagon)
    return exports.my_stable:CanUseWagon(source, wagonNetId)
end
```

`CustomCheck` takes priority over all built-in access modes.

---

# 🌐 Localization

| Code | Language |
| --- | --- |
| `en` | English |
| `pt` | Portuguese |
| `fr` | French |
| `de` | German |
| `es` | Spanish |
| `ro` | Romanian |

Select a language:

```lua
Config.Locale = "en"
```

To add another locale, copy `locales/en.lua`, translate every value and register the new locale key. Missing translations fall back to English.

---

# 📝 Discord Logs

Discord logs are disabled by default to prevent credentials from being published.

### 1️⃣ Enable logging

```lua
Config.Discord.Enabled = true
```

### 2️⃣ Add the private webhook to `server.cfg`

```cfg
set fortuna_huntingwagon_webhook "YOUR_PRIVATE_WEBHOOK"
```

Do not place a production webhook inside a public repository. If a webhook is exposed, regenerate it in Discord immediately; deleting it from the latest file does not invalidate the leaked token.

Available log categories:

- Cargo stored.
- Cargo retrieved.
- Rejected security-sensitive requests.

The embeds use the selected locale and include the player, identifier, cargo type/model, wagon network ID, occupied capacity, coordinates and UTC timestamp. Logs use a bounded queue and retry temporary failures or Discord rate limits.

---

# 🎮 Usage

### Store carried cargo

1. Carry a supported dead animal or pelt.
2. Approach the rear of `huntercart01`.
3. Hold `R` when **Store animal or pelt** appears.

### Store a large carcass

1. Move the rear of the wagon close to the dead animal.
2. Stand near the rear of the wagon.
3. Hold `R` to store the nearby carcass directly.

This supports large animals that Red Dead Redemption 2 does not allow players to lift.

### Retrieve cargo

1. Approach the rear without carrying anything.
2. Hold `R` when **Retrieve last cargo** appears.
3. The resource recreates and validates the cargo before placing it into the player's hands.

Cargo is retrieved in last-in, first-out order.

### Commands

This resource does not register player commands.

### Keybinds

| Key | Action |
| --- | --- |
| `R` | Hold to store or retrieve hunting cargo |

The key uses `Config.Control` and can be changed in the configuration.

---

# 💾 Persistence

Cargo is session-based and associated with the wagon's current network entity:

- Cargo remains available while the wagon entity and resource continue to exist.
- Cargo is discarded when the wagon entity is removed.
- Cargo is not saved across a server or resource restart.
- Stale state-bag capacity is reset automatically during startup and shutdown.

Persistent ownership storage is intentionally not bundled because stable resources use different permanent wagon identifiers. A persistence adapter should map its stable ID to serialized cargo.

---

# 🔌 Developer Integration

## Server events

### Cargo stored

```lua
AddEventHandler("fortuna_huntingwagon:server:cargoStored", function(source, wagonNetId, model, size, occupied)
    print(("Player %s stored model %s"):format(source, model))
end)
```

### Cargo retrieved

```lua
AddEventHandler("fortuna_huntingwagon:server:cargoRetrieved", function(source, wagonNetId, model, size, occupied)
    print(("Player %s retrieved model %s"):format(source, model))
end)
```

| Event | Parameters | Description |
| --- | --- | --- |
| `fortuna_huntingwagon:server:cargoStored` | `source, wagonNetId, model, size, occupied` | Fired after confirmed storage |
| `fortuna_huntingwagon:server:cargoRetrieved` | `source, wagonNetId, model, size, occupied` | Fired after the recreated entity is validated |

These are server-side notification events. They are not client-authorized cargo mutation APIs.

## Client exports

```lua
local wagon, distance = exports.fortuna_huntingwagon:GetClosestHuntingWagon(5.0)
local cargo = exports.fortuna_huntingwagon:GetCarriedHuntingCargo()
local locale = exports.fortuna_huntingwagon:GetLocale()
```

| Export | Returns | Description |
| --- | --- | --- |
| `GetClosestHuntingWagon(maxDistance)` | `wagon, distance` or `nil` | Returns the closest supported wagon within the requested distance |
| `GetCarriedHuntingCargo()` | Entity or `nil` | Returns the supported entity currently carried by the player |
| `GetLocale()` | String | Returns the selected locale |

## Server exports

```lua
local supported = exports.fortuna_huntingwagon:IsSupportedCargo(modelHash)
local status = exports.fortuna_huntingwagon:GetWagonStatus(wagonNetId)
local allowed = exports.fortuna_huntingwagon:CanAccessWagon(playerSource, wagonNetId)
local locale = exports.fortuna_huntingwagon:GetLocale()
```

| Export | Returns | Description |
| --- | --- | --- |
| `IsSupportedCargo(model)` | Boolean | Checks whether a model exists in `Config.Cargo` |
| `GetWagonStatus(wagonNetId)` | Table | Returns `count`, `occupied`, `reserved` and `maximum` |
| `CanAccessWagon(source, wagonNetId)` | Boolean | Runs the configured wagon access policy |
| `GetLocale()` | String | Returns the selected locale |

## Custom Discord export

```lua
exports.fortuna_huntingwagon:SendDiscordLog("security", playerSource, {
    reason = "reason_invalid_store",
    coords = GetEntityCoords(GetPlayerPed(playerSource))
})
```

Supported log kinds are `store`, `retrieve` and `security`.

---

# 🔐 Security Design

- The server derives cargo size and supported model status from its configuration.
- Living peds, unsupported models, invalid entity types and distant entities are rejected.
- Client metadata is type-checked and numerically bounded.
- Store operations commit only after entity deletion is confirmed.
- Transactions lock both the player and wagon.
- Pending retrievals reserve their original capacity.
- Recreated cargo must have the expected model, entity type, health and location.
- Failed or expired retrievals automatically return their reservation to the wagon.
- Wagon network IDs are paired with entity handles to prevent ID-reuse inheritance.
- Discord input is sanitized and role mentions use explicit allowed-mention rules.
- Public exports do not insert arbitrary cargo.

---

# 🧪 Debugging & Common Issues

### The resource does not start

- Confirm the folder is named `fortuna_huntingwagon`.
- Verify the `ensure` line in `server.cfg`.
- Confirm every configuration value passes startup validation.
- Check the server console for the exact configuration error.

### The interaction prompt does not appear

- Confirm the vehicle model is `huntercart01`.
- Stand near the rear of the wagon.
- Carry a configured entity or place a configured dead animal near the rear.
- Confirm another resource is not suppressing prompts.

### Access is denied

- Check `Config.Access.Mode`.
- For ACE mode, verify `fortuna_huntingwagon.use` is granted.
- For state-bag mode, inspect the wagon's configured owner state.
- Test the return value of a custom access function.

### A pelt cannot be retrieved

- Check the client console for model or native errors.
- Confirm the pelt model exists in `Config.Cargo`.
- Verify no other hunting resource deletes the recreated entity.

### Discord logs do not appear

- Set `Config.Discord.Enabled = true`.
- Configure the webhook using the `fortuna_huntingwagon_webhook` convar.
- Temporarily enable `Config.Debug`.
- Confirm Discord returns an HTTP `2xx` response.
- Verify the webhook has not been deleted or regenerated.

### Cargo disappears after restart

This is expected. The public release uses session-based storage and automatically resets stale capacity state.

---

# 🔄 Updating the Script

1. Back up `shared/config.lua`.
2. Stop `fortuna_huntingwagon`.
3. Replace the resource files.
4. Review `CHANGELOG.md`.
5. Merge new configuration options manually.
6. Never copy an old webhook into a public configuration file.
7. Start the resource.
8. Test storing, retrieving, full capacity, timeout rollback and access permissions.

---

# 📜 License

Copyright © 2026 **pichirin_cb / CB Studios**.

Fortuna Hunting Wagon is free software licensed under the **GNU General Public License v3.0 or later**.

You may:

- ✔ Use the resource on your server.
- ✔ Study and modify the source code.
- ✔ Redistribute it under the GPL terms.

When distributing the original or a modified version, you must:

- Preserve applicable copyright and license notices.
- Provide the corresponding source code.
- License the distributed derivative under GPL-3.0-or-later.
- Clearly identify significant modifications.

Open-source software cannot technically prevent local modifications. The license protects the source-code freedoms, attribution notices and redistribution conditions.

See the included `LICENSE` file for the complete terms.

---

# 📬 Support

Before requesting support, read the documentation and prepare:

| Information | Example |
| --- | --- |
| Script | Fortuna Hunting Wagon v2.1.0 |
| Game | RedM |
| Framework | Standalone or VORP |
| Server artifact | Exact artifact version |
| Issue | Clear reproduction steps |
| Logs | Relevant client/server console output |

- Documentation: [docs.pichirincb.com](https://docs.pichirincb.com/#/)
- Community and support: [CB Studios Discord](https://discord.gg/hsx6AvBg5s)

Never publish webhook tokens, database credentials or private player identifiers in support channels.

---

<div style="text-align: center;">
  <strong>CB Studios</strong><br />
  RedM Development Resources<br /><br />
  <a href="https://docs.pichirincb.com/#/">Documentation</a> ·
  <a href="https://discord.gg/hsx6AvBg5s">Discord Community</a><br /><br />
  <strong>Fortuna Hunting Wagon — by pichirin_cb</strong>
</div>

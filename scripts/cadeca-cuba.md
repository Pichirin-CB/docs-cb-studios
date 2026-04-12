# CB Studios - CADECA Cuba Exchange Documentation

<div style="text-align: center;">
  <img src="https://img.shields.io/badge/CB%20Studios-FiveM%20Development-blue?style=for-the-badge" alt="CB Studios" />
  <img src="https://img.shields.io/badge/version-1.0.0-green?style=for-the-badge" alt="Version" />
  <img src="https://img.shields.io/badge/status-stable-brightgreen?style=for-the-badge" alt="Status" />
  <img src="https://img.shields.io/badge/framework-ESX%20%7C%20QBCore%20%7C%20QBox%20%7C%20Custom-orange?style=for-the-badge" alt="Framework" />
</div>

------------------------------------------------------------------------

<!-- # 📺 Showcase

<div align="center" style="margin-bottom: 1.5rem;">
  <iframe
    width="640"
    height="360"
    src="https://www.youtube.com/embed/VIDEO_ID_HERE"
    title="cb_cadeca-cuba showcase"
    frameborder="0"
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
    allowfullscreen
    style="max-width: 100%; border-radius: 12px;"
  ></iframe>
</div> -->

------------------------------------------------------------------------

# 📖 Overview

| Field | Value |
| --- | --- |
| Resource | `cb_cadeca-cuba` |
| Author | **CB Studios / Pichirin_CB** |
| Framework | ESX / QBCore / QBox / Custom |
| Version | `1.0.0` |
| Status | Stable |

### Description

`cb_cadeca-cuba` is a Cuban-style exchange house script for FiveM that
handles USD <-> CUP conversion with configurable rates, optional fees, NPC
interaction, target-system fallback, anti-abuse protections, webhook logging,
and adapter support for multiple frameworks and inventory systems.

------------------------------------------------------------------------

# ✨ Features

- NPC-based CADECA interaction with optional map blip.
- Buy and sell USD using CUP item currency.
- Dynamic rates and optional percentage fees.
- Framework auto-detection (`qb`, `qbx`, `esx`, custom).
- Inventory auto-detection (`ox`, `qb`, `qs`, custom).
- Target auto-detection (`ox_target`, `qb-target`, `qtarget`) plus fallback key interaction.
- Optional electrical dependency with `cb_electrica-cuba`.
- Anti-abuse controls (cooldown, rate window, distance checks).
- In-memory and optional SQL transaction history.
- Discord webhook channels for exchange, suspicious activity and errors.
- Extensive client/server exports for integrations.

------------------------------------------------------------------------

# 📦 Requirements

| Requirement | Details |
| --- | --- |
| FiveM Server | Latest recommended artifact |
| Framework | `qb-core`, `qbx-core`/`qbx_core`, `es_extended`, or custom adapter |
| Inventory | `ox_inventory`, `qb-inventory`, `qs-inventory`, or custom adapter |
| Database | `oxmysql` only if SQL history is enabled |
| UI Runtime | Built files in `html/` (already included in resource) |

Optional dependencies:

- `ox_lib` (notification system).
- `rpemotes` or `rpemotes-reborn` (tablet emote while UI is open).
- `cb_electrica-cuba` (if `Config.PowerDependency.Enabled = true`).

------------------------------------------------------------------------

# 📥 Installation

### 1️⃣ Download

Download the resource and extract it.

### 2️⃣ Place in resources folder

```txt
resources/[your_folder]/cb_cadeca-cuba
```

### 3️⃣ Add to server.cfg

```cfg
## CB Studios
ensure cb_cadeca-cuba
```

### 4️⃣ Configure the script

Edit:

```txt
shared/config.lua
```

### 5️⃣ Register CUP item

Use the item snippet for your inventory:

```txt
INSTALL_FILES/item_ox_inventory.lua
INSTALL_FILES/item_qb_inventory.lua
INSTALL_FILES/item_qs_inventory.lua
```

Copy icon:

```txt
INSTALL_FILES/inventory_icon/cup.png
```

to your inventory images folder.

### 6️⃣ Optional SQL history setup

If you plan to use DB history (`Config.History.UseDatabase = true`), import:

```txt
INSTALL_FILES/install.sql
```

### 7️⃣ Restart server

```cfg
restart cb_cadeca-cuba
```

### 8️⃣ Verify

Check server console for successful load and adapter selection logs.

------------------------------------------------------------------------

# ⚙️ Configuration

Main file:

```txt
shared/config.lua
```

Production-safe baseline example:

```lua
Config = {}

Config.Debug = false
Config.Locale = 'es'
Config.Framework = 'auto'
Config.Inventory = 'auto'

Config.UsdAccount = 'cash'
Config.CupItem = 'cup'

Config.Rates = {
    BuyUsdWithCup = 500,
    SellUsdForCup = 480,
    MinUsdPerTransaction = 1,
    MaxUsdPerTransaction = 100000
}

Config.Fees = {
    Enabled = true,
    BuyPercent = 2.5,
    SellPercent = 1.0
}

Config.Target = 'auto'
Config.TargetFallback = {
    Enabled = true,
    Key = 38, -- E
    Distance = 2.0,
    Text = '[E] Open CADECA'
}

Config.PowerDependency = {
    Enabled = false
}

Config.History = {
    Enabled = true,
    KeepLastInMemory = 30,
    UseDatabase = false,
    Table = 'cb_cadeca_history'
}
```

### Config Explanation

| Option | Description |
| --- | --- |
| `Config.Debug` | Enables debug prints in client/server. Use `false` in production. |
| `Config.Locale` | Language key loaded from `locales/*.lua` (`en` / `es`). |
| `Config.Framework` | `auto`, `qb`, `esx`, `qbx`, `custom`. |
| `Config.Inventory` | `auto`, `ox`, `qb`, `qs`, `custom`. |
| `Config.UsdAccount` | USD account in framework (`cash`/`bank` for QB; normalized for ESX). |
| `Config.CupItem` | Inventory item name used as CUP currency. |
| `Config.Rates` | Buy/sell rates and USD min/max per transaction. |
| `Config.Fees` | Optional fee percentages for buy/sell. |
| `Config.NPC` | Enables NPC, model, coords, scenario and interaction distance. |
| `Config.Blip` | Map blip visibility and style. |
| `Config.Target` | Target mode: `auto`, `qb`, `ox`, `qtarget`, `custom`. |
| `Config.TargetFallback` | 3D text + key fallback when target is unavailable. |
| `Config.PowerDependency` | Optional dependency with `cb_electrica-cuba`. |
| `Config.Notify` | Notify routing: `auto`, `ox`, `qb`, `esx`, `custom`. |
| `Config.Security` | Cooldown, per-window limits and distance guard. |
| `Config.History` | Memory/DB transaction history configuration. |
| `Config.Commands` | Command names, enable/disable set-rates command and ACE. |
| `Config.Webhooks` | Discord webhook channels for logs/security/errors. |

Security note:

- Replace webhook URLs before production.
- Keep resource folder name as `cb_cadeca-cuba` (name check protection is active).

------------------------------------------------------------------------

# 🎮 Usage

### Commands

| Command | Description | Permission |
| --- | --- | --- |
| `/cadeca` | Opens CADECA UI for player | Everyone (in-game) |
| `/cadeca_debug [id]` | Shows adapter/rates/balance debug state | Everyone (in-game) or console |
| `/cadeca_setrates <buy> <sell>` | Updates rates at runtime | Console or ACE `cb_cadeca.admin` |

Command names are configurable in `Config.Commands`.

------------------------------------------------------------------------

### Keybinds

| Key | Action |
| --- | --- |
| `E` (default) | Opens CADECA when fallback interaction is active |

The key can be changed in `Config.TargetFallback.Key`.

------------------------------------------------------------------------

# 🔌 Developer Integration

## Server Net Events (internal flow)

```lua
TriggerServerEvent('cb_cadeca:server:requestOpenData')
TriggerServerEvent('cb_cadeca:server:exchange', 'buy', 100)
```

| Event | Parameters | Description |
| --- | --- | --- |
| `cb_cadeca:server:requestOpenData` | none | Requests open payload (rates, balances, fees). |
| `cb_cadeca:server:exchange` | `action`, `usdAmount` | Executes buy/sell validation and transaction. |

------------------------------------------------------------------------

## Client Net Events

```lua
RegisterNetEvent('cb_cadeca:client:notify', function(message, notifyType)
    print(message, notifyType)
end)
```

| Event | Parameters | Description |
| --- | --- | --- |
| `cb_cadeca:client:openUi` | `payload` | Opens UI with current state. |
| `cb_cadeca:client:exchangeResult` | `result` | Returns transaction result and updated balances. |
| `cb_cadeca:client:ratesUpdated` | `payload` | Broadcasts rate updates to clients. |
| `cb_cadeca:client:notify` | `message`, `notifyType` | Client-side notification relay. |

------------------------------------------------------------------------

## Server Exports

Example:

```lua
local rates = exports['cb_cadeca-cuba']:GetRates()
local ok, err = exports['cb_cadeca-cuba']:SetRates(510, 490)
```

| Export | Description |
| --- | --- |
| `GetRates()` | Returns current buy/sell rates table. |
| `SetRates(buyRate, sellRate)` | Updates rates and broadcasts updates. Returns `ok, err`. |
| `GetCupItemName()` | Returns configured CUP item name. |
| `GetPlayerCup(src)` | Returns player CUP item count. |
| `GetPlayerUsd(src)` | Returns player USD balance from framework adapter. |
| `CanExchange(src, exchangeType, amount)` | Validates exchange without applying it. |
| `ExchangeBuy(src, usdAmount)` | Executes buy flow. |
| `ExchangeSell(src, usdAmount)` | Executes sell flow. |
| `GetLastTransaction(src)` | Returns last transaction for player. |
| `SetCustomInventoryAdapter(name, adapterTable)` | Registers custom inventory adapter at runtime. |
| `SetCustomFrameworkAdapter(name, adapterTable)` | Registers custom framework adapter at runtime. |

------------------------------------------------------------------------

## Client Exports

Example:

```lua
exports['cb_cadeca-cuba']:OpenCadeca()
local open = exports['cb_cadeca-cuba']:IsUiOpen()
```

| Export | Description |
| --- | --- |
| `OpenCadeca()` | Opens CADECA UI via server payload request. |
| `CloseCadeca()` | Closes CADECA UI. |
| `GetLocalCupCount()` | Returns local cached CUP amount from latest payload. |
| `GetLocalUsdBalance()` | Returns local cached USD balance from latest payload. |
| `GetCurrentRates()` | Returns local cached rates. |
| `FormatCurrency(amount)` | Utility formatter for UI-style numeric output. |
| `Notify(message, notifyType)` | Sends notification through configured client notify adapter. |
| `IsUiOpen()` | Returns `true` if UI is open. |
| `SetCustomNotifyAdapter(fn)` | Registers custom notify callback on client. |

------------------------------------------------------------------------

## Custom Adapter Signatures

Inventory adapter required functions:

```lua
adapterTable = {
  GetItemCount = function(src, itemName) return 0 end,
  AddItem = function(src, itemName, amount) return true end,
  RemoveItem = function(src, itemName, amount) return true end
}
```

Framework adapter required functions:

```lua
adapterTable = {
  GetUsd = function(src, account) return 0 end,
  AddUsd = function(src, account, amount, reason) return true end,
  RemoveUsd = function(src, account, amount, reason) return true end
}
```

------------------------------------------------------------------------

# 🧪 Debugging & Common Issues

### Resource does not start

- Verify folder name is exactly `cb_cadeca-cuba`.
- Confirm `ensure cb_cadeca-cuba` exists in `server.cfg`.
- Check console for security block (resource-name validation).

### Exchange fails or shows inventory/framework not ready

- Verify framework and inventory resources are started.
- Check `Config.Framework` and `Config.Inventory` values.
- Ensure the `cup` item exists in your selected inventory system.

### CADECA appears but cannot be used

- If power dependency is enabled, verify `cb_electrica-cuba` is online and circuit is ON.
- Check `Config.Security.RequireNearbyNpc` and distance limits.

### Set rates command denies permission

- Add ACE permission for admins:

```cfg
add_ace group.admin cb_cadeca.admin allow
```

- Or run the command directly from server console.

### SQL history not writing

- Set `Config.History.UseDatabase = true`.
- Import `INSTALL_FILES/install.sql`.
- Ensure `oxmysql` is started before this resource.

------------------------------------------------------------------------

# 🔄 Updating the Script

1. Backup `shared/config.lua`.
2. Stop the resource.
3. Replace old files with the new version.
4. Merge configuration changes.
5. Re-check item snippets and SQL changes from `INSTALL_FILES`.
6. Restart resource and validate logs.

------------------------------------------------------------------------

# 📬 Support

When requesting support provide:

| Information | Example |
| --- | --- |
| Script | `cb_cadeca-cuba v1.0.0` |
| Framework | `QBCore` / `ESX` / `QBox` / custom |
| Inventory | `ox_inventory` / `qb-inventory` / `qs-inventory` / custom |
| Server Build | Latest artifact |
| Issue | Reproduction steps |
| Logs | Server/client console output |

------------------------------------------------------------------------

<div style="text-align: center;">
  <strong>CB Studios</strong><br />
  FiveM Development Resources
</div>

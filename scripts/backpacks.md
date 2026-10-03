# CB Studios — Backpacks Documentation

<div style="text-align: center;">
  <img src="https://img.shields.io/badge/CB%20Studios-FiveM%20Development-blue?style=for-the-badge" alt="CB Studios" />
  <img src="https://img.shields.io/badge/version-1.0.0-green?style=for-the-badge" alt="Version" />
  <img src="https://img.shields.io/badge/status-stable-brightgreen?style=for-the-badge" alt="Status" />
  <img src="https://img.shields.io/badge/QBox%20%7C%20QBCore%20%7C%20ESX-orange?style=for-the-badge" alt="Framework" />
</div>

------------------------------------------------------------------------

# 🎒 Backpacks

## 📖 Overview

| Field | Value |
|---|---|
| Resource | `cb-backpacks` |
| Author | **CB Studios / Pichirin_CB** |
| Version | `1.0.0` |
| Framework | QBox / QBCore / ESX |
| Inventory | ox_inventory / qb-inventory / ps-inventory / qs-inventory |
| Status | Stable |

### Description

**CB Backpacks** is a persistent backpack and bag system for FiveM servers.

Each backpack receives a permanent unique ID and uses its own inventory stash, allowing its contents to persist across relogs, server restarts, and transfers between players.

The resource uses a modular bridge system to support multiple frameworks and inventory systems while providing optional physical backpack visuals and animations.

------------------------------------------------------------------------

# ✨ Features

- Persistent unique backpack IDs
- Individual stash storage for every backpack
- QBox support
- QBCore support
- ESX support
- ox_inventory support
- qb-inventory support
- ps-inventory support
- qs-inventory support
- Automatic framework and inventory detection
- Job-locked backpacks
- Per-backpack whitelist and blacklist
- Global whitelist and blacklist
- Multiple backpack restrictions
- Use cooldown
- Protection against backpacks inside other backpacks
- Optional physical backpack visuals
- Put-on and open animations
- Optional `cb-backpacks-clothing` integration
- Keybind for opening backpacks
- EN / ES / FR / TR locales
- Developer exports and events
- Server-side update checker

------------------------------------------------------------------------

# 🎒 Included Backpacks

The available backpacks are configurable through `config.lua`.

| Item | Label | Slots | Maximum Weight | Job Lock |
|---|---|---:|---:|---|
| `briefcase` | Maletín | 10 | 100 kg | None |
| `backpack_camper` | Mochila Camper | 40 | 400 kg | None |
| `medic_bag` | Maletín Médico | 15 | 150 kg | ambulance, doctor |
| `evidence_bag` | Bolsa de Evidencias | 20 | 200 kg | police |

These entries can be modified or extended through `Config.Backpacks`.

------------------------------------------------------------------------

# 📦 Requirements

| Requirement | Details |
|---|---|
| FiveM Server | Required |
| oxmysql | Required |
| Framework | QBox, QBCore or ESX |
| Inventory | ox_inventory, qb-inventory, ps-inventory or qs-inventory |
| Clothing | Optional |
| `cb-backpacks-clothing` | Optional |

### Supported Clothing Systems

When using physical backpack visuals, the resource supports:

- illenium-appearance
- fivem-appearance
- qb-clothing
- esx_skin

------------------------------------------------------------------------

# 📥 Installation

## 1. Download

Extract the `cb-backpacks` resource.

## 2. Place the Resource

Place it inside your server resources directory.

```text
resources/[cb-studios]/cb-backpacks
```

## 3. Install Inventory Items

Open the corresponding folder inside:

```text
INSTALL_FILES/
```

Use the item definition that matches your inventory.

### ox_inventory

Copy the provided items into:

```text
ox_inventory/data/items.lua
```

Each backpack uses:

```lua
client = {
    export = 'cb-backpacks.UseBackpack'
}
```

### qb-inventory / ps-inventory

Copy the provided item definitions into the appropriate shared items file.

Backpack items must use:

```lua
unique = true
useable = true
```

### qs-inventory

Use the provided item definitions from:

```text
INSTALL_FILES/qs-inventory/
```

### ESX Without ox_inventory

Import:

```text
INSTALL_FILES/sql/esx_items.sql
```

into your database.

------------------------------------------------------------------------

# 🖼️ Inventory Images

Copy the images from:

```text
INSTALL_FILES/images/
```

to the appropriate inventory image directory.

For example:

```text
ox_inventory/web/images
```

For qb-inventory, ps-inventory and qs-inventory, use the image directory provided by the respective inventory.

------------------------------------------------------------------------

# ⚙️ server.cfg

Start the resource after its required dependencies.

Example:

```cfg
ensure oxmysql
ensure ox_inventory

ensure cb-backpacks-clothing
ensure cb-backpacks
```

If `cb-backpacks-clothing` is not being used, it can be omitted.

Restart the resource:

```text
restart cb-backpacks
```

------------------------------------------------------------------------

# ⚙️ Configuration

Main configuration file:

```text
config.lua
```

### Main Configuration Options

| Option | Description |
|---|---|
| `Config.Debug` | Enables additional diagnostic output |
| `Config.Locale` | Selects the active language |
| `Config.Framework` | Framework override or automatic detection |
| `Config.Inventory` | Inventory override or automatic detection |
| `Config.ClothingScript` | Clothing system override |
| `Config.Keybind` | Backpack opening command and keybind |
| `Config.RestrictMultipleBackpacks` | Enables backpack carrying restrictions |
| `Config.MaxAllowedBackpacks` | Maximum allowed backpacks |
| `Config.UseCooldown` | Delay between backpack uses |
| `Config.Backpacks` | Backpack definitions |
| `Config.BackpackVisuals` | Physical backpack configuration |
| `Config.GlobalBlacklist` | Global item restrictions |
| `Config.GlobalWhitelist` | Global item restrictions |
| `Config.Locales` | Notification and interface translations |

------------------------------------------------------------------------

# 🎒 Backpack Configuration

Example:

```lua
{
    item = 'medic_bag',
    label = 'Maletín Médico',
    slots = 15,
    maxWeight = 150000,
    jobLock = {
        jobs = { 'ambulance', 'doctor' },
        grades = { 0, 1, 2, 3, 4 }
    },
}
```

`maxWeight` is specified in grams.

The physical weight of the backpack item itself is controlled by the inventory item definition.

------------------------------------------------------------------------

# 🎒 Physical Backpack System

Physical backpack visuals are configured through:

```lua
Config.BackpackVisuals
```

Backpacks use **component 5**, the hand/bag component.

The optional `cb-backpacks-clothing` resource provides the custom camper backpack model.

Example:

```lua
Config.BackpackVisuals = {
    backpack_camper = {
        resource = 'cb-backpacks-clothing',
        component = 5,
        drawableNameHash = 'CLO_CB_BACKPACKS_CLOTHING_HAND_0_0',
        putOnAnimation = {
            dict = 'clothingtie',
            clip = 'try_tie_positive_a',
            duration = 1500
        },
        openAnimation = {
            dict = 'missheistdockssetup1ig_2',
            clip = 'search_body_loop_guard',
            duration = 1800
        },
    },
}
```

Backpacks without an entry in `Config.BackpackVisuals` can still function as inventory bags without a physical model.

------------------------------------------------------------------------

# 💾 Persistence

Every backpack receives a permanent unique ID in its item metadata.

The ID is used to identify the backpack's stash.

This allows backpack contents to remain associated with the same physical backpack across:

- Player relogs
- Server restarts
- Backpack transfers
- Inventory movements

For `ox_inventory`, the ID is assigned to the item and the corresponding stash is handled through the inventory system.

If a backpack cannot retain its required ID, it will not be opened. This prevents contents from becoming associated with an unidentified stash.

------------------------------------------------------------------------

# 🔒 Restrictions

CB Backpacks supports multiple restriction systems.

### Job Restrictions

Individual backpacks can be restricted to specific jobs and grades.

### Whitelist

Allow specific items to be stored.

### Blacklist

Prevent specific items from being stored.

### Global Restrictions

Global whitelist and blacklist settings can apply restrictions across all backpack types.

### Nested Backpacks

Backpacks cannot be placed inside other backpacks.

------------------------------------------------------------------------

# 🎮 Usage

Backpacks are used directly through the inventory item.

The first available backpack can also be opened through the configured keybind.

The exact command and key are controlled through:

```lua
Config.Keybind
```

------------------------------------------------------------------------

# 🔌 Developer API

CB Backpacks provides server exports for external integrations.

## Server Exports

```lua
exports['cb-backpacks']:IsBackpackOpen(backpackId)
```

Returns whether a backpack is currently open.

```lua
exports['cb-backpacks']:IsBackpackItem(itemName)
```

Returns whether an item is registered as a backpack.

```lua
exports['cb-backpacks']:GetBackpackConfig(itemName)
```

Returns the configured backpack entry or `nil`.

```lua
exports['cb-backpacks']:GetBackpackId(source, slot)
```

Returns the permanent backpack ID for the specified inventory slot.

```lua
exports['cb-backpacks']:OpenBackpack(source, slot)
```

Opens the backpack using the same validation checks as normal backpack usage.

------------------------------------------------------------------------

# 📡 Server Events

### Backpack Opened

```text
cb-backpacks:server:opened
```

Parameters:

```text
source, backpackId, itemName
```

Triggered when a backpack is successfully opened.

### Backpack Denied

```text
cb-backpacks:server:denied
```

Parameters:

```text
source, reasonKey
```

Triggered when a backpack action is denied.

------------------------------------------------------------------------

# 🖥️ Client Exports

Available client exports:

```text
GetCurrentBackpacks
UpdateBackpackList
```

These can be used by external resources that need to interact with the player's currently tracked backpacks.

------------------------------------------------------------------------

# 📁 Resource Structure

```text
cb-backpacks/
├─ fxmanifest.lua
├─ README.md
├─ config.lua
├─ bridge/
│  ├─ client.lua
│  ├─ server.lua
│  └─ inventories/
│     ├─ ox_inventory.lua
│     ├─ qb-inventory.lua
│     ├─ ps-inventory.lua
│     └─ qs-inventory.lua
├─ client/
│  ├─ main.lua
│  └─ inventory_compat.lua
├─ server/
│  ├─ main.lua
│  └─ version.lua
├─ shared/
│  └─ utils.lua
└─ INSTALL_FILES/
   ├─ LEEME.txt
   ├─ ox_inventory/items.lua
   ├─ qb-inventory/items.lua
   ├─ ps-inventory/items.lua
   ├─ qs-inventory/items.lua
   ├─ sql/
   └─ images/
```

------------------------------------------------------------------------

# 🔐 Asset Escrow

The core functionality of CB Backpacks is protected through Asset Escrow.

The following files remain available for configuration and integration:

```text
config.lua
bridge/client.lua
bridge/server.lua
bridge/inventories/*.lua
INSTALL_FILES/
```

The core implementation remains protected.

Developer integrations should use the documented exports and events rather than modifying the protected core.

------------------------------------------------------------------------

# 🔄 Updating

Before updating:

1. Stop `cb-backpacks`.
2. Back up `config.lua`.
3. Back up any custom item definitions.
4. Replace the resource files.
5. Review configuration changes.
6. Restart the resource.

If item names were changed between versions, use the migration SQL supplied with the resource when applicable.

------------------------------------------------------------------------

# 🧪 Troubleshooting

## Resource Does Not Start

- Verify `ensure cb-backpacks` is present.
- Verify `config.lua` has no syntax errors.
- Check the server console for resource errors.
- Verify `oxmysql` is running.

## Backpack Does Not Open

- Enable `Config.Debug`.
- Verify the item exists in the inventory.
- Verify the item is included in `Config.Backpacks`.
- For ox_inventory, verify the item uses `cb-backpacks.UseBackpack`.
- For qb/ps/qs inventory, verify the item is configured as unique and usable.

## Backpack Contents Are Missing

- Verify the backpack item retains its unique ID.
- Do not manually duplicate unique backpack items.
- Verify the inventory metadata is being preserved.
- Do not rename backpack items without applying the appropriate migration.

## Backpack Is Not Visible

- Verify `cb-backpacks-clothing` is running.
- Verify the backpack visual configuration.
- Verify the configured drawable hash.
- Use a freemode ped.

## Job Restriction Does Not Work

- Verify the configured job name.
- Verify the configured grades.
- Job names must match the framework's job identifiers.

------------------------------------------------------------------------

# 📝 Technical Notes

Do not rename internal resource files unless you understand the integration requirements.

Changing the resource name may require updating:

- Inventory item exports
- `server.cfg`
- Resource references
- Integration configuration

Always create a backup before modifying the resource.

------------------------------------------------------------------------

# 📬 Support

When requesting support, provide:

| Information | Example |
|---|---|
| Resource | `cb-backpacks v1.0.0` |
| Framework | QBox / QBCore / ESX |
| Inventory | ox_inventory / qb-inventory / ps-inventory / qs-inventory |
| Server Build | Your FiveM build |
| Issue | Description of the problem |
| Logs | Relevant console/F8 output |

------------------------------------------------------------------------

<div style="text-align: center;">
  <strong>CB Studios</strong><br />
  FiveM Development Resources
</div>
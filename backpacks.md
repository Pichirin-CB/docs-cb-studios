# CB Studios — CB Backpacks Documentation

<div align="center">

<img src="https://img.shields.io/badge/CB%20Studios-FiveM%20Development-blue?style=for-the-badge" alt="CB Studios" />
<img src="https://img.shields.io/badge/version-1.0.0-green?style=for-the-badge" alt="Version" />
<img src="https://img.shields.io/badge/status-stable-brightgreen?style=for-the-badge" alt="Status" />
<img src="https://img.shields.io/badge/QBox%20%7C%20QBCore%20%7C%20ESX-orange?style=for-the-badge" alt="Framework" />

</div>

---------------------------------------------------------------------------

# 🖼️ Showcase

<div align="center">

<img
  src="https://i.gyazo.com/8b6cda1b771facb903a821095eff846a.jpg"
  alt="CB Backpacks Showcase"
  width="640"
/>

</div>

---------------------------------------------------------------------------

# 📖 Overview

| Field | Value |
|---|---|
| Resource | `cb-backpacks` |
| Author | **CB Studios / Pichirin_CB** |
| Version | `1.0.0` |
| Framework | QBox / QBCore / ESX |
| Inventory | ox_inventory |
| Status | Stable |

### Description

**CB Backpacks** is a persistent backpack system for FiveM servers.

Each backpack receives its own unique ID and persistent inventory. The backpack's contents remain associated with that specific backpack rather than the inventory slot where it is stored.

This means that moving a backpack between slots does not reset its contents. The same backpack can also be transferred between players while keeping its inventory.

The system also keeps track of the equipped backpack and can restore its state after reconnecting or restarting the server.

---------------------------------------------------------------------------

# ✨ Features

- Persistent unique backpack IDs
- Individual inventory for every backpack
- Persistent contents across reconnects
- Persistent contents across server restarts
- Backpack contents follow the item, not the inventory slot
- Moving a backpack between slots does not reset its inventory
- Equipped backpack state persistence
- Automatic detection when the equipped backpack is no longer owned
- Physical backpack appearance support
- Custom backpack clothing
- Backpack animations
- Configurable backpack slots and weight
- QBox support
- QBCore support
- ESX support
- Modular framework and inventory architecture
- Localization support
- Developer exports and events
- Server-side persistence

---------------------------------------------------------------------------

# 🎒 Included Backpacks

The available backpacks are configured through `config.lua`.

| Item | Label | Slots | Maximum Weight |
|---|---|---:|---:|
| `backpack1` | Mochila Común | 12 | 15,000 g |
| `backpack2` | Mochila de Supervivencia | 18 | 22,000 g |
| `backpack3` | Mochila Táctica | 24 | 30,000 g |
| `backpack4` | Mochila Militar | 30 | 38,000 g |
| `backpack5` | Mochila de Explorador | 36 | 45,000 g |
| `duffle1` | Mochila de Supervivencia | 18 | 25,000 g |
| `bigcamperbag` | Mochila Camper Grande | 36 | 45,000 g |
| `techbackpack` | Mochila Tecnológica | 12 | 15,000 g |

These entries can be modified or extended through `Config.Backpacks`.

---------------------------------------------------------------------------

# 📦 Requirements

| Requirement | Details |
|---|---|
| FiveM Server | Required |
| ox_lib | Required |
| oxmysql | Required |
| ox_inventory | Required |
| illenium-appearance | Required |
| rpemotes-reborn | Optional |

The resource is currently designed around **ox_inventory**.

---------------------------------------------------------------------------

# 📥 Installation

## 1. Download

Download or clone the `cb-backpacks` resource.

## 2. Place the Resource

Place the resource inside your server resources directory.

```text
resources/[cb-studios]/cb-backpacks
```

## 3. Install Inventory Items

Open:

```text
INSTALL_FILES/
```

For `ox_inventory`, copy the backpack item definitions into:

```text
ox_inventory/data/items.lua
```

Each backpack item must use the CB Backpacks client export:

```lua
client = {
    export = 'cb-backpacks.useBackpack'
}
```

The backpack item should not be registered as a native `ox_inventory` container.

## 4. Install Inventory Images

Copy the backpack images from:

```text
INSTALL_FILES/inventory_icon/
```

to:

```text
ox_inventory/web/images/
```

Make sure the image filename matches the item name.

For example:

```text
backpack1.png
backpack2.png
backpack3.png
```

## 5. Start Dependencies

Make sure the required resources start before `cb-backpacks`:

```cfg
ensure ox_lib
ensure oxmysql
ensure ox_inventory
ensure illenium-appearance
ensure rpemotes-reborn
ensure cb-backpacks
```

`rpemotes-reborn` is optional if backpack animations are disabled.

## 6. Restart the Resource

After installing or changing the item definitions:

```text
restart ox_inventory
restart cb-backpacks
```

---------------------------------------------------------------------------

# ⚙️ Configuration

The main configuration file is:

```text
config.lua
```

### Backpack Configuration

Each backpack can define its own:

- Label
- Inventory slots
- Maximum weight
- Clothing component
- Drawable
- Texture

Example:

```lua
['backpack1'] = {
    label = 'Mochila Común',
    slots = 12,
    maxWeight = 15000,
    drawable = 118,
    texture = 0,
    component = 5,
},
```

### Configuration Options

| Option | Description |
|---|---|
| `Config.Debug` | Enables additional diagnostic output |
| `Config.Backpacks` | Defines available backpacks |
| `Config.Metadata` | Defines the backpack metadata ID |
| `Config.Stash` | Controls persistent backpack stash settings |
| `Config.Database` | SQL configuration |
| `Config.Animation` | Backpack animation settings |
| `Config.Restore` | Automatic equipped-state restoration |
| `Config.Command` | Backpack command configuration |

---------------------------------------------------------------------------

# 🎒 Physical Backpack System

CB Backpacks can apply a physical backpack appearance to the player when a backpack is equipped.

Backpacks use **component 5**, which is the bag/accessory component.

Example:

```lua
['backpack1'] = {
    label = 'Mochila Común',
    slots = 12,
    maxWeight = 15000,
    drawable = 118,
    texture = 0,
    component = 5,
},
```

The configured drawable and texture are applied to the player's character when the backpack is equipped.

The system is designed for freemode male and female characters.

---------------------------------------------------------------------------

# 💾 Persistence

Every backpack receives a unique persistent ID.

The ID is stored in the backpack item's metadata:

```text
cb_backpack_id
```

This ID is used to identify the backpack's persistent inventory.

Because the inventory is tied to the backpack ID rather than the inventory slot, the contents remain associated with the same backpack when:

- The backpack is moved to another slot
- The player reconnects
- The server restarts
- The backpack is transferred to another player

The backpack therefore behaves as an individual persistent item rather than simply being another inventory container.

---------------------------------------------------------------------------

# 👤 Equipped Backpack

When a backpack is equipped, the resource stores its equipped state in SQL.

When the player reconnects, CB Backpacks checks whether the same backpack still exists in the player's inventory.

If it does, the backpack can be restored automatically.

If the backpack no longer exists, the equipped state is removed and the backpack appearance is cleared.

---------------------------------------------------------------------------

# 🔒 Backpack Identity

The backpack ID is what makes the system different from a normal inventory container.

For example:

```text
backpack1
└── cb_backpack_id: ABC123
```

If the player moves that backpack from slot `5` to slot `20`, the ID does not change.

The inventory remains:

```text
cb_backpack_ABC123
```

This prevents backpack contents from being lost or associated with the wrong inventory slot.

---------------------------------------------------------------------------

# 🎮 Usage

Backpacks are used directly through the inventory item.

Using a backpack will:

1. Prepare the backpack's persistent inventory.
2. Equip the backpack appearance.
3. Save the equipped backpack state.
4. Open the backpack inventory.

Using the equipped backpack again opens its inventory rather than removing it.

The backpack remains equipped until the exact backpack item is no longer present in the player's inventory.

---------------------------------------------------------------------------

# 🔄 Inventory Changes

CB Backpacks tracks the exact backpack ID instead of relying on a specific inventory slot.

This means the following does **not** unequip the backpack:

- Moving it to another slot
- Sorting the inventory
- Reorganizing inventory items

However, if the exact backpack item disappears, the resource detects the change and removes the equipped backpack state.

---------------------------------------------------------------------------

# 🔌 Developer API

CB Backpacks provides client exports for external resources.

### Get Equipped Backpack

```lua
exports['cb-backpacks']:getEquippedBackpack()
```

Returns the currently equipped backpack data.

### Check Equipped State

```lua
exports['cb-backpacks']:isEquipped()
```

Returns:

```text
true
```

when a backpack is currently equipped.

---------------------------------------------------------------------------

# 📁 Resource Structure

```text
cb-backpacks/
├── fxmanifest.lua
├── README.md
├── config.lua
├── client/
│   └── main.lua
├── server/
│   └── main.lua
└── INSTALL_FILES/
    ├── ox_items.lua
    └── inventory_icon/
        ├── backpack1.png
        ├── backpack2.png
        ├── backpack3.png
        ├── backpack4.png
        ├── backpack5.png
        ├── duffle1.png
        ├── bigcamperbag.png
        └── techbackpack.png
```

---------------------------------------------------------------------------

# 🔐 Important ox_inventory Note

CB Backpacks does **not** use the native `ox_inventory` container metadata system for backpack items.

Backpacks must use:

```lua
client = {
    export = 'cb-backpacks.useBackpack'
}
```

Do not register the backpack items with:

```lua
exports.ox_inventory:setContainerProperties(...)
```

or assign a native:

```text
metadata.container
```

to the backpack item.

If an old backpack item already contains `metadata.container`, `ox_inventory` may open the native container directly without calling CB Backpacks.

In that case, remove and re-create the affected backpack item before testing the resource.

---------------------------------------------------------------------------

# 🧪 Troubleshooting

## Resource Does Not Start

Check that:

- `ox_lib` is running
- `oxmysql` is running
- `ox_inventory` is running
- `cb-backpacks` starts after its dependencies
- `config.lua` contains all required configuration sections

## Backpack Does Not Open

Check that:

- The item exists in `ox_inventory/data/items.lua`
- The item exists in `Config.Backpacks`
- The item uses the correct client export
- `ox_inventory` was restarted after changing the item definition
- The item does not contain old `metadata.container` data

Correct export:

```lua
client = {
    export = 'cb-backpacks.useBackpack'
}
```

## Backpack Contents Are Missing

Check that:

- The backpack still has its `cb_backpack_id`
- The item metadata was not removed
- The backpack was not replaced with a different item
- The SQL table is available
- `oxmysql` is running correctly

## Backpack Is Not Visible

Check that:

- The configured component is correct
- The drawable exists for the player's character model
- The texture is correct
- The player is using a supported freemode model

---------------------------------------------------------------------------

# 📝 Technical Notes

CB Backpacks identifies individual backpacks using a persistent metadata ID.

Do not manually remove or change:

```text
cb_backpack_id
```

unless you understand how the backpack persistence system works.

Changing the backpack item name or metadata can cause the item to be treated as a different backpack.

Always back up your database before making major changes to the resource.

---------------------------------------------------------------------------

# 📬 Support

When reporting an issue, provide:

| Information | Example |
|---|---|
| Resource | `cb-backpacks v1.0.0` |
| Framework | QBox / QBCore / ESX |
| Inventory | ox_inventory |
| Server Build | Your FiveM build |
| Issue | Description of the problem |
| Logs | Relevant server/F8 output |

---------------------------------------------------------------------------

<div align="center">

<strong>CB Studios</strong>

FiveM Development Resources

</div>
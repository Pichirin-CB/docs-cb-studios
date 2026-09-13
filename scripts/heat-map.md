# CB Studios — Heat Map Documentation

<div style="text-align: center;">

  <img src="https://img.shields.io/badge/CB%20Studios-FiveM%20Development-blue?style=for-the-badge" alt="CB Studios" />
  <img src="https://img.shields.io/badge/version-1.2.1-green?style=for-the-badge" alt="Version" />
  <img src="https://img.shields.io/badge/status-stable-brightgreen?style=for-the-badge" alt="Status" />
  <img src="https://img.shields.io/badge/framework-ESX%20%7C%20QBCore%20%7C%20Standalone-orange?style=for-the-badge" alt="Framework" />

</div>

------------------------------------------------------------------------

# 📖 Overview

| Field     | Value                     |
| --------- | ------------------------- |
| Resource  | `cb_heatmap`              |
| Author    | **CB Studios**            |
| Framework | ESX / QBCore / Standalone |
| Version   | `1.2.1`                   |
| Status    | Stable                    |
| Type      | FiveM Server Resource     |

### Description

> **CB Heatmap** is a privacy-first organic player activity heatmap for FiveM servers, designed to visualize server activity zones without exposing exact player locations.

The resource collects server-side player activity through **OneSync**, processes the activity anonymously, and renders it over a static GTA V map.

Nearby activity naturally merges into smooth heat clouds, while distant activity remains visually separated.

The generated heatmap can be automatically published to Discord through a webhook. CB Heatmap maintains a **single persistent Discord message**, replacing the existing heatmap image on each update instead of creating a new message every time.

CB Heatmap is distributed as **commercial open-source software**, allowing authorized purchasers to inspect and modify the source code for their own server.

------------------------------------------------------------------------

# ✨ Features

* Privacy-first activity visualization
* Organic Gaussian heat clouds
* No player icons
* No exact player locations displayed
* Server-side OneSync position sampling
* Anonymous coordinate quantization
* Positional jitter
* Configurable heat intensity
* Configurable transparency
* Configurable blur
* Customizable heatmap gradient
* Configurable sampling interval
* Configurable retention period
* Configurable Discord update interval
* Persistent Discord heatmap message
* Automatic Discord image replacement
* Compact Discord presentation
* Configurable Discord server name
* English, Spanish, Turkish, French and Portuguese locales
* `pt` accepted as an alias for `pr`
* QBCore support
* ESX support
* Standalone support
* No external npm packages
* No external rendering service
* Fully configurable
* Open-source source code
* Designed for production FiveM servers

------------------------------------------------------------------------

# 📦 Requirements

| Requirement           | Details                                 |
| --------------------- | --------------------------------------- |
| FiveM Server          | Required                                |
| OneSync               | Required                                |
| Server Runtime        | FiveM JavaScript / Node runtime         |
| Framework             | ESX / QBCore / Standalone               |
| Discord               | Discord webhook required for publishing |
| External Dependencies | None                                    |

### Framework Compatibility

| Framework  | Support |
| ---------- | ------- |
| QBCore     | Yes     |
| ESX        | Yes     |
| Standalone | Yes     |

Framework detection can be configured automatically:

```js
Framework: 'auto'
```

Available values:

```text
auto
qbcore
esx
standalone
```

The heatmap does not depend on QBCore or ESX player APIs. Player activity is collected server-side through OneSync.

------------------------------------------------------------------------

# 📥 Installation

### 1️⃣ Download

Download the CB Heatmap resource and extract it.

The resource folder must be named:

```text
cb_heatmap
```

### 2️⃣ Place in resources folder

Place the resource inside your FiveM resources directory.

Example:

```text
resources/[your_folder]/cb_heatmap
```

### 3️⃣ Configure the resource

Open:

```text
config.js
```

Configure the customer-facing settings according to your server.

### 4️⃣ Configure Discord Webhook

Add your Discord webhook to `server.cfg`:

```cfg
set cb_heatmap_webhook "YOUR_DISCORD_WEBHOOK_URL"
```

**Never place your production webhook directly inside `config.js`.**

Keep the webhook private.

### 5️⃣ Add to server.cfg

Add:

```cfg
## CB Studios
ensure cb_heatmap
```

### 6️⃣ Restart the resource

After installation or configuration changes:

```text
restart cb_heatmap
```

### 7️⃣ Verify

Check the FiveM server console and confirm that the resource starts without errors.

------------------------------------------------------------------------

# ⚙️ Configuration

The main customer-facing configuration is located in:

```text
config.js
```

## Core Configuration

```js
Debug: false,

Framework: 'auto'
```

### Core Options

| Option      | Description              |
| ----------- | ------------------------ |
| `Debug`     | Enables debug output     |
| `Framework` | Framework detection mode |

Supported framework values:

```text
auto
qbcore
esx
standalone
```

------------------------------------------------------------------------

## 📡 Sampling

```js
Sampling: {
    SampleIntervalSeconds: 10,
    UpdateIntervalSeconds: 30,
    RetentionSeconds: 300,
    AgeDecay: 0.72
}
```

| Option                  | Description                                |
| ----------------------- | ------------------------------------------ |
| `SampleIntervalSeconds` | How frequently player activity is sampled  |
| `UpdateIntervalSeconds` | How frequently the heatmap is regenerated  |
| `RetentionSeconds`      | How long anonymous activity remains active |
| `AgeDecay`              | Reduces the influence of older activity    |

The default Discord heatmap refresh interval is **30 seconds**.

------------------------------------------------------------------------

# 🔐 Privacy

CB Heatmap is designed around anonymous activity visualization.

```js
Privacy: {
    QuantizeMeters: 175,
    JitterMeters: 125,
    IgnoreRoutingBuckets: [],
    IgnoreZeroCoords: true
}
```

When a player position is collected, the position is immediately processed using coordinate quantization and positional jitter.

Only the resulting anonymous heatmap sample is retained.

CB Heatmap does not intentionally associate retained heatmap samples with:

* Player names
* Discord IDs
* Licenses
* Citizen IDs
* Exact player coordinates

### Routing Buckets

Specific routing buckets can be excluded from collection using:

```js
IgnoreRoutingBuckets: []
```

This allows server owners to prevent activity from selected routing buckets from contributing to the heatmap.

------------------------------------------------------------------------

# 🎨 Heatmap Rendering

```js
Heatmap: {
    DensityWidth: 512,
    DensityHeight: 512,
    BlurRadiusMeters: 420,
    MinAlpha: 0.035,
    MaxAlpha: 0.72,
    IntensityScale: 2.2,
    Gradient: [
        [0.00, 255, 235, 59],
        [0.35, 255, 193, 7],
        [0.62, 255, 111, 0],
        [0.82, 244, 67, 54],
        [1.00, 183, 28, 28]
    ]
}
```

Nearby player activity naturally merges into larger and more intense heat clouds.

Distant activity remains separated, keeping inactive areas of the map visually clean.

### Gradient Format

Gradient entries use:

```text
[position, red, green, blue]
```

This allows server owners to customize the visual appearance of the heatmap.

------------------------------------------------------------------------

# 🗺️ Map Configuration

```js
Map: {
    File: 'assets/map.png',

    WorldBounds: {
        minX: -4940.0,
        maxX: 5965.0,
        minY: -4020.0,
        maxY: 7950.0
    },

    FlipY: true
}
```

### Map File

The default map is:

```text
assets/map.png
```

### Map Calibration

`Map.WorldBounds` must correspond to the exact base image being used.

If `assets/map.png` is replaced with another map image featuring different framing, margins or projection, the world bounds must be recalibrated.

`FlipY` handles the difference between the GTA/FiveM world Y direction and the image-space Y direction.

Incorrect calibration can cause heat activity to appear in the wrong location.

------------------------------------------------------------------------

# 💬 Discord Integration

CB Heatmap can automatically publish the generated heatmap to Discord.

Configuration:

```js
Discord: {
    Enabled: true,
    Language: 'en',
    ServerName: '',
    Filename: 'heatmap.png',
    MessageIdKvp: 'cb_heatmap:discord_message_id'
}
```

The webhook itself should remain in `server.cfg`:

```cfg
set cb_heatmap_webhook "YOUR_DISCORD_WEBHOOK_URL"
```

### Supported Languages

```text
en
es
tr
fr
pr
```

`pt` is also accepted as an alias for `pr`.

------------------------------------------------------------------------

# 📌 Persistent Discord Message

CB Heatmap is designed to prevent Discord message spam.

During the first successful publish, the resource creates a Discord message and stores its message ID using a resource KVP.

Future updates edit the same message and replace its attached heatmap image.

This means the heatmap channel can continuously update without creating a new Discord message every update.

------------------------------------------------------------------------

# 📝 Discord Presentation

Customer-facing Discord presentation is configured through:

```js
Discord.Embed
```

### Server Name

Set:

```js
Discord.ServerName
```

to your community name.

If it is empty, CB Heatmap uses the FiveM:

```text
sv_hostname
```

### Localized Text

Public Discord text is stored under:

```js
Discord.Embed.Locales
```

This allows server owners to modify existing text or add another locale without modifying:

```text
server/discord.js
```

### Default Presentation

The compact Discord presentation contains:

* Server name
* Heatmap title
* Recent activity information
* Heatmap image

### Supported Tokens

| Token          | Value                                   |
| -------------- | --------------------------------------- |
| `{serverName}` | Configured server name or `sv_hostname` |
| `{timestamp}`  | Current Discord timestamp               |

------------------------------------------------------------------------

# 🎮 Usage

## Commands

| Command           | Description                          | Permission |
| ----------------- | ------------------------------------ | ---------- |
| `cbheatmap_force` | Forces an immediate heatmap update   | Server/ACE |
| `cbheatmap_reset` | Clears the stored Discord message ID | Server/ACE |

### `cbheatmap_force`

Forces CB Heatmap to immediately render a new heatmap and publish the result to Discord.

This is useful for testing configuration or manually triggering an update.

### `cbheatmap_reset`

Clears the stored persistent Discord message ID.

The next successful render will create a new Discord message.

**Do not use this command during normal operation unless you intentionally want to create a new persistent Discord message.**

------------------------------------------------------------------------

# 🔑 Permissions

CB Heatmap supports an optional ACE permission:

```cfg
add_ace group.admin cb_heatmap.admin allow
```

This permission can be used for administrative access to the resource commands.

------------------------------------------------------------------------

# 🔌 Developer Integration

CB Heatmap is designed as a self-contained FiveM resource.

It does not require external npm packages or external rendering services.

### Resource Entry Point

The resource entry point is:

```text
index.js
```

Internal modules are loaded through the resource entry point.

### Internal Structure

```text
cb_heatmap/

├── assets/
│   └── map.png
│
├── server/
│   ├── discord.js
│   ├── main.js
│   ├── png.js
│   └── renderer.js
│
├── config.js
├── index.js
├── fxmanifest.lua
├── README.md
└── LICENSE
```

### Important Files

| File                 | Purpose                                       |
| -------------------- | --------------------------------------------- |
| `config.js`          | Main customer configuration                   |
| `assets/map.png`     | Static base map                               |
| `server/main.js`     | Sampling and update workflow                  |
| `server/renderer.js` | Heat-density processing and image composition |
| `server/png.js`      | Internal PNG processing                       |
| `server/discord.js`  | Discord webhook and embed handling            |
| `index.js`           | Resource entry point                          |
| `fxmanifest.lua`     | FiveM resource manifest                       |

Internal files should not be renamed or moved unless their references are also updated.

------------------------------------------------------------------------

# 🧪 Debugging & Common Issues

## Resource does not start

Verify:

* OneSync is enabled.
* The resource folder is named `cb_heatmap`.
* `fxmanifest.lua` exists.
* JavaScript files have not been moved or renamed.
* Check the FiveM server console for the first `cb_heatmap` error.

------------------------------------------------------------------------

## Discord heatmap is not published

Check:

* `Discord.Enabled` is set to `true`.
* `cb_heatmap_webhook` exists in `server.cfg`.
* The webhook has not been deleted or regenerated.
* The Discord channel still exists.
* Check the FiveM console for Discord HTTP errors.

**Never post your live webhook URL when requesting support.**

------------------------------------------------------------------------

## Heatmap appears in the wrong location

Verify:

```js
Map.WorldBounds
```

If you replaced:

```text
assets/map.png
```

with another map image, the world bounds may require recalibration.

Different map framing, margins or projection can affect heatmap positioning.

------------------------------------------------------------------------

## Heatmap is too broad

Review:

```text
BlurRadiusMeters
IntensityScale
RetentionSeconds
```

Increasing retention or blur can cause activity to remain visible across larger areas.

------------------------------------------------------------------------

## Heatmap updates too slowly

Review:

```text
SampleIntervalSeconds
UpdateIntervalSeconds
```

Avoid unnecessarily aggressive intervals on production servers.

------------------------------------------------------------------------

## Discord creates a new message

Make sure you are not running:

```text
cbheatmap_reset
```

unless you intentionally want to create a new persistent message.

Also preserve:

```js
MessageIdKvp: 'cb_heatmap:discord_message_id'
```

during normal operation and updates.

------------------------------------------------------------------------

# 🔄 Updating the Resource

When updating CB Heatmap:

1. Back up your current `config.js`.
2. Back up any customized `assets/map.png`.
3. Stop the resource.
4. Replace the resource files.
5. Review the release notes.
6. Reapply configuration changes where required.
7. Preserve the existing `MessageIdKvp` value if you want to keep the current Discord message.
8. Restart the resource.

```text
restart cb_heatmap
```

### Important

Do **not** run:

```text
cbheatmap_reset
```

during a normal update unless you intentionally want CB Heatmap to create a new Discord message.

------------------------------------------------------------------------

# 🔒 Security & Privacy

Never commit or distribute:

* Live Discord webhook URLs
* Server credentials
* Production logs containing sensitive information
* Player personal data

The Discord webhook should remain in:

```text
server.cfg
```

and not inside:

```text
config.js
```

Security-sensitive issues should be reported privately through CB Studios support rather than publicly exposing working exploit details.

------------------------------------------------------------------------

# 📜 License

CB Heatmap is distributed as **commercial open-source software** with source-code access.

One purchase authorizes use on **one production FiveM server controlled by the purchaser**.

Local development or staging for that authorized server is permitted.

Purchasers may:

* ✔ Inspect the source code
* ✔ Modify the resource
* ✔ Adapt the resource for their authorized server
* ✔ Maintain their own modifications

Purchasers may **not**:

* ✘ Redistribute the resource
* ✘ Resell the resource
* ✘ Sublicense the resource
* ✘ Publicly publish the source code
* ✘ Leak the resource
* ✘ Transfer the resource to another person
* ✘ Transfer the resource to another server
* ✘ Distribute modified copies without authorization
* ✘ Claim ownership of the original CB Studios intellectual property

Purchasing CB Heatmap grants the right to use and modify the resource according to the included license. It does **not** transfer ownership of the original intellectual property.

See the included `LICENSE` file for the complete binding terms.

For multi-server usage or transfer permissions, contact CB Studios.

------------------------------------------------------------------------

# 📬 Support

When requesting support, provide the following information:

| Information    | Example                        |
| -------------- | ------------------------------ |
| Script         | `cb_heatmap v1.2.1`            |
| FiveM Artifact | Your server artifact version   |
| OneSync        | Current OneSync mode           |
| Framework      | ESX / QBCore / Standalone      |
| Issue          | Description of the problem     |
| Logs           | Relevant server console output |
| Reproduction   | Steps to reproduce the issue   |

### Security Notice

**Never include your live Discord webhook URL or webhook token in a support request.**

------------------------------------------------------------------------

<div style="text-align: center;">

<strong>CB Studios</strong><br />

FiveM & RedM Development Resources

</div>

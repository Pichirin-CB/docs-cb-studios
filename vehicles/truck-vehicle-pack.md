# CB Studios - Truck Vehicle Pack Documentation

<div style="text-align: center;">
  <img src="https://img.shields.io/badge/CB%20Studios-FiveM%20Development-blue?style=for-the-badge" alt="CB Studios" />
  <img src="https://img.shields.io/badge/version-1.0.0-green?style=for-the-badge" alt="Version" />
  <img src="https://img.shields.io/badge/status-stable-brightgreen?style=for-the-badge" alt="Status" />
  <img src="https://img.shields.io/badge/framework-ESX%20%7C%20QBCore%20%7C%20QBox%20%7C%20Standalone-orange?style=for-the-badge" alt="Framework" />
</div>

------------------------------------------------------------------------

# Showcase

<div align="center" style="margin-bottom: 1.5rem;">
  <iframe
    width="640"
    height="360"
    src="https://www.youtube.com/embed/VIDEO_ID_HERE"
    title="cb_pack-truck showcase"
    frameborder="0"
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
    allowfullscreen
    style="max-width: 100%; border-radius: 12px;"
  ></iframe>
</div>

------------------------------------------------------------------------

# Overview

| Field | Value |
| --- | --- |
| Pack Name | `cb_pack-truck` |
| Author | **Pichirin_CB / CB Studios** |
| Type | FiveM Vehicle Pack |
| Version | `1.0.0` |
| Status | Stable |

### Description

A professional truck-focused **vehicle pack for FiveM servers** developed by **CB Studios**.

This package includes optimized truck and wrecker vehicles with custom handling/meta data and engine audio support (`tacumminsb`) to improve immersion for logistics, towing, and industrial roleplay.

------------------------------------------------------------------------

# Included Vehicles

| Vehicle Model | Type |
| --- | --- |
| `bcls` | Truck |
| `farmtrok` | Truck |
| `fdwrecker` | Wrecker |
| `hvywrecker` | Heavy Wrecker |
| `legacycab` | Truck |
| `migel379` | Truck |
| `petedaycab` | Truck |
| `peterbilt359` | Truck |
| `sou_pete` | Truck |
| `t680` | Truck |
| `t680a` | Truck Variant |
| `ultracustom` | Truck |
| `vnl780` | Truck |
| `W900` | Truck |
| `zaccpete` | Truck |

------------------------------------------------------------------------

# Features

- High quality truck models and textures
- Optimized for FiveM streaming
- Clean resource structure with separated `data/`, `stream/`, and audio assets
- Includes handling, vehicle metadata, variations, and colors
- Includes custom audio config and wavepack
- Compatible with most frameworks and vehicle systems

------------------------------------------------------------------------

# Requirements

| Requirement | Details |
| --- | --- |
| FiveM Server | Latest recommended build |
| Game Build | 2944 or newer recommended |
| Dependencies | None |

------------------------------------------------------------------------

# Resource Structure

```text
cb_pack-truck/
├─ fxmanifest.lua
├─ README.md
├─ audioconfig/
│  ├─ tacumminsb_game.dat151.rel
│  └─ tacumminsb_sounds.dat54.rel
├─ sfx/
│  └─ dlc_tacumminsb/*.awc
├─ data/
│  └─ [vehicle folders]/
│     ├─ vehicles.meta
│     ├─ handling.meta
│     ├─ carcols.meta
│     └─ carvariations.meta
└─ stream/
   ├─ *.yft
   └─ *.ytd
```

------------------------------------------------------------------------

# Installation

### 1 Download

Download the vehicle pack and extract it.

### 2 Place in resources

`resources/[your_folder]/cb_pack-truck`

### 3 Add to server.cfg

```cfg
ensure cb_pack-truck
```

### 4 Restart server

```cfg
restart cb_pack-truck
```

------------------------------------------------------------------------

# Configuration

No required configuration.

You can integrate this pack with:

- Dealership scripts
- Job garages
- Admin spawn menus
- Custom vehicle systems

------------------------------------------------------------------------

# Usage

Spawn vehicles using admin commands or vehicle menus.

Example:

```text
/car t680
/car hvywrecker
```

------------------------------------------------------------------------

# Compatibility

Works with:

- ESX
- QBCore
- QBox
- Standalone servers

Compatible with most dealership and garage systems.

------------------------------------------------------------------------

# Common Issues

### Vehicle does not spawn

- Verify resource name (`cb_pack-truck`)
- Ensure pack is started in `server.cfg`
- Check for conflicting vehicle names in other resources

### Missing textures

- Verify all files are included in `stream/`
- Clear FiveM cache

### Vehicle has no sound

- Verify audio files are present in `audioconfig/` and `sfx/`
- Ensure no conflicting sound resources
- Restart the resource after updates

------------------------------------------------------------------------

# Updating the Pack

1. Stop the resource
2. Backup the current version
3. Replace with the new version
4. Restart the resource
5. Test vehicles again

------------------------------------------------------------------------

# Support

When requesting support provide:

| Information | Example |
| --- | --- |
| Pack | `cb_pack-truck` |
| Version | `1.0.0` |
| Server Build | Latest |
| Vehicle | `t680` |
| Issue | Description |

------------------------------------------------------------------------

<div style="text-align: center;">
  <strong>CB Studios</strong><br />
  FiveM Development Resources
</div>

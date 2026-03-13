# CB Studios - Industrial Truck Workshop Documentation

<div style="text-align: center;">
  <img src="https://img.shields.io/badge/CB%20Studios-FiveM%20Mapping-blue?style=for-the-badge" alt="CB Studios" />
  <img src="https://img.shields.io/badge/version-1.0.0-green?style=for-the-badge" alt="Version" />
  <img src="https://img.shields.io/badge/status-stable-brightgreen?style=for-the-badge" alt="Status" />
  <img src="https://img.shields.io/badge/type-MLO%20%7C%20Mapping-orange?style=for-the-badge" alt="Type" />
</div>

------------------------------------------------------------------------

# Showcase

<div align="center" style="margin-bottom: 1.5rem;">
  <iframe
    width="640"
    height="360"
    src="https://www.youtube.com/embed/VIDEO_ID_HERE"
    title="cb_workshop-truck showcase"
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
| Resource | `cb_workshop-truck` |
| Author | **Pichirin_CB / CB Studios** |
| Type | MLO / Map |
| Version | `1.0.0` |
| Status | Stable |

### Description

A high quality truck workshop interior/mapping resource developed by **CB Studios** designed to enhance immersion and expand industrial roleplay areas in FiveM servers.

This resource provides optimized map assets with clean streaming and good performance.

------------------------------------------------------------------------

# Features

- Truck workshop themed custom interior assets
- Optimized for FiveM streaming
- Includes map entities (`.ymap`), collisions (`.ybn`), and props (`.ydr`/`.ytyp`)
- Clean resource structure
- Easy installation
- No framework required

------------------------------------------------------------------------

# Requirements

| Requirement | Details |
| --- | --- |
| FiveM Server | Latest recommended build |
| Game Build | Recommended server build |
| Dependencies | None |

------------------------------------------------------------------------

# Resource Structure

```text
cb_workshop-truck/
├─ fxmanifest.lua
├─ README.md
├─ LICENSE
└─ stream/
   ├─ *.ydr
   ├─ *.ybn
   ├─ *.ymap
   ├─ *.ytyp
   └─ _manifest.ymf
```

Note: Folder names may vary depending on your final packaged release.

------------------------------------------------------------------------

# Installation

### 1 Download

Download the MLO resource and extract it.

### 2 Place in resources folder

`resources/[your_folder]/cb_workshop-truck`

### 3 Add to server.cfg

```cfg
ensure cb_workshop-truck
```

### 4 Restart server

```cfg
restart cb_workshop-truck
```

### 5 Verify

Join the server and go to the mapped location to confirm it loads correctly.

------------------------------------------------------------------------

# Map Location

| Location | Coordinates |
| --- | --- |
| Truck Workshop Area | Check in-game placement for your map build |

Optional:

You may include a map image or screenshot here.

------------------------------------------------------------------------

# Compatibility

Works with:

- ESX
- QBCore
- QBox
- Standalone servers

Mapping resources normally do not depend on frameworks.

------------------------------------------------------------------------

# Common Issues

### Map not loading

- Verify resource name (`cb_workshop-truck`)
- Ensure the resource is started
- Check server console for errors

### Textures missing

- Clear FiveM cache
- Verify all files are present in `stream/`

### Interior collision issues

- Ensure no conflicting map replaces the same area

------------------------------------------------------------------------

# Updating the Map

1. Stop the resource
2. Backup the current version
3. Replace files with the updated version
4. Restart the resource
5. Verify the map loads correctly

------------------------------------------------------------------------

# Support

When requesting support provide:

| Information | Example |
| --- | --- |
| Resource | `cb_workshop-truck` |
| Version | `1.0.0` |
| Server Build | Latest |
| Issue | Description of the problem |

------------------------------------------------------------------------

<div style="text-align: center;">
  <strong>CB Studios</strong><br />
  FiveM Development Resources
</div>

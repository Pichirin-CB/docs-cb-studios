# CB Studios - SWAT Special Operations Vehicle Pack Documentation

<div style="text-align: center;">
  <img src="https://img.shields.io/badge/CB%20Studios-FiveM%20Development-blue?style=for-the-badge" alt="CB Studios" />
  <img src="https://img.shields.io/badge/version-1.0.0-green?style=for-the-badge" alt="Version" />
  <img src="https://img.shields.io/badge/status-stable-brightgreen?style=for-the-badge" alt="Status" />
  <img src="https://img.shields.io/badge/framework-ESX%20%7C%20QBCore%20%7C%20QBox%20%7C%20Standalone-orange?style=for-the-badge" alt="Framework" />
</div>

------------------------------------------------------------------------

<!-- # 📺 Showcase

<div align="center" style="margin-bottom: 1.5rem;">
  <iframe
    width="640"
    height="360"
    src="https://www.youtube.com/embed/3LCLa4nuZuI"
    title="cb_truck-swat showcase"
    frameborder="0"
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
    allowfullscreen
    style="max-width: 100%; border-radius: 12px;"
  ></iframe>
</div> -->

------------------------------------------------------------------------

# Overview

| Field | Value |
| --- | --- |
| Pack Name | `cb_truck-swat` |
| Author | **Pichirin_CB** |
| Studio | **CB Studios** |
| Type | FiveM Vehicle Pack (SWAT / Emergency) |
| Version | `1.0.0` |
| Status | Stable |

### Description

A professional **SWAT vehicle pack for FiveM**, optimized for roleplay servers and tactical operations.

It includes custom models ready for patrol use, high-risk response, and special deployment scenarios.

Ideal for:
- Roleplay servers
- Police / special forces servers
- Communities with tactical content

------------------------------------------------------------------------

# Included Vehicles

| Vehicle (Model) | Type |
| --- | --- |
| `cbsurb` | SWAT SUV / Emergency |
| `cbpius` | Patrol / Emergency |
| `cbpius2` | Patrol / Emergency |
| `cbmerc` | Tactical Unit / Emergency |
| `cbdem` | Interceptor / Emergency |
| `cbchar` | SWAT Sedan / Emergency |

------------------------------------------------------------------------

# Features

- High-quality vehicle models
- Optimized for FiveM
- Clean resource structure (`data/` + `stream/`)
- Compatible with custom liveries and vehicle extras
- Fast installation with no external dependencies
- Works with frameworks or standalone servers

------------------------------------------------------------------------

# Requirements

| Requirement | Details |
| --- | --- |
| FiveM Server | Latest recommended build |
| Game Build | 2944 or newer recommended |
| Dependencies | None |

------------------------------------------------------------------------

# Installation

### 1) Download

Download the resource and extract the folder.

### 2) Place in resources

```txt
resources/[your_folder]/cb_truck-swat
```

### 3) Add to server.cfg

```cfg
ensure cb_truck-swat
```

### 4) Restart server

```cfg
restart cb_truck-swat
```

------------------------------------------------------------------------

# Configuration

This pack does not require mandatory configuration.

It can be integrated with:
- Dealership scripts
- Job garages (Police/SWAT)
- Admin spawn menus
- Custom vehicle systems

------------------------------------------------------------------------

# Usage

Spawn vehicles using admin commands or vehicle menus.

Example:

```txt
/car cbsurb
```

------------------------------------------------------------------------

# Compatibility

Compatible with:
- ESX
- QBCore
- QBox
- Standalone servers

Also works with most dealership and garage systems.

------------------------------------------------------------------------

# Common Issues

### Vehicle does not spawn

- Verify the resource name is `cb_truck-swat`
- Confirm it is started in `server.cfg`
- Check for model name conflicts

### Missing textures

- Verify all files are present in `stream/`
- Clear FiveM cache and reconnect

### Vehicle has no sound

- Verify server audio configuration
- Check for conflicts with other sound resources

------------------------------------------------------------------------

# Updating the Pack

1. Stop the resource.
2. Back up the current version.
3. Replace it with the new version.
4. Restart the resource.
5. Test the vehicles again.

------------------------------------------------------------------------

# Support

When requesting support, include:

| Information | Example |
| --- | --- |
| Pack | `cb_truck-swat` |
| Version | `1.0.0` |
| Server Build | Latest |
| Vehicle | `cbsurb` |
| Issue | Brief problem description |

------------------------------------------------------------------------

<div style="text-align: center;">
  <strong>CB Studios</strong><br />
  FiveM Development Resources
</div>
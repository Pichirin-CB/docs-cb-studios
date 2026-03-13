# CB Studios - Vehicle Sound Pack Documentation

<div style="text-align: center;">
  <img src="https://img.shields.io/badge/CB%20Studios-FiveM%20Development-blue?style=for-the-badge" alt="CB Studios" />
  <img src="https://img.shields.io/badge/version-1.0.0-green?style=for-the-badge" alt="Version" />
  <img src="https://img.shields.io/badge/status-stable-brightgreen?style=for-the-badge" alt="Status" />
  <img src="https://img.shields.io/badge/type-Vehicle%20Sound%20Pack-orange?style=for-the-badge" alt="Type" />
</div>

------------------------------------------------------------------------

# Overview

| Field | Value |
| --- | --- |
| Pack Name | `cb_sonidos-vehiculos` |
| Author | **Pichirin_CB** |
| Adapted By | **CB Studios** |
| Type | FiveM Vehicle Sound Pack |
| Version | `1.0.0` |
| Game | `gta5` |
| FX Version | `adamant` |
| Status | Stable |

### Description

Vehicle sound pack for FiveM, modified and adapted by **CB Studios**.

This resource includes:

- 109 `AUDIO_WAVEPACK` entries
- 109 `AUDIO_GAMEDATA` entries
- 109 `AUDIO_SOUNDDATA` entries
- 53 `AUDIO_SYNTHDATA` entries

------------------------------------------------------------------------

# Features

- Large multi-engine sound library
- Organized `audioconfig/` and `sfx/` structure
- Resource-only setup (no scripts required)
- Ready to use with addon vehicles

------------------------------------------------------------------------

# Requirements

| Requirement | Details |
| --- | --- |
| FiveM Server | Latest recommended Cfx.re artifact |
| Game | GTA V (`gta5`) |
| Dependencies | None |

------------------------------------------------------------------------

# Installation

### 1. Place in resources

Example path inside your resources directory:

```txt
resources/[your_folder]/cb_sonidos-vehiculos
```

### 2. Add to `server.cfg`

```cfg
ensure cb_sonidos-vehiculos
```

### 3. Restart

```cfg
restart cb_sonidos-vehiculos
```

### 4. Verify

Spawn a supported vehicle and confirm custom engine audio is playing.

------------------------------------------------------------------------

# Usage

To hear a specific sound, the vehicle must use the matching `audioNameHash` in `vehicles.meta`.

Example:

```xml
<audioNameHash>aqm275amg</audioNameHash>
```

------------------------------------------------------------------------

# Compatibility

Works with:

- Standard FiveM servers
- Addon/custom vehicles
- RP and racing servers

Important:

If `audioNameHash` does not match an included sound profile, the vehicle will use another available/default sound.

------------------------------------------------------------------------

# Common Issues

### Sounds not playing

- Confirm the resource is started
- Check installation path and folder name
- Verify vehicle `audioNameHash`

### Default sounds still active

- Another sound resource may be overriding audio
- Check resource start order in `server.cfg`

### Resource starts but no changes

- Verify `fxmanifest.lua` and file structure were not modified
- Confirm `audioconfig/*.dat*` and `sfx/**/*.awc` files exist

------------------------------------------------------------------------

# Updating the Pack

1. Stop the resource.
2. Back up the current folder.
3. Replace files with the new version.
4. Restart the resource.
5. Test vehicles again.

------------------------------------------------------------------------

# Support

When requesting support provide:

| Information | Example |
| --- | --- |
| Pack | `cb_sonidos-vehiculos` |
| Version | `1.0.0` |
| Server Artifact | `12882` |
| Vehicle | Vehicle model name |
| audioNameHash | `aqm275amg` |
| Issue | Short description |

------------------------------------------------------------------------

<div style="text-align: center;">
  <strong>CB Studios</strong><br />
  FiveM Development Resources
</div>

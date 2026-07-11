# CB Studios --- Car Sound Pack Documentation

<div style="text-align: center;">
  <img src="https://img.shields.io/badge/CB%20Studios-FiveM%20Development-blue?style=for-the-badge" alt="CB Studios" />
  <img src="https://img.shields.io/badge/version-1.0.0-green?style=for-the-badge" alt="Version" />
  <img src="https://img.shields.io/badge/status-stable-brightgreen?style=for-the-badge" alt="Status" />
  <img src="https://img.shields.io/badge/framework-ESX%20%7C%20QBCore%20%7C%20Standalone-orange?style=for-the-badge" alt="Framework" />
</div>

------------------------------------------------------------------------

# Showcase

Replace the video below with your showcase video.

``` html
<iframe width="640" height="360"
src="https://www.youtube.com/embed/VIDEO_ID_HERE"
title="Car Sound Pack Showcase"
frameborder="0"
allowfullscreen>
</iframe>
```

------------------------------------------------------------------------

# Overview

  Field       Value
  ----------- ----------------------
  Pack Name   `cb_car_sounds_pack`
  Author      **CB Studios**
  Type        FiveM Car Sound Pack
  Version     `1.0.0`
  Status      Stable

### Description

A premium **car sound pack** developed by **CB Studios** designed to
improve vehicle immersion in FiveM servers.\
This pack replaces default engine audio with higher quality sounds for a
more realistic and aggressive driving experience.

Perfect for:

-   Roleplay servers
-   Racing servers
-   Custom vehicle communities
-   Survival servers

------------------------------------------------------------------------

# Features

-   High quality vehicle engine sounds
-   Clean and organized resource structure
-   Lightweight and optimized
-   Easy installation
-   Compatible with modern FiveM builds
-   Designed for immersive driving experience

------------------------------------------------------------------------

# Requirements

  Requirement    Details
  -------------- --------------------------------
  FiveM Server   Latest recommended build
  Game Build     Compatible recommended build
  Dependencies   None (unless stated otherwise)

------------------------------------------------------------------------

# Installation

### 1. Download

Download and extract the sound pack.

### 2. Place in resources

Place the folder inside your resources directory:

    resources/[your_folder]/cb_car_sounds_pack

### 3. Add to server.cfg

    ensure cb_car_sounds_pack

### 4. Restart the server

    restart cb_car_sounds_pack

### 5. Verify

Join the server and spawn a supported vehicle to confirm the new engine
sounds are working.

------------------------------------------------------------------------

# Configuration Example

``` lua
Config = {}

Config.Debug = false
Config.EnableCustomSounds = true
Config.ReplaceDefaultAudio = true
Config.SoundPackName = "CB Car Sounds Pack"
```

------------------------------------------------------------------------

# Usage

### In‑Game

  Action          Result
  --------------- -------------------------------
  Spawn vehicle   Custom engine sound loads
  Accelerate      Enhanced audio response
  Rev engine      Improved engine sound profile

------------------------------------------------------------------------

# Compatibility

Works with:

-   Standard FiveM servers
-   Custom vehicles
-   Addon car packs
-   Roleplay and racing servers

Important:

Vehicles must use the correct **audioNameHash** or sound configuration
for the audio to play correctly.

------------------------------------------------------------------------

# Common Issues

### Sounds not playing

-   Check that the resource is started
-   Verify installation path
-   Confirm the vehicle supports the sound

### Default sounds still active

-   Another resource may be overriding audio
-   Verify the pack files are streamed correctly

### Resource loads but no change

-   Check manifest structure
-   Verify correct file names
-   Test with supported vehicles

------------------------------------------------------------------------

# Updating the Pack

1.  Stop the resource
2.  Backup the old version
3.  Replace with the new files
4.  Restart the resource
5.  Test vehicles again

------------------------------------------------------------------------

# Support

When requesting support provide:

  Information    Example
  -------------- ----------------------------
  Pack           cb_car_sounds_pack
  Version        1.0.0
  Server Build   Latest
  Vehicle        Name of vehicle
  Issue          Description of the problem

------------------------------------------------------------------------

<div style="text-align: center;">
  <strong>CB Studios</strong><br />
  FiveM Development Resources
</div>

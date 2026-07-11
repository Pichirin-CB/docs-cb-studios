# CB Studios -- Script Documentation Template

<div style="text-align: center;">
  <img src="https://img.shields.io/badge/CB%20Studios-FiveM%20Development-blue?style=for-the-badge" alt="CB Studios" />
  <img src="https://img.shields.io/badge/version-1.0.0-green?style=for-the-badge" alt="Version" />
  <img src="https://img.shields.io/badge/status-stable-brightgreen?style=for-the-badge" alt="Status" />
  <img src="https://img.shields.io/badge/framework-ESX%20%7C%20QBCore%20%7C%20Standalone-orange?style=for-the-badge" alt="Framework" />
</div>

------------------------------------------------------------------------

# 📺 Showcase

<div align="center" style="margin-bottom: 1.5rem;">
  
  <iframe
    width="640"
    height="360"
    src="https://www.youtube.com/embed/VIDEO_ID_HERE"
    title="cb_example showcase"
    frameborder="0"
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
    allowfullscreen
    style="max-width: 100%; border-radius: 12px;"
  ></iframe>
</div>

------------------------------------------------------------------------

# 📖 Overview

  Field       Value
  ----------- ---------------------------
  Resource    `cb_example`
  Author      **CB Studios**
  Framework   ESX / QBCore / Standalone
  Version     `1.0.0`
  Status      Stable

### Description

Short explanation of the script.

Example:

> A lightweight and optimized FiveM script developed by **CB Studios**,
> designed to integrate seamlessly with modern server frameworks while
> maintaining high performance and clean code structure.

------------------------------------------------------------------------

# ✨ Features

-   Clean and optimized code
-   Easy installation
-   Lightweight performance
-   Fully configurable
-   Developer-friendly exports
-   Compatible with modern FiveM servers

------------------------------------------------------------------------

# 📦 Requirements

  Requirement    Details
  -------------- -------------------------------------
  FiveM Server   Latest recommended build
  Framework      ESX / QBCore / Standalone
  Database       oxmysql / mysql-async (if required)
  Dependencies   Any additional resources

Example dependencies:

-   oxmysql
-   qb-core
-   es_extended
-   target system (if used)

------------------------------------------------------------------------

# 📥 Installation

### 1️⃣ Download

Download the resource and extract it.

### 2️⃣ Place in resources folder

    resources/[your_folder]/cb_example

### 3️⃣ Add to server.cfg

    ## CB Studios
    ensure cb_example

### 4️⃣ Restart server

    start cb_example

### 5️⃣ Verify

Check the server console to confirm the resource started without errors.

------------------------------------------------------------------------

# ⚙️ Configuration

Example configuration:

``` lua
Config = {}

Config.Locale = "en"
Config.Debug = false

Config.ExampleValue = 100

Config.DiscordWebhook = ""
```

### Config Explanation

  Option           Description
  ---------------- -----------------------------
  Locale           Language used by the script
  Debug            Enables debug logging
  ExampleValue     Example configurable value
  DiscordWebhook   Webhook URL for logs

------------------------------------------------------------------------

# 🎮 Usage

### Commands

  Command         Description          Permission
  --------------- -------------------- ------------
  /example        Opens main menu      Everyone
  /exampleadmin   Admin test command   Admin

------------------------------------------------------------------------

### Keybinds

  Key   Action
  ----- ----------------------
  F5    Opens main interface

------------------------------------------------------------------------

# 🔌 Developer Integration

## Server Events

``` lua
AddEventHandler('cb_example:usedFeature', function(playerId, data)
    print(('Player %s used %s'):format(playerId, data.feature))
end)
```

  ------------------------------------------------------------------------
  Event                    Parameters              Description
  ------------------------ ----------------------- -----------------------
  cb_example:usedFeature   playerId, data          Triggered when feature
                                                   is used

  ------------------------------------------------------------------------

------------------------------------------------------------------------

## Client Events

``` lua
RegisterNetEvent('cb_example:notify', function(message)
end)
```

  Event               Parameters   Description
  ------------------- ------------ --------------------
  cb_example:notify   message      Shows notification

------------------------------------------------------------------------

## Exports

Example usage:

``` lua
local active = exports['cb_example']:IsFeatureActive(playerId)
```

  Export            Side     Description
  ----------------- -------- ------------------------
  IsFeatureActive   Client   Checks feature state
  GiveReward        Server   Gives reward to player

------------------------------------------------------------------------

# 🧪 Debugging & Common Issues

### Resource does not start

-   Verify folder name
-   Check server.cfg
-   Look for console errors

### Database errors

-   Verify SQL was imported
-   Check connection credentials

### Permissions issues

-   Check ACE permissions
-   Verify framework permissions

------------------------------------------------------------------------

# 🔄 Updating the Script

1.  Backup config.lua
2.  Stop the resource
3.  Replace the old version
4.  Merge config changes
5.  Restart the resource

------------------------------------------------------------------------

# 📬 Support

When requesting support provide:

  Information    Example
  -------------- -----------------------
  Script         cb_example v1.0.0
  Framework      ESX
  Server Build   Latest
  Issue          Steps to reproduce
  Logs           Server console output

------------------------------------------------------------------------

<div style="text-align: center;">
  <strong>CB Studios</strong><br />
  FiveM Development Resources
</div>

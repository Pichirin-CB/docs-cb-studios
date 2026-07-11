
██████╗ ███████╗ █████╗ ██████╗ ███╗   ███╗███████╗ 
██╔══██╗██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝ 
██████╔╝█████╗  ███████║██║  ██║██╔████╔██║█████╗   
██╔══██╗██╔══╝  ██╔══██║██║  ██║██║╚██╔╝██║██╔══╝   
██║  ██║███████╗██║  ██║██████╔╝██║ ╚═╝ ██║███████╗ 
╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚═╝     ╚═╝╚══════╝ 
---------------------------------------------------------------------------

# Universal Resource Technical Documentation

Resource Name: resource_name_here Version: 1.0.0 Author: YourName /
StudioName Type: Script / Vehicle Pack / Audio Pack / Map / Asset Pack

---------------------------------------------------------------------------

# Resource Overview

This document contains the technical information required to install,
configure and troubleshoot this resource.

This file is intended for administrators and developers who install or
maintain the resource.

---------------------------------------------------------------------------

# Resource Structure

Example structure of the resource:

resource_name/ │ ├─ fxmanifest.lua ├─ README.md │ ├─ client/ │ └─
main.lua │ ├─ server/ │ └─ main.lua │ ├─ shared/ │ └─ config.lua │ ├─
stream/ │ └─ assets │ └─ html/ └─ ui files

Note: Some folders may differ depending on the type of resource.

---------------------------------------------------------------------------

# Installation

1.  Extract the resource folder.

2.  Place the resource inside your server resources directory.

Example:

resources/\[your_folder]/resource_name

3.  Add the resource to your server configuration file.

Example server.cfg:

ensure resource_name

4.  Restart the server or start the resource manually.

restart resource_name

---------------------------------------------------------------------------

# Configuration

Configuration files are usually located in:

shared/config.lua

or

config.lua

Example configuration structure:

Config = {}

Config.Debug = false Config.EnableLogs = true

Modify configuration values according to your server needs.

---------------------------------------------------------------------------

# Dependencies

This resource may require the following components:

• FiveM server\
• Recommended server build\
• Framework (if applicable)\
• Inventory system (if applicable)

If no dependencies are required, the resource works standalone.

---------------------------------------------------------------------------

# Compatibility

This resource may be compatible with:

• ESX\
• QBCore\
• QBox\
• Standalone

Compatibility depends on the resource type and configuration.

---------------------------------------------------------------------------

# Updating the Resource

To update the resource:

1.  Stop the resource.
2.  Backup the current version.
3.  Replace the files with the new version.
4.  Review configuration changes.
5.  Restart the resource.

---------------------------------------------------------------------------

# Troubleshooting

Common issues:

Resource does not start

• Verify the resource name in server.cfg\
• Check console errors\
• Verify folder structure

Feature not working

• Check configuration settings\
• Verify dependencies\
• Ensure the resource started correctly

Assets not loading

• Clear FiveM cache\
• Verify streamed files\
• Check file paths

---------------------------------------------------------------------------

# Technical Notes

Do not rename internal files unless you know what you are doing.

Changing resource names may require adjusting:

• configuration files\
• dependencies\
• internal references

Always keep backups before modifying the resource.

---------------------------------------------------------------------------

# Support

If you require support provide the following information:

Resource Name\
Version\
Server Build\
Framework (if used)\
Error logs\
Description of the issue

 ██████╗██████╗     ███████╗████████╗██╗   ██╗██████╗ ██╗ ██████╗ ███████╗ 
██╔════╝██╔══██╗    ██╔════╝╚══██╔══╝██║   ██║██╔══██╗██║██╔═══██╗██╔════╝ 
██║     ██████╔╝    ███████╗   ██║   ██║   ██║██║  ██║██║██║   ██║███████╗ 
██║     ██╔══██╗    ╚════██║   ██║   ██║   ██║██║  ██║██║██║   ██║╚════██║ 
╚██████╗██████╔╝    ███████║   ██║   ╚██████╔╝██████╔╝██║╚██████╔╝███████║ 
 ╚═════╝╚═════╝     ╚══════╝   ╚═╝    ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝ ╚══════╝ 

Store -> https://store.pichirincb.com  
Documentation -> https://docs.pichirincb.com
Support Discord -> https://discord.gg/hsx6AvBg5s  

---------------------------------------------------------------------------

End of documentation

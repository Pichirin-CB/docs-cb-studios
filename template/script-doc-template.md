# <script-name>

Estado: `stable`  
Version: `0.1.0`  
Ultima actualizacion: `YYYY-MM-DD`

## Overview

Descripcion corta del script y problema que resuelve en tu servidor.

## Features

- Feature 1
- Feature 2
- Feature 3

## Requisitos

- FXServer artifact: `xxxx`
- Framework: `ESX` o `QBCore`
- Dependencias: `ox_lib`, `oxmysql`, etc.

## Instalacion

1. Copia la carpeta del recurso a `resources/[local]/<script-name>`.
2. Verifica dependencias en `resources/[standalone]`.
3. Asegura el recurso en `server.cfg`:

```cfg
ensure <dependency-1>
ensure <dependency-2>
ensure <script-name>
```

## Configuracion rapida

```lua
Config.Debug = false
Config.Locale = "es"
Config.Framework = "qb"
```

## Uso basico

Describe como lo usa un jugador y como lo usa staff/admin.

## Integraciones

- Inventario: `ox_inventory` / `qb-inventory`
- Target: `ox_target` / `qb-target`
- UI: `ox_lib`

## Referencia tecnica

- [Config](./config.md)
- [Events](./events.md)
- [Exports](./exports.md)
- [Commands](./commands.md)
- [Changelog](./changelog.md)

## FAQ

### No inicia el recurso

- Revisa el orden de `ensure`
- Revisa dependencias faltantes

### No se ejecuta un evento

- Verifica nombre del evento y lado correcto (client/server)

## Soporte

Define canal oficial de soporte (Discord, GitHub issues, etc.).

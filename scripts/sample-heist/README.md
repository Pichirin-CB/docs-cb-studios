# sample-heist

Estado: `stable`  
Version: `1.2.0`  
Ultima actualizacion: `2026-03-11`

## Overview

`sample-heist` agrega un sistema de robo por fases con cooldown global, policias requeridos y recompensas configurables.

## Features

- Inicio por item o comando admin
- Fases con checkpoints
- Alertas policiales
- Cooldown por servidor
- Hooks para logs externos

## Requisitos

- Framework: `QBCore` (adaptable a ESX)
- Dependencias:
  - `ox_lib`
  - `oxmysql`
  - `ox_target`

## Instalacion

1. Copia `sample-heist` a `resources/[local]/sample-heist`.
2. Importa SQL si aplica.
3. Asegura dependencias y recurso:

```cfg
ensure ox_lib
ensure oxmysql
ensure ox_target
ensure sample-heist
```

## Flujo de juego

1. Jugador activa punto de inicio.
2. Se valida `policeOnline` y cooldown.
3. Se ejecutan fases del robo.
4. Si completa, recibe recompensa.

## Referencia tecnica

- [Config](./config.md)
- [Events](./events.md)
- [Exports](./exports.md)
- [Commands](./commands.md)
- [Changelog](./changelog.md)

# sample-heist / Events

## Server events

### `sample-heist:server:start`

Inicia validaciones del robo.

Parametros:

- `source` (`number`)
- `zoneId` (`string`)

### `sample-heist:server:finish`

Entrega recompensa y aplica cooldown.

Parametros:

- `source` (`number`)
- `result` (`table`)

## Client events

### `sample-heist:client:beginPhase`

Inicia fase visual para el jugador.

Parametros:

- `phaseId` (`number`)
- `data` (`table`)

### `sample-heist:client:policeAlert`

Muestra alerta policial.

Parametros:

- `coords` (`vector3`)
- `label` (`string`)

## Ejemplo de uso

```lua
RegisterNetEvent("sample-heist:client:beginPhase", function(phaseId, data)
  print(("Phase %s started"):format(phaseId))
end)
```

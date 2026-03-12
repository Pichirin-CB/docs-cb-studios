# sample-heist / Events

## Server events

### `sample-heist:server:start`

Runs start validation for the heist flow.

Parameters:

- `source` (`number`)
- `zoneId` (`string`)

### `sample-heist:server:finish`

Applies rewards and starts cooldown.

Parameters:

- `source` (`number`)
- `result` (`table`)

## Client events

### `sample-heist:client:beginPhase`

Starts the phase visuals and objective logic.

Parameters:

- `phaseId` (`number`)
- `data` (`table`)

### `sample-heist:client:policeAlert`

Pushes dispatch data to police players.

Parameters:

- `coords` (`vector3`)
- `label` (`string`)

## Usage example

```lua
RegisterNetEvent("sample-heist:client:beginPhase", function(phaseId, data)
  print(("Phase %s started"):format(phaseId))
end)
```

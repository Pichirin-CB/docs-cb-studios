# sample-heist / Exports

## Client exports

### `IsInHeist()`

Retorna si el jugador local esta en una sesion activa.

```lua
local inHeist = exports["sample-heist"]:IsInHeist()
```

## Server exports

### `GetHeistState()`

Retorna estado global del recurso.

```lua
local state = exports["sample-heist"]:GetHeistState()
print(state.cooldownEndsAt)
```

### `ForceResetHeist()`

Resetea estado global (uso admin / mantenimiento).

```lua
exports["sample-heist"]:ForceResetHeist()
```

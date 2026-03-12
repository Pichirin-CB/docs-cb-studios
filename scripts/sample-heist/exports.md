# sample-heist / Exports

## Client exports

### `IsInHeist()`

Returns whether the local player is currently in an active heist.

```lua
local inHeist = exports["sample-heist"]:IsInHeist()
```

## Server exports

### `GetHeistState()`

Returns the current global heist state object.

```lua
local state = exports["sample-heist"]:GetHeistState()
print(state.cooldownEndsAt)
```

### `ForceResetHeist()`

Force-resets active state and cooldown (admin/maintenance usage).

```lua
exports["sample-heist"]:ForceResetHeist()
```

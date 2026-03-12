# sample-heist / Config

## Variables principales

```lua
Config.Debug = false
Config.Locale = "es"
Config.RequiredPolice = 2
Config.GlobalCooldown = 45 -- minutos
Config.StartItem = "heist_card"
```

## Rewards

```lua
Config.Rewards = {
  money = { min = 5000, max = 8000 },
  items = {
    { name = "goldbar", chance = 30, amount = { min = 1, max = 2 } },
    { name = "diamond", chance = 10, amount = { min = 1, max = 1 } }
  }
}
```

## Zones

```lua
Config.Zones = {
  start = vec3(253.94, 228.12, 101.68),
  hack = vec3(257.23, 220.12, 106.28),
  vault = vec3(264.73, 213.45, 101.68)
}
```

## Buenas practicas

- No dejes `Debug = true` en produccion.
- Usa cooldown mayor a 30 min para economias sensibles.

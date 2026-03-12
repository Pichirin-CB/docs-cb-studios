# sample-heist / Config

## Core settings

```lua
Config.Debug = false
Config.Locale = "en"
Config.RequiredPolice = 2
Config.GlobalCooldown = 45 -- minutes
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

## Zone coordinates

```lua
Config.Zones = {
  start = vec3(253.94, 228.12, 101.68),
  hack = vec3(257.23, 220.12, 106.28),
  vault = vec3(264.73, 213.45, 101.68)
}
```

## Best practices

- Keep `Debug = false` in production.
- Use 30+ minute cooldown for stable server economy balance.

# sample-heist / Commands

## Admin commands

### `/heiststart`

Force-starts a heist session (staff only).

Suggested permission:

- `group.admin`

### `/heistreset`

Resets cooldown and active state.

Suggested permission:

- `group.superadmin`

## ACE example

```cfg
add_ace group.admin command.heiststart allow
add_ace group.superadmin command.heistreset allow
```

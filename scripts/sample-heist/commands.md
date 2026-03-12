# sample-heist / Commands

## Comandos admin

### `/heiststart`

Fuerza inicio de evento (solo staff).

Permiso sugerido:

- `group.admin`

### `/heistreset`

Resetea cooldown y estado activo.

Permiso sugerido:

- `group.superadmin`

## Ejemplo ACE

```cfg
add_ace group.admin command.heiststart allow
add_ace group.superadmin command.heistreset allow
```

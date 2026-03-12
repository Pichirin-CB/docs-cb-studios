# Estructura recomendada

## Arbol base

```text
.
|-- index.html
|-- README.md
|-- _navbar.md
|-- _sidebar.md
|-- styles/
|   `-- ios.css
|-- guide/
|   |-- quickstart.md
|   `-- structure.md
|-- template/
|   `-- script-doc-template.md
`-- scripts/
    `-- <nombre-script>/
        |-- README.md
        |-- config.md
        |-- events.md
        |-- exports.md
        |-- commands.md
        `-- changelog.md
```

## Estandar de secciones en README de script

1. Overview (que hace el recurso)
2. Features
3. Requisitos
4. Instalacion
5. Configuracion rapida
6. Integraciones (ESX/QB/ox_lib/etc)
7. FAQ corta
8. Links tecnicos a pages (`config`, `events`, `exports`, `commands`)

## Convencion de codigo

- `lua` para snippets de cliente/servidor
- `cfg` para fragments de `server.cfg`
- `json` para data config cuando aplique

## Versionado

- `major.minor.patch` (ejemplo: `2.3.1`)
- Changelog con fecha `YYYY-MM-DD`

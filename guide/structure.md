# Recommended Structure

## Base tree

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
    `-- <script-name>/
        |-- README.md
        |-- config.md
        |-- events.md
        |-- exports.md
        |-- commands.md
        `-- changelog.md
```

## README standard for each script

1. Overview
2. Features
3. Requirements
4. Installation
5. Quick configuration
6. Integrations
7. FAQ
8. Technical links (`config`, `events`, `exports`, `commands`, `changelog`)

## Code block conventions

- Use `lua` for client/server snippets.
- Use `cfg` for `server.cfg` examples.
- Use `json` when documenting structured config files.

## Versioning

- Follow `major.minor.patch` (example: `2.3.1`).
- Changelog date format: `YYYY-MM-DD`.

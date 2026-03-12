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
    |-- <script-name>.md
    `-- <another-script>.md
```

## Standard sections for each script file

1. Overview
2. Features
3. Requirements
4. Installation
5. Quick configuration
6. Integrations
7. FAQ
8. Events
9. Exports
10. Commands
11. Changelog

## Code block conventions

- Use `lua` for client/server snippets.
- Use `cfg` for `server.cfg` examples.
- Use `json` when documenting structured config files.

## Versioning

- Follow `major.minor.patch` (example: `2.3.1`).
- Changelog date format: `YYYY-MM-DD`.

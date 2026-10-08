# Changelog

> Release history, improvements, compatibility updates, and development milestones for **CB Survival Extract** by **CB Studios**.

**Resource:** [`cb-survivalextract`](#/scripts/apocalypse-extraction)  
**Development started:** January 2026  
**Latest documented version:** `v1.1.1` — July 11, 2026  
**Documented releases:** 2

---

## Release timeline

| Date | Version / milestone | Details |
| --- | --- | --- |
| July 11, 2026 | **v1.1.1** · Compatibility update | Inventory support and helicopter configuration fixes |
| March 12, 2026 | **v1.1.0** · System update | Independent architecture and expanded integrations |
| January 2026 | **Development started** | Initial development of the survival extraction project |

> **Note:** The March and July release dates are retained from the existing changelog. The exact start day in January is not documented. Earlier releases are not listed because their dates and details have not been confirmed.

---

## v1.1.1 — Compatibility Update

**July 11, 2026** · `cb-survivalextract`

Expanded inventory compatibility, fixed extraction helicopter model configuration, and improved stability and customization.

### Highlights

- Added support for `ashenlabs_inventory`.
- Fixed an issue where changing the extraction helicopter model did not work correctly.
- Improved overall compatibility and stability.

### Inventory compatibility

- Integrated `ashenlabs_inventory` support.
- Expanded integration options for different server setups.

### Helicopter improvements

- Fixed custom extraction helicopter model selection.
- Supported helicopter models can be configured through the resource configuration.

### General improvements

- Improved compatibility with supported environments.
- Improved customization experience.
- Increased system stability.

[View full v1.1.1 release notes](#/changelog/1.1.1)

---

## v1.1.0 — System Update

**March 12, 2026** · `cb-survivalextract`

Removed the `hate-bridge` dependency, improved the internal resource architecture, and added integration hooks for inventories and notifications.

### Architecture

- Removed the `hate-bridge` dependency.
- Made the resource more independent and easier to install.
- Added integration hooks in `custom.lua`.

### Inventory integrations

- Added support for `qs_inventory`.
- Added support for `core_inventory`.
- Added support for `tgiann-inventory`.

### Customization and documentation

- Improved modular design for future expansions.
- Allowed easier customization without editing core files.
- Documented modified files and retained compatibility and localization notes.

### Important changes

> **Migration notice:** Removing `hate-bridge` changes the installation process for servers that previously relied on that integration. Review your configuration and custom hooks before updating.

[View full v1.1.0 release notes](#/changelog/1.1.0)

---

## January 2026 — Development Started

**Project milestone** · CB Studios

Development of the FiveM survival extraction resource began in **January 2026**. This milestone marks the start of the project, not a confirmed public release.

The project was conceived as a configurable extraction system for survival-oriented FiveM servers, with room for future improvements and integrations.

---

*CB Studios · CB Survival Extract*

# 🧾 **CHANGELOG:**

---

## 🚀 | cb_deadzone-extract - `1.1.0` - 2026-03-12

### ✨ Highlights
- Removed dependency on `hate-bridge`.
- The script is now more independent and easier to install.
- Internal structure was improved to make the resource more modular and easier to expand in future updates.

### 🔧 Core Changes
- Removed all runtime reliance on `hate-bridge`.
- Refactored core internals for cleaner modular design.
- Improved maintainability for future feature development.

### 📦 Inventory Compatibility
- Added support for additional inventory systems:
  - `qs_inventory`
  - `core_inventory`
  - `tgiann-inventory`
- The script now works with more server configurations without external bridge dependencies.

### 🛠 Custom Integration System
- Added `custom.lua` to enable easy integration of new inventory systems.
- Developers can now add support for other inventories without modifying core resource files.

### 🔔 Notification System
- Added support through `custom.lua` for custom notification systems.
- Server owners can connect the script to any notification framework.

### 🌍 Localization
- Added new languages:
  - 🇫🇷 French
  - 🇵🇹 Portuguese
- Improved accessibility for international communities.

### 🧩 General Improvements
- Better flexibility for server developers.
- Easier customization and maintenance.
- Improved compatibility with different server ecosystems.

### 🗂️ Files Modified
- `custom.lua`
- Inventory adapter/integration files
- Notification integration layer
- Localization files (`fr`, `pt`)
- Core modular structure files

---

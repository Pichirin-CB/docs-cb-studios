# Installation Guide

[Home](/home.md) / Guides / Installation

This general guide explains the safe installation workflow for CB Studios resources. Always follow the product-specific page first when it contains more specific instructions.

## Before Installing

| Check | Why it matters |
| --- | --- |
| Product name | Ensures you are reading the correct documentation page. |
| Framework | Confirms ESX, QBCore, QBox, Standalone, or custom support when documented. |
| Dependencies | Prevents missing database, inventory, target, notification, or fuel integrations. |
| Resource folder name | Some resources require an exact folder name. |
| Database files | SQL imports may be required for persistence. |
| Store ownership | Asset Escrow resources require the correct Cfx.re / Tebex entitlement. |

## General Installation Flow

1. Download the resource from the official source.
2. Extract the package.
3. Place the resource in your server `resources` folder.
4. Read the product page for required dependencies and start order.
5. Import SQL files only when the product documentation requires it.
6. Add the `ensure resource_name` line to `server.cfg`.
7. Restart the server or start the resource manually.
8. Check server console and client F8 console for errors.

<div class="docs-callout docs-callout--important">
  <strong>Product-specific instructions win.</strong>
  <p>If a product page gives a specific folder name, dependency order, SQL file, item snippet, or configuration step, follow that page instead of this general guide.</p>
</div>

## Related Pages

- [Asset Escrow System](/fxap.md)
- [Common Problems](/problems.md)
- [Support](/support.md)


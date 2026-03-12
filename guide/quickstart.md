# Quickstart

## 1) Run docs locally

```bash
npx docsify-cli serve .
```

## 2) Use one folder per script

Every script should live in:

```text
scripts/<script-name>/
```

Recommended minimum:

```text
scripts/<script-name>/README.md
scripts/<script-name>/config.md
scripts/<script-name>/events.md
scripts/<script-name>/exports.md
scripts/<script-name>/commands.md
scripts/<script-name>/changelog.md
```

## 3) Add your script to navigation

Edit `/_sidebar.md` and add links for each page.

## 4) Documentation quality rules

- Define clear requirements (framework, dependencies, artifact version).
- Keep installation steps short and verifiable.
- Separate technical references (`events`, `exports`, `commands`) into dedicated pages.
- Include real code examples.
- Keep changelog entries in descending order by date.

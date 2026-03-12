# Quickstart

## 1) Run docs locally

```bash
npx docsify-cli serve .
```

## 2) Use one file per script

Every script should be a single markdown file:

```text
scripts/<script-name>.md
```

Example:

```text
scripts/cb-housing.md
scripts/cb-inventory.md
scripts/cb-heist.md
```

## 3) Add your script to navigation

Edit `/_sidebar.md` and add one link per script file.

## 4) Documentation quality rules

- Define clear requirements (framework, dependencies, artifact version).
- Keep installation steps short and verifiable.
- Keep technical references (`events`, `exports`, `commands`) as sections inside the same file.
- Include real code examples.
- Keep changelog entries in descending order by date.

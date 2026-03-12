# Quickstart

## 1) Ejecutar docs en local

```bash
npx docsify-cli serve .
```

## 2) Convencion por script

Cada script debe vivir en:

```text
scripts/<nombre-script>/
```

Minimo recomendado:

```text
scripts/<nombre-script>/README.md
scripts/<nombre-script>/config.md
scripts/<nombre-script>/events.md
scripts/<nombre-script>/exports.md
scripts/<nombre-script>/commands.md
scripts/<nombre-script>/changelog.md
```

## 3) Agregar nuevo script al menu

Edita `/_sidebar.md` y anade tus enlaces.

## 4) Reglas basicas de documentacion

- Define requisitos claros (framework, dependencias, version de artifact).
- Explica instalacion en pasos cortos.
- Separa referencias tecnicas (events, exports, commands) en paginas propias.
- Incluye ejemplos de codigo reales.
- Mantiene changelog en orden descendente.

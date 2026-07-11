# docs-cb-studios

Documentacion oficial de CB Studios creada con Docsify.

Este repositorio no es una app con backend. Es una web estatica de documentacion: `index.html` carga Docsify, Docsify lee archivos `.md`, y el menu lateral se arma desde `_sidebar.md`.

## Que decision quieres tomar?

Usa esta tabla para saber que archivo tocar segun lo que quieres cambiar.

| Necesito... | Tocar... | Nota |
| --- | --- | --- |
| Cambiar la pagina inicial | `home.md` | Es la pagina que carga Docsify por defecto. |
| Agregar o quitar opciones del menu | `_sidebar.md` | Si una pagina no esta aqui, puede existir pero no aparece en el menu. |
| Crear documentacion de un script | `scripts/` | Puedes copiar `scripts/template-script.md`. |
| Crear documentacion de vehiculos | `vehicles/` | Puedes copiar `vehicles/template-pack-vehicle.md`. |
| Crear documentacion de sonidos | `audio/` | Puedes copiar `audio/template-pack-sounds.md`. |
| Crear documentacion de MLO o mapping | `mlo-mapping/` | Puedes copiar `mlo-mapping/template-mlo.md`. |
| Cambiar logo o imagenes | `assets/` | El logo principal usado por la web esta en `assets/logo.png`. |
| Activar o editar el banner superior | `banner-config.js` | Cambia `enabled`, `type`, `title`, `subtitle` y `cta`. |
| Cambiar colores, layout o comportamiento visual | `index.html` | La mayor parte del CSS esta dentro de este archivo. |
| Cambiar dependencias o scripts npm | `package.json` | Solo necesario si cambias herramientas del proyecto. |
| Cambiar el dominio publicado | `CNAME` | Actualmente apunta a `docs.pichirincb.com`. |

## Como funciona

Docsify convierte archivos Markdown en paginas dentro del navegador.

Flujo general:

```text
index.html
  -> carga Docsify desde CDN
  -> usa window.$docsify como configuracion
  -> lee home.md como pagina inicial
  -> lee _sidebar.md como menu lateral
  -> carga banner-config.js para el banner superior
  -> carga assets/ para logos e imagenes
```

La configuracion importante esta dentro de `index.html`:

| Opcion | Valor actual | Para que sirve |
| --- | --- | --- |
| `homepage` | `home.md` | Define la pagina inicial. |
| `loadSidebar` | `true` | Activa el menu desde `_sidebar.md`. |
| `subMaxLevel` | `3` | Muestra subtitulos de las paginas en el menu. |
| `maxLevel` | `4` | Nivel maximo de encabezados que Docsify procesa. |
| `search.paths` | `auto` | Docsify indexa paginas automaticamente para busqueda. |
| `themeColor` | `#34b6ff` | Color principal de Docsify. |

## Arranque local

No abras `index.html` directamente con `file://`.

Incorrecto:

```text
file:///C:/Users/mlore/OneDrive/Escritorio/docs-cb-studios/index.html#/
```

Correcto:

```text
http://localhost:3000
```

Docsify necesita un servidor local para poder cargar los archivos `.md`, el sidebar, la busqueda y los assets. Si abres el archivo directo, es normal ver errores como `404 not found`.

## Arranque rapido en Windows

La forma recomendada es usar doble clic en:

```text
start.bat
```

Tambien existe:

```text
star.bat
```

El `.bat` hace estas decisiones automaticamente:

- Entra en la carpeta correcta del proyecto.
- Verifica que exista Node.js.
- Usa `npm.cmd`, que evita el bloqueo de `npm.ps1` en PowerShell.
- Instala dependencias si falta `node_modules`.
- Busca un puerto libre entre `3000` y `3010`.
- Arranca Docsify.
- Abre el navegador con la URL correcta.

Deja abierta la ventana del `.bat`. Si la cierras, el servidor local se detiene.

## Arranque manual

Desde la carpeta del proyecto:

```bash
npm.cmd install
npm.cmd run dev
```

Luego abre:

```text
http://localhost:3000
```

Si `3000` esta ocupado, cierra el otro servidor o usa el `.bat`, que busca otro puerto libre automaticamente.

## Agregar una pagina nueva

Ejemplo: agregar un nuevo script pago.

1. Copia el template:

```text
scripts/template-script.md
```

2. Pegalo con un nombre claro:

```text
scripts/mi-nuevo-script.md
```

3. Edita el contenido del nuevo `.md`.

4. Agrega el enlace en `_sidebar.md` bajo la categoria correcta:

```md
- **PAID RESOURCES**
  - [Nombre del Script](/scripts/mi-nuevo-script.md)
```

5. Arranca el sitio y revisa que el enlace cargue.

Decision importante: crear el archivo no basta. Para que aparezca en la navegacion, tambien debes agregarlo en `_sidebar.md`.

## Categorias actuales

| Categoria | Carpeta o archivo | Uso |
| --- | --- | --- |
| Information | `home.md`, `changelog.md` | Inicio y cambios del proyecto. |
| Support | `support.md`, `faq.md`, `problems.md`, `fxap.md` | Ayuda, dudas y problemas comunes. |
| Paid Resources | `scripts/` | Scripts pagos. |
| Free Resources | `scripts/` | Scripts gratuitos. |
| Vehicle Packs | `vehicles/` | Packs de vehiculos. |
| Audio Packs | `audio/` | Packs de sonidos. |
| MLO / Mapping | `mlo-mapping/` | Interiores, mapas y recursos de mapping. |

Si una categoria existe en carpeta pero no aparece en el menu, agregala en `_sidebar.md`.

## Banner superior

El banner global se controla desde:

```text
banner-config.js
```

Campos principales:

| Campo | Uso |
| --- | --- |
| `enabled` | `true` lo muestra, `false` lo oculta. |
| `type` | Cambia el estilo: `info`, `alert`, `sale`, `maintenance`, `announcement`, `warning`. |
| `layout` | `full` o `compact`. |
| `align` | `center` o `left`. |
| `icon` | Icono o texto corto mostrado al inicio. |
| `title` | Texto principal del banner. |
| `subtitle` | Texto secundario. Puede incluir HTML simple. |
| `cta.enabled` | Muestra u oculta el boton. |
| `cta.label` | Texto del boton. |
| `cta.url` | Enlace del boton. |
| `cta.target` | `_self` abre en la misma pestana, `_blank` abre otra. |

Decision rapida:

- Para ocultar el banner: `enabled: false`.
- Para promocion: `type: "sale"`.
- Para aviso urgente: `type: "alert"` o `type: "warning"`.
- Para mantenimiento: `type: "maintenance"`.

## Estilos y estructura visual

La web tiene la mayoria de los estilos dentro de `index.html`, no en `styles.css`.

Antes de mover estilos, revisa esto:

- `index.html` controla tema, layout, sidebar, loader, footer, banner y boton de scroll.
- `styles.css` existe, pero el sitio actual depende principalmente del CSS embebido en `index.html`.
- Cambiar colores globales normalmente se hace en las variables `:root` dentro de `index.html`.
- Cambiar logo del sidebar se hace reemplazando `assets/logo.png` o editando el HTML generado por el plugin de Docsify en `index.html`.

Decision recomendada: si solo vas a cambiar contenido, no toques `index.html`. Si vas a cambiar apariencia global, entonces si toca `index.html`.

## Publicacion

El archivo `CNAME` indica el dominio publico:

```text
docs.pichirincb.com
```

Como es un sitio Docsify estatico, normalmente se puede publicar con GitHub Pages u otro hosting estatico. Para publicar cambios, asegurrate de subir:

- Los `.md` nuevos o editados.
- `_sidebar.md` si cambiaste navegacion.
- `assets/` si agregaste imagenes.
- `index.html` si cambiaste configuracion o estilos.
- `banner-config.js` si cambiaste el banner.

No subas `node_modules/`; esta ignorado por `.gitignore`.

## Solucion de problemas

| Problema | Causa probable | Solucion |
| --- | --- | --- |
| `404 not found` al abrir `file://` | Se abrio `index.html` directo | Usa `start.bat` y entra por `http://localhost:PUERTO`. |
| PowerShell bloquea `npm` | Windows bloquea `npm.ps1` | Usa `npm.cmd install` y `npm.cmd run dev`. |
| El puerto `3000` esta ocupado | Hay otro servidor abierto | Cierra el otro servidor o usa `start.bat`. |
| Una pagina existe pero no aparece | Falta enlace en `_sidebar.md` | Agrega la pagina al menu. |
| El logo no carga | Ruta incorrecta o archivo faltante | Revisa `assets/logo.png`. |
| El banner no aparece | `enabled` esta en `false` | Cambia `enabled: true` en `banner-config.js`. |
| La busqueda no encuentra una pagina | Docsify no la indexo aun o no esta enlazada | Recarga la pagina y revisa que el `.md` sea accesible. |

## Checklist antes de terminar cambios

- Arranca con `start.bat` o `npm.cmd run dev`.
- Revisa la pagina en `http://localhost:PUERTO`.
- Abre los enlaces nuevos desde el sidebar.
- Comprueba que no estas usando `file://`.
- Si agregaste una pagina, confirma que esta en `_sidebar.md`.
- Si agregaste assets, confirma que la ruta es correcta.
- Revisa `git status` para saber exactamente que archivos cambiaron.

## Dependencias

El proyecto usa:

```json
{
  "docsify-cli": "^4.4.4"
}
```

No necesitas instalar `docsify-cli` globalmente. El proyecto usa la dependencia local instalada en `node_modules/`.

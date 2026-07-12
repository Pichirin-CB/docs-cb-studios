# docs-cb-studios

Documentacion oficial de **CB Studios** creada con **Docsify**.

Este repositorio no es una app con backend. Es una web estatica de documentacion: `index.html` carga Docsify, Docsify lee archivos `.md`, y el menu lateral se arma desde `_sidebar.md`.

La documentacion publica del sitio debe estar escrita en **ingles profesional**. Este `README.md` es una guia interna de mantenimiento en espanol para decidir que archivo tocar.

## Identidad oficial

| Dato | Valor actual |
| --- | --- |
| Marca / tienda | CB Studios |
| Creator / owner name | pichirin_cb |
| Email oficial | `pichirincb@gmail.com` |
| Discord oficial | `https://discord.gg/hsx6AvBg5s` |
| Tienda oficial | `https://pichirin-cb.tebex.io/` |
| Docs publicas | `https://docs.pichirincb.com` |
| Dominio en `CNAME` | `docs.pichirincb.com` |
| Referencia publica legal | Tampa, Florida, United States |

Decision importante: si cambia la tienda, Discord, email, dominio o identidad, revisa `support.md`, `fxap.md`, `legal/`, `banner-config.js`, templates y paginas de recursos que tengan enlaces de soporte.

## Que decision quieres tomar?

Usa esta tabla para saber que archivo tocar segun lo que quieres cambiar.

| Necesito... | Tocar... | Nota |
| --- | --- | --- |
| Cambiar la pagina inicial | `home.md` | Es la pagina que carga Docsify por defecto. |
| Agregar o quitar opciones del menu | `_sidebar.md` | Si una pagina no esta aqui, puede existir pero no aparece en el menu. |
| Crear documentacion de un script | `scripts/` | Copia `scripts/template-script.md` o `templates/template-script.md`. |
| Agregar una tarjeta al hub de productos | `products-config.js` | Usa solo informacion verificada en la documentacion existente. |
| Cambiar productos destacados en Home | `products-config.js` | Cambia `featured: true` o `false`. |
| Quitar temporalmente un recurso del sitio publico | `_sidebar.md`, `products-config.js` y el `.md` del recurso | Si el `.md` queda en el repo, Docsify podria servirlo por ruta directa. |
| Crear documentacion de vehiculos | `vehicles/` | Copia `templates/template-pack-vehicle.md`. |
| Crear documentacion de sonidos | `audio/` | Copia `templates/template-pack-sounds.md`. |
| Crear documentacion de MLO o mapping | `mlo-mapping/` | Copia `templates/template-mlo.md`. |
| Crear o editar paginas legales | `legal/` y `_sidebar.md` | Las paginas legales ya estan enlazadas bajo **LEGAL**. |
| Crear una entrada de changelog | `changelog.md` o `changelog/` | Puedes copiar `templates/template-changelog-entry.md`. |
| Crear un README para un recurso externo | `templates/template-readme.md` | Es plantilla para paquetes fuera de esta web. |
| Cambiar logo o imagenes | `assets/` | El logo principal usado por la web esta en `assets/logo.png`. |
| Activar o editar el banner superior | `banner-config.js` | Cambia `enabled`, `type`, `title`, `subtitle` y `cta`. |
| Cambiar colores, layout o footer | `index.html` | La mayor parte del CSS y el footer global estan dentro de este archivo. |
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
  -> agrega el footer global desde el hook afterEach
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

Decision importante: no cambies la configuracion de Docsify si solo estas agregando o editando contenido Markdown.

## Estructura actual

| Ruta | Uso |
| --- | --- |
| `_sidebar.md` | Menu lateral publico. |
| `home.md` | Pagina inicial. |
| `getting-started.md` | Guia inicial para clientes nuevos. |
| `products.md` | Pagina de todos los productos con filtros client-side. |
| `products-config.js` | Metadata estatica usada por Home y Products. |
| `guides/` | Guias generales de instalacion y actualizacion. |
| `support.md`, `faq.md`, `problems.md`, `fxap.md` | Soporte, preguntas, problemas comunes y Asset Escrow. |
| `legal/` | License Agreement, Terms, Copyright, Refund, Privacy y DMCA. |
| `scripts/` | Documentacion de scripts y recursos tipo script. |
| `vehicles/` | Documentacion de packs de vehiculos. |
| `audio/` | Documentacion de packs de sonidos. |
| `mlo-mapping/` | Documentacion de interiores, mapas y recursos de mapping. |
| `templates/` | Plantillas base para crear nuevas paginas o docs de recursos. |
| `assets/` | Logos, imagenes e iconos usados por la web. |
| `banner-config.js` | Configuracion del banner superior global. |
| `index.html` | Docsify, CSS principal, plugins, footer y comportamiento visual. |
| `CNAME` | Dominio publico para GitHub Pages u hosting estatico similar. |

Assets de categorias usados en Home:

| Categoria | Asset |
| --- | --- |
| Scripts | `assets/scripts.png` |
| Vehicle Packs | `assets/vehicle-packs.png` |
| Audio Packs | `assets/audio-packs.png` |
| MLO / Mapping | `assets/mlo-mapping.png` |
| Free Resources | `assets/free-Resources.png` |

Decision importante: estos assets se muestran pequenos dentro de las tarjetas de categorias. Si los reemplazas, manten imagenes limpias y legibles en tamano reducido.

## Categorias actuales del menu

| Categoria | Paginas actuales | Uso |
| --- | --- | --- |
| Home | `home.md`, `getting-started.md`, `products.md` | Entrada principal, onboarding y productos. |
| Products | `scripts/electric-cuba.md`, `scripts/cadeca-cuba.md`, `scripts/tactical-notify.md`, `scripts/apocalypse-extraction.md`, `vehicles/`, `audio/`, `mlo-mapping/` | Recursos publicados o documentados, agrupados por tipo. |
| Guides | `guides/installation.md`, `guides/updating-resources.md`, `fxap.md` | Instalacion, actualizacion y Asset Escrow. |
| Support | `support.md`, `faq.md`, `problems.md`, `fxap.md` | Ayuda, dudas, problemas comunes y Asset Escrow. |
| Changelog | `changelog.md` | Release notes generales. |
| Legal | `legal/index.md`, `legal/license.md`, `legal/terms.md`, `legal/copyright.md`, `legal/refund.md`, `legal/privacy.md`, `legal/dmca.md` | Documentos legales oficiales. |

Decision importante: crear un archivo `.md` no basta. Para que aparezca en la navegacion, tambien debes enlazarlo en `_sidebar.md`.

## Product hub y metadata

La pagina `products.md` y la seccion de productos destacados de `home.md` usan:

```text
products-config.js
```

Campos importantes:

| Campo | Uso |
| --- | --- |
| `slug` | Identificador interno estable. |
| `name` | Nombre mostrado en tarjetas. |
| `resource` | Nombre tecnico del recurso si esta documentado. |
| `category` | Categoria visible: Paid Scripts, Free Resources, Vehicle Packs, Audio Packs, MLO / Mapping. |
| `type` | `paid`, `free` o `null` si no esta claramente confirmado. |
| `docPath` | Ruta publica al `.md`. |
| `storeUrl` | Usa `https://pichirin-cb.tebex.io/` si el recurso se obtiene desde Tebex, incluso si cuesta `0 USD`. |
| `frameworks` | Solo frameworks documentados en la pagina del producto. |
| `status` | Estado documentado, por ejemplo `Stable`. |
| `featured` | `true` lo muestra en Home. |
| `description` | Resumen corto derivado de la documentacion existente. |

Decision importante: no inventes precios, versiones, ratings, descargas, clientes, tiempos de respuesta ni compatibilidades.

Comportamiento visual actual:

- Las tarjetas de productos se generan desde `products-config.js`.
- Cada tarjeta tiene botones fijos al fondo para que la posicion no dependa del largo de la descripcion.
- Cada tarjeta muestra `Docs` y, si `storeUrl` existe, `Store`.
- Los recursos gratis publicados en Tebex tambien deben tener `storeUrl`.
- Si algun recurso no tiene `storeUrl`, el segundo boton cae a `Support`.

Estado actual de productos:

| Recurso | Tipo | Tienda |
| --- | --- | --- |
| Cuban Electric Company | paid | Tebex |
| CADECA Cuba Exchange | paid | Tebex |
| Tactical Notify | free / `0 USD` | Tebex |
| Apocalypse Extraction | free / `0 USD` | Tebex |
| SWAT Vehicle Pack | sin precio confirmado en docs | Tebex |
| Truck Vehicle Pack | sin precio confirmado en docs | Tebex |
| Car Sound Pack | sin precio confirmado en docs | Tebex |
| Industrial Truck Workshop | sin precio confirmado en docs | Tebex |

Recurso retirado actualmente:

| Recurso | Nota |
| --- | --- |
| Welcome Pack | No esta publicado ni enlazado actualmente. No debe aparecer en `_sidebar.md`, `products-config.js` ni como pagina publica mientras no se este entregando. |

## Sistema de tema

El sitio soporta modo claro y oscuro desde `index.html`.

- Respeta `prefers-color-scheme` en la primera visita.
- Guarda preferencia en `localStorage` con la clave `cb-theme`.
- El boton de tema se agrega automaticamente en el brand area del sidebar.
- Los colores se controlan con variables CSS en `:root` y `:root[data-theme="light"]`.

Para probar:

1. Abre el sitio local.
2. Pulsa el boton de tema en el sidebar.
3. Recarga la pagina.
4. Confirma que el tema elegido persiste.

## Componentes reutilizables

### Botones

```html
<a class="docs-button docs-button--primary" href="#/products">Browse Products</a>
<a class="docs-button" href="#/support">Support</a>
<a class="docs-button docs-button--ghost" href="https://pichirin-cb.tebex.io/" target="_blank" rel="noopener noreferrer">Store</a>
```

### Callouts

```html
<div class="docs-callout docs-callout--warning">
  <strong>Warning</strong>
  <p>Back up your configuration before updating.</p>
</div>
```

Variantes disponibles:

| Clase | Uso |
| --- | --- |
| `docs-callout--info` | Informacion general. |
| `docs-callout--important` | Aviso importante. |
| `docs-callout--warning` | Riesgo o precaucion. |
| `docs-callout--danger` | Error grave o accion destructiva. |
| `docs-callout--success` | Resultado correcto. |
| `docs-callout--tip` | Consejo practico. |

## Banner superior avanzado

`banner-config.js` sigue siendo la fuente central.

Ademas de los campos existentes, ahora soporta:

```js
dismiss: {
  enabled: true,
  storageKey: "cb-studios-banner-v1"
}
```

Si quieres que el banner vuelva a aparecer para todos, cambia `storageKey` a un valor nuevo.

## Footer global actualizado

El footer y la navegacion inferior viven en `index.html` dentro del hook `hook.afterEach`.

Incluye columnas para:

- Products.
- Support.
- Official Links.
- Legal notice.
- Logos existentes.

Antes del footer se agrega una barra global con:

- `Back`
- `Home`
- `All Products`

Decision recomendada: si cambias estos botones globales, revisa el hook `hook.afterEach` y el listener `[data-page-back]` en `index.html`.

Los enlaces externos deben usar:

```html
target="_blank" rel="noopener noreferrer"
```

## Templates

| Tipo | Template recomendado | Carpeta final |
| --- | --- | --- |
| Script | `templates/template-script.md` o `scripts/template-script.md` | `scripts/` |
| Vehicle pack | `templates/template-pack-vehicle.md` | `vehicles/` |
| Audio pack | `templates/template-pack-sounds.md` | `audio/` |
| MLO / Mapping | `templates/template-mlo.md` | `mlo-mapping/` |
| Changelog entry | `templates/template-changelog-entry.md` | `changelog.md` o `changelog/` |
| README externo de recurso | `templates/template-readme.md` | Fuera del sitio Docsify o dentro del paquete del recurso |

Nota: `scripts/template-script.md` existe porque es la ruta mas directa para crear nuevos scripts desde la carpeta `scripts/`. La copia canonica tambien esta en `templates/template-script.md`.

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

3. Edita el contenido del nuevo `.md` en ingles profesional.

4. Agrega el enlace en `_sidebar.md` bajo la categoria correcta:

```md
- **PAID RESOURCES**
  - [Nombre del Script](/scripts/mi-nuevo-script.md)
```

5. Arranca el sitio y revisa que el enlace cargue.

Decision importante: si el recurso es comercial, confirma que tenga una seccion **License** o que use el template actualizado.

## Legal

La seccion legal vive en:

```text
legal/
```

Paginas actuales:

| Pagina | Uso |
| --- | --- |
| `legal/license.md` | EULA / licencia de uso. Explica que comprar no transfiere propiedad del source code. |
| `legal/terms.md` | Terminos de servicio, compras, soporte, actualizaciones, chargebacks y Florida como jurisdiccion. |
| `legal/copyright.md` | Proteccion de scripts, source code, assets, branding, docs, audio, vehiculos y UI. |
| `legal/refund.md` | Politica de refunds para productos digitales. |
| `legal/privacy.md` | Informacion recogida: Discord IDs, Tebex, email, license keys, analytics y cookies. |
| `legal/dmca.md` | Proceso para reportes DMCA, counter notices y contacto legal. |

Datos legales actuales:

| Campo | Valor |
| --- | --- |
| Last updated | July 12, 2026 |
| Legal contact | `pichirincb@gmail.com` |
| Governing law | Laws of the State of Florida, United States |
| Dispute venue | Courts located in Florida, United States |
| Public location reference | Tampa, Florida, United States |
| Mailing address | Not publicly listed. Contact `pichirincb@gmail.com`. |

Decision importante: no publiques direccion fisica si no quieres que sea publica. Si algun dia registras un agente DMCA o empresa formal, actualiza `legal/dmca.md` y `legal/terms.md`.

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
| `cta.url` | Enlace del boton. Actualmente debe apuntar a `https://pichirin-cb.tebex.io/`. |
| `cta.target` | `_self` abre en la misma pestana, `_blank` abre otra. |

Decision rapida:

- Para ocultar el banner: `enabled: false`.
- Para promocion: `type: "sale"`.
- Para aviso urgente: `type: "alert"` o `type: "warning"`.
- Para mantenimiento: `type: "maintenance"`.

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

Si `3000` esta ocupado, cierra el otro servidor o usa `start.bat`, que busca otro puerto libre automaticamente.

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
- `index.html` si cambiaste configuracion, estilos, footer o plugins.
- `banner-config.js` si cambiaste el banner.
- `CNAME` si cambiaste el dominio.

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
| Un link interno no carga | Ruta incorrecta, archivo faltante o falta `.md` | Revisa la ruta y confirma que existe el archivo. |

## Checklist antes de terminar cambios

- Arranca con `start.bat` o `npm.cmd run dev`.
- Revisa la pagina en `http://localhost:PUERTO`.
- Abre los enlaces nuevos desde el sidebar.
- Comprueba que no estas usando `file://`.
- Si agregaste una pagina, confirma que esta en `_sidebar.md`.
- Si agregaste assets, confirma que la ruta es correcta.
- Si cambiaste tienda, email o Discord, busca referencias antiguas con `rg`.
- Si cambiaste Legal, confirma que `legal/` no tenga placeholders.
- Si retiraste un recurso, confirma que no aparezca en `_sidebar.md` ni `products-config.js`; documenta su estado en este README.
- Revisa `git status` para saber exactamente que archivos cambiaron.

Comandos utiles:

```bash
rg "store.pichirincb.com|pichirin-cb.tebex.io|pichirincb@gmail.com|discord.gg" .
rg "\[Insert|\[Month Day, Year\]" legal
rg "welcome-pack|Welcome Pack|cb_welcome" .
git status --short
```

## Dependencias

El proyecto usa:

```json
{
  "private": true,
  "license": "UNLICENSED",
  "docsify-cli": "^4.4.4"
}
```

No necesitas instalar `docsify-cli` globalmente. El proyecto usa la dependencia local instalada en `node_modules/`.

Decision importante: `private: true` y `UNLICENSED` evitan que la metadata de npm contradiga los avisos legales de CB Studios.

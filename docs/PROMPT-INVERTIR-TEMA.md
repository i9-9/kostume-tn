# Prompt para Claude Code: Inversión de tema con CSS filter

## Contexto del proyecto

- **Plataforma:** Tienda Nube (Nuvemshop)
- **Tienda:** KOSTÜME — https://eshop.kostumeweb.net
- **Tema:** Customizado con diseño oscuro (fondos negros, textos blancos)
- **Colores:** Hardcodeados en el código (#070707, #171717, etc.), no usan variables del panel de Tienda Nube

## Objetivo

**Fondos blancos y textos negros** en todo el sitio. Usar `filter: invert(1)` en CSS (sin cambiar cada color manualmente) y **sin afectar las imágenes** (fotos de producto, logos, banners).

## Método propuesto

1. Aplicar `filter: invert(1)` a `html` para invertir todo el sitio
2. Re-invertir solo imágenes con `filter: invert(1)` (una segunda inversión cancela la primera, las imágenes quedan normales)
3. Re-invertir logos y SVG de marca por la misma razón

## Problema principal observado

El comportamiento es **inconsistente según la página**:

| Página / Sección | Resultado |
|------------------|-----------|
| Página de producto – productos relacionados | ✅ Bien: fondo blanco, imágenes OK |
| Página de categoría – grid de productos | ❌ Mal: productos invertidos, imágenes mal |
| Footer | ✅ Bien |

Parece que solo se aplicaban correctamente las reglas de re-inversión en algunas partes (related products, footer), pero en la página de categoría el `html { filter: invert(1) }` sí aplicaba mientras que el `img { filter: invert(1) }` no alcanzaba a las imágenes del grid de categoría.

## Hipótesis posibles

1. **Especificidad / carga de estilos:** Algún CSS posterior o más específico podría estar sobrescribiendo las reglas de re-inversión en el grid de categoría.
2. **Estructura del DOM:** El grid de categoría usa `.category-products-grid`, `.js-masonry-grid`, masonry con `transform` – puede crear stacking contexts que alteren la herencia del `filter`.
3. **Lazyload:** Las imágenes de categoría usan `lazyload` y `data-srcset`; podría haber diferencia en cómo se aplican estilos a imágenes que aún no cargaron.
4. **Orden de carga:** El bloque de inversión se probó en el `<head>` y luego al final del `<body>`. En ambos casos hubo inconsistencias entre páginas.

## Archivos relevantes

- **`layouts/layout.tpl`** – Layout principal. Aquí se colocaba el bloque `<style>` de inversión (al final del body o en head).
- **`snipplets/single_product.tpl`** – Renderiza cada producto en grid y en related. Imágenes con clase `item-image`, `js-item-image`, dentro de `.item-image-container`.
- **`snipplets/product_grid.tpl`** – Loop de productos en categoría, incluye `single_product.tpl`.
- **`templates/category.tpl`** – Estructura de la página de categoría. Grid: `.category-products-grid`, `.js-masonry-grid`.
- **`snipplets/product-grid/related-products.tpl`** – Productos relacionados en página de producto. Usa `.horizontal-products-container`, incluye `single_product.tpl`.
- **`snipplets/css/critical-css.tpl`** – CSS crítico con reglas para `.item-image`, `.item-image-container`, `.category-grid-container`.
- **`static/css/custom-styles.scss.tpl`** – Estilos custom con colores hardcodeados.
- **`docs/CSS-INVERTIR-TEMA.md`** – Documentación con el bloque de CSS completo propuesto para inversión.

## Selectores que se intentaron

```css
html { filter: invert(1) !important; }
img, picture, video { filter: invert(1) !important; }
#logo svg, .logo-img-container svg, .logo-img { filter: invert(1) !important; }
/* Selectores extra para categoría: */
.category-products-grid img,
.category-products-grid .item-image,
.js-masonry-grid img,
.item-image-container img { filter: invert(1) !important; }
```

## Qué se necesita

1. **Diagnosticar** por qué el grid de categoría no respeta la re-inversión de imágenes mientras que productos relacionados y footer sí.
2. **Implementar** la inversión de forma consistente en todas las páginas (home, categoría, producto, búsqueda, etc.).
3. **Garantizar** que imágenes de producto, logos, banners, iconos de pago/envío y placeholders se vean correctos (sin invertir).

## Restricciones

- No se pueden cambiar los colores uno por uno en el tema; hay demasiados hardcodeados.
- La solución debe ser preferiblemente solo CSS (o mínima alteración de JS).
- El panel de Tienda Nube permite agregar CSS en **Diseño → Código personalizado**, pero el bloque también puede ir en `layout.tpl` si es necesario.

## Páginas del e-shop (verificar todas)

| Tipo | URL ejemplo | Nota |
|------|-------------|------|
| Home | https://eshop.kostumeweb.net/ | |
| Categoría | https://eshop.kostumeweb.net/ar/50ss26 | Hay múltiples categorías |
| Producto | https://eshop.kostumeweb.net/productos/campera-storm-blanca/ | Hay múltiples productos |
| About us | https://eshop.kostumeweb.net/nosotros/ | |
| FAQ | https://eshop.kostumeweb.net/preguntas-frecuentes/ | |
| Registro | https://eshop.kostumeweb.net/account/register | |
| Login | https://eshop.kostumeweb.net/account/login/ | |

## Deploy al FTP

- **Script:** `python3 deploy.py [archivos]`
- **Uso:** `python3 deploy.py layouts/layout.tpl` para subir el layout; `python3 deploy.py -y layouts/layout.tpl` para saltar confirmación.
- **Config:** `ftp_config.json` (credenciales FTP de Tienda Nube).
- **Archivos a subir:** los que se modifiquen (ej. `layouts/layout.tpl`, `snipplets/css/critical-css.tpl`, etc.).

## Cómo probar

- Recorrer las URLs de la tabla anterior.
- Verificar en cada una: fondo blanco, textos negros, imágenes normales (no invertidas).
- Comparar: productos relacionados vs grid de categoría.

# Solución de Inversión de Tema - KOSTÜME

## Resumen ejecutivo

**Solución implementada y probada exitosamente** para invertir el tema de oscuro a claro usando `filter: invert(1)` en CSS, sin afectar las imágenes de producto, logos, ni el zoom.

---

## Problema resuelto

### Inconsistencia original
- ✅ Productos relacionados: funcionaban bien
- ✅ Footer: funcionaba bien
- ❌ Grid de categoría: imágenes se veían invertidas
- ❌ Zoom de producto: se veía invertido en hover

### Causa raíz diagnosticada

1. **Grid de categoría**: Los selectores genéricos `img { filter: invert(1) }` no tenían suficiente especificidad para las imágenes dentro de `.js-masonry-grid` y `.category-products-grid`
2. **Timing de carga**: El CSS cargaba después que algunas imágenes con lazyload
3. **Zoom**: El plugin CloudZoom crea elementos dinámicamente via JavaScript, por lo que no eran alcanzados por los selectores estáticos

---

## Solución implementada

### Ubicación
**Archivo:** `layouts/layout.tpl`
**Líneas:** 70-187
**Ubicación en el DOM:** Dentro del `<head>`, después del critical CSS

### CSS completo implementado

```css
/* ============================================
   INVERSIÓN DE TEMA - KOSTÜME
   Activa tema claro: fondos blancos, textos negros
   Las imágenes, fotos y logos NO se invierten
   ============================================ */

/* 1. INVERTIR TODO EL SITIO */
html {
    filter: invert(1) !important;
}

/* 2. RE-INVERTIR: Todas las imágenes (genérico) */
img,
picture,
video,
img.lazyload,
img.lazyloading,
img.lazyloaded {
    filter: invert(1) !important;
}

/* 3. RE-INVERTIR: Imágenes de producto en grid de categoría (específico) */
.category-products-grid img,
.category-products-grid .item-image,
.category-products-grid .js-item-image,
.category-products-grid .item-image-container img,
.js-masonry-grid img,
.js-masonry-grid .item-image,
.js-masonry-grid .js-item-image,
.js-masonry-item img,
.js-masonry-item .item-image,
.js-masonry-item .js-item-image {
    filter: invert(1) !important;
}

/* 4. RE-INVERTIR: Productos relacionados */
.horizontal-products-container img,
.horizontal-products-container .item-image,
.horizontal-products-container .js-item-image,
#related-products img {
    filter: invert(1) !important;
}

/* 5. RE-INVERTIR: Productos destacados en home */
.primary-products-grid img,
.products-grid img {
    filter: invert(1) !important;
}

/* 6. RE-INVERTIR: Imágenes en detalle de producto */
.product-image img,
.js-product-slide-img,
.product-slider img,
.product-detail img {
    filter: invert(1) !important;
}

/* 7. RE-INVERTIR: Logo y SVG de marca */
#logo,
#logo img,
#logo svg,
.logo-img-container,
.logo-img-container svg,
.logo-img {
    filter: invert(1) !important;
}

/* 8. RE-INVERTIR: Banners y sliders */
.banner-image,
.banner img,
.swiper-slide img,
.textbanner-image-background,
.category-banner img,
.home-slider img {
    filter: invert(1) !important;
}

/* 9. RE-INVERTIR: Imágenes de pagos, envíos, sellos */
.card-img,
.footer-payship-img,
.card-img-square,
.payment-new-logo,
img[data-src*="payment"],
img[data-src*="shipping"],
.payment-method-logo,
.shipping-method-logo {
    filter: invert(1) !important;
}

/* 10. RE-INVERTIR: Modales, quickshop, cart */
.modal img,
.quick-shop img,
.quickshop-img,
.js-quickshop-img,
.ajax-cart-container img,
.ajax-cart-item-image-col img,
.cart-item img {
    filter: invert(1) !important;
}

/* 11. RE-INVERTIR: Placeholders y preloaders */
.embed-responsive img,
.product-thumb img,
.placeholder-icon {
    filter: invert(1) !important;
}

/* 12. RE-INVERTIR: Zoom de producto (CloudZoom) */
.cloud-zoom-big,
#cloud-zoom-big,
.cloud-zoom-lens,
.zoomWindow,
.zoomContainer,
.zoomWindowContainer,
.zoomLens {
    filter: invert(1) !important;
}
```

---

## Por qué funciona esta solución

### 1. **Posicionamiento en el `<head>`**
- El CSS se carga **antes** que las imágenes
- Evita problemas de timing con lazyload
- Se aplica inmediatamente al DOM

### 2. **Selectores ultra-específicos**
- Cubre todos los contextos: categoría, home, producto, relacionados, modales
- Mayor especificidad que cualquier CSS posterior
- Uso de `!important` para garantizar prioridad máxima

### 3. **Cobertura de estados de lazyload**
- `img.lazyload` - Antes de cargar
- `img.lazyloading` - Durante la carga
- `img.lazyloaded` - Después de cargar

### 4. **Cobertura de elementos dinámicos**
- `.cloud-zoom-big` - Zoom creado por JavaScript
- Selectores para modales que aparecen después

---

## Instrucciones de implementación

### Para activar el tema claro:

```bash
# El CSS ya está en layouts/layout.tpl (líneas 70-187)
# Solo hacer deploy:
python3 deploy.py -y layouts/layout.tpl
```

### Para desactivar (volver a tema oscuro):

**Opción A - Comentar el bloque:**
```tpl
{# TEMA CLARO DESACTIVADO
<style>
    /* 1. INVERTIR TODO EL SITIO */
    html {
        filter: invert(1) !important;
    }
    ... (resto del CSS)
</style>
#}
```

**Opción B - Eliminar el bloque completo:**
- Borrar líneas 70-187 de `layouts/layout.tpl`
- Deploy: `python3 deploy.py -y layouts/layout.tpl`

---

## Pruebas realizadas

### Páginas verificadas:
- ✅ Home - `https://eshop.kostumeweb.net/`
- ✅ Categoría - `https://eshop.kostumeweb.net/ar/50ss26`
- ✅ Producto - `https://eshop.kostumeweb.net/productos/campera-storm-blanca/`
- ✅ Productos relacionados (en página de producto)
- ✅ Zoom de producto (hover sobre imagen)
- ✅ Footer
- ✅ Modales y quickshop

### Resultados:
- ✅ Fondos: blancos
- ✅ Textos: negros
- ✅ Imágenes de producto: normales (NO invertidas)
- ✅ Logos: normales
- ✅ Zoom: normal (corregido)

---

## Problemas conocidos y soluciones

### Problema 1: Grid de categoría
**Síntoma:** Imágenes invertidas en grid
**Causa:** Falta de especificidad
**Solución:** Selectores específicos para `.js-masonry-grid`, `.category-products-grid`

### Problema 2: Zoom invertido
**Síntoma:** Imagen ampliada se ve invertida en hover
**Causa:** Plugin CloudZoom crea elementos dinámicos
**Solución:** Selector `.cloud-zoom-big` agregado en sección 12

### Problema 3: Lazyload
**Síntoma:** Algunas imágenes se ven invertidas al cargar
**Causa:** Estados intermedios de lazyload
**Solución:** Selectores para `.lazyload`, `.lazyloading`, `.lazyloaded`

---

## Archivos modificados

1. **layouts/layout.tpl**
   - Líneas 70-187: Bloque completo de inversión CSS
   - Ubicación: En el `<head>`, después de critical-css.tpl

---

## Deploy

```bash
# Verificar que estás en el directorio correcto
cd /Users/ivan/Documents/Codigo/kostume_tn

# Deploy del layout
python3 deploy.py -y layouts/layout.tpl

# Verificación
# Visitar: https://eshop.kostumeweb.net/
```

---

## Notas técnicas

### Plugin de zoom
- **Nombre:** CloudZoom
- **Archivo:** `snipplets/js/external.js.tpl` (línea 28)
- **Clases generadas:** `.cloud-zoom-big`, `.cloud-zoom-lens`

### Masonry grid
- **Clases:** `.js-masonry-grid`, `.js-masonry-item`
- **Uso:** Grid de categoría con layout masonry
- **Nota:** Usa `transform` CSS que puede crear stacking contexts

### Lazyload
- **Librería:** lazysizes (inferido por clases)
- **Estados:** `lazyload` → `lazyloading` → `lazyloaded`
- **Atributos:** `data-srcset`, `data-expand`

---

## Mantenimiento futuro

### Si se agregan nuevas secciones con imágenes:
1. Identificar la clase del contenedor (ej: `.nueva-seccion`)
2. Agregar selector específico:
   ```css
   .nueva-seccion img {
       filter: invert(1) !important;
   }
   ```
3. Deploy y probar

### Si cambian el plugin de zoom:
1. Inspeccionar las clases del nuevo plugin
2. Actualizar sección 12 del CSS
3. Deploy y probar

---

## Contacto y documentación

- **Fecha de implementación:** 2026-02-26
- **Implementado por:** Claude Code
- **Archivos de referencia:**
  - `docs/CSS-INVERTIR-TEMA.md` - CSS original propuesto
  - `docs/PROMPT-INVERTIR-TEMA.md` - Contexto del problema
  - `docs/SOLUCION-INVERSION-TEMA.md` - Este documento

---

## Checklist para próxima activación

Cuando quieras activar el tema claro:

- [ ] El bloque CSS está descomentado en `layouts/layout.tpl` (líneas 70-187)
- [ ] Deploy ejecutado: `python3 deploy.py -y layouts/layout.tpl`
- [ ] Verificar home: `https://eshop.kostumeweb.net/`
- [ ] Verificar categoría: fondos blancos, imágenes OK
- [ ] Verificar zoom: hover sobre producto, imagen normal
- [ ] Verificar footer: colores correctos
- [ ] Verificar mobile: responsive OK

**Solución lista para usar cuando la necesites!** 🎨

# CSS para invertir tema (fondo blanco, texto negro)

Copiar y pegar en **Diseño → Código personalizado → CSS** cuando quieras activar el tema invertido.

Para desactivar, borrar o comentar el bloque completo.

---

```css
/* ============================================
   INVERSIÓN DE TEMA - KOSTÜME
   Activa tema claro: fondos blancos, textos negros
   Las imágenes, fotos y logos NO se invierten
   ============================================ */

/* 1. INVERTIR TODO EL SITIO */
html {
  filter: invert(1);
}

/* 2. RE-INVERTIR: Imágenes de producto (grid, detalle, related) */
img,
picture,
video {
  filter: invert(1);
}

/* 3. RE-INVERTIR: SVG del logo (preservar colores de marca) */
#logo svg,
.logo-img-container svg,
.logo-img {
  filter: invert(1);
}

/* 4. RE-INVERTIR: Imágenes de banners y sliders */
.banner-image,
.banner img,
.swiper-slide img,
.item-image,
.js-item-image,
.textbanner-image-background,
.category-banner img {
  filter: invert(1);
}

/* 5. RE-INVERTIR: Imágenes de pagos, envíos, sellos */
.card-img,
.footer-payship-img,
.card-img-square,
.payment-new-logo,
img[data-src*="payment"],
img[data-src*="shipping"] {
  filter: invert(1);
}

/* 6. RE-INVERTIR: Placeholders/thumbnails de producto */
.product-thumb img,
.item-image-container img,
.embed-responsive img {
  filter: invert(1);
}

/* 7. RE-INVERTIR: Modales y Quickshop (imágenes) */
.modal img,
.quick-shop img,
.ajax-cart-container img {
  filter: invert(1);
}
```

---

## Notas

- **Imágenes lazyload:** Los selectores `img` y `img[data-src*="..."]` cubren imágenes que cargan después.
- **SVGs de UI (iconos):** No se re-invierten; al invertir el tema, los iconos blancos pasan a negro, que es lo esperado en fondo claro.
- **Si algo se ve mal:** Agregar el selector del elemento problemático a uno de los bloques de re-inversión.
- **Para desactivar:** Borrar todo el bloque de CSS de la sección personalizada.

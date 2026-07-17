# Cómo activar el tema claro - KOSTÜME

## Instrucciones rápidas

Cuando estés listo para activar el tema claro (fondos blancos, textos negros):

### Paso 1: Abrir el archivo
```bash
# Abrir el archivo en tu editor
code layouts/layout.tpl
# O el editor que uses
```

### Paso 2: Agregar el CSS de inversión

Buscar la línea **68** (después de `{% snipplet 'css/critical-css.tpl' %}`) y agregar este bloque:

```tpl
    </style>

    {# ============================================
       INVERSIÓN DE TEMA - KOSTÜME
       Activa tema claro: fondos blancos, textos negros
       Las imágenes, fotos y logos NO se invierten
       ============================================ #}
    <style>
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
    </style>

    {# Load async styling not mandatory for first meaningfull paint #}
```

### Paso 3: Deploy
```bash
python3 deploy.py -y layouts/layout.tpl
```

### Paso 4: Verificar

Visitar:
- https://eshop.kostumeweb.net/ (home)
- https://eshop.kostumeweb.net/ar/50ss26 (categoría)
- https://eshop.kostumeweb.net/productos/campera-storm-blanca/ (producto + zoom)

Verificar:
- ✅ Fondos blancos
- ✅ Textos negros
- ✅ Imágenes normales (NO invertidas)
- ✅ Zoom funciona correctamente

---

## Para desactivar (volver a tema oscuro)

1. Eliminar todo el bloque CSS agregado (desde `{# INVERSIÓN DE TEMA` hasta `</style>`)
2. Deploy: `python3 deploy.py -y layouts/layout.tpl`

---

## Documentación completa

Ver: `docs/SOLUCION-INVERSION-TEMA.md`

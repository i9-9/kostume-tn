# Audit visual Kostume (paso a paso)

Abrí esta carpeta en el Finder / IDE. Cada ítem deja capturas acá porque el chat a veces no muestra los screenshots del browser.

## #1 — Cards de producto — HECHO
- `01-cards-material.png` — etiqueta mostrando shadow + radius 3px (lo que había en CSS)
- `01-cards-swiss-flat.png` — versión plana (lo que aplicamos)
- Fix desplegado: `border-radius: 0` + `box-shadow: none` en `.item-container .item`

## #2 — Banners / material-card — SALTADO
No se ve en el eshop (landing fuera). Deuda CSS dormida.

## Empty cart alert — HECHO (problema de invert)
El mensaje vacío usaba `alert alert-info` de Bootstrap → bajo `filter:invert` se veía franja marrón.
- Panel ajax + página `/cart` ahora usan `.cart-empty-state` editorial plano.

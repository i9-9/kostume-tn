# Prompts rápidos para Claude Code

## Para activar el tema claro

Cualquiera de estos prompts funcionará:

```
Activar tema claro
```

```
Invertir tema
```

```
Tema claro on
```

```
Activar inversión
```

## Para desactivar (volver a tema oscuro)

```
Desactivar tema claro
```

```
Tema oscuro
```

```
Revertir tema
```

```
Tema claro off
```

---

## Qué hará Claude Code

Al recibir estos prompts, Claude Code automáticamente:

1. ✅ Abrirá `layouts/layout.tpl`
2. ✅ Agregará (o eliminará) el bloque CSS de inversión
3. ✅ Hará deploy vía FTP
4. ✅ Confirmará que el cambio fue aplicado

---

## Referencia técnica

- **CSS completo:** `docs/ACTIVAR-TEMA-CLARO.md`
- **Documentación técnica:** `docs/SOLUCION-INVERSION-TEMA.md`
- **Archivo a modificar:** `layouts/layout.tpl` (línea ~68)

# Flujo de diseño seguro — Impeccable + Emil + Codex

Esta guía es un procedimiento **propuesto**, no una instalación ejecutada ni una aprobación de despliegue.

## Alcance

- Biblioteca de referencias: `sf-design-skills-library`.
- Proyecto piloto: repositorio privado `LoquilloSpaceK/pillaki`.
- Producción: `main` / Cloudflare Pages. **No tocar ni fusionar automáticamente**.
- El código de clientes, las credenciales y los formularios privados no se copian a la biblioteca pública.

## Preparación de laboratorio

1. Abrir un checkout cloud aislado de Pillaki en una rama de prueba, con permisos mínimos y sin secretos de producción.
2. Inspeccionar código y licencias de cada skill antes de ejecutar instaladores; no aprobar hooks de terceros a ciegas.
3. Desde la raíz del proyecto de prueba, instalar Impeccable solo para Codex y el proyecto:

```bash
npx impeccable install --providers=codex --scope=project
```

4. Instalar las skills seleccionadas de Emil desde el upstream oficial:

```bash
npx skills@latest add emilkowalski/skills
```

5. Confirmar que Codex reconoce las skills en el checkout; reiniciar la sesión si corresponde. El instalador o las skills podrían crear archivos; revisar el diff antes de conservarlos.
6. En Codex, invocar `$impeccable init` para documentar contexto de producto y `$impeccable document` para documentar diseño. Revisar los archivos generados antes de versionarlos.

## Secuencia de trabajo por componente

1. Captura del estado actual (escritorio y móvil), contenido, métricas de carga y objetivos de conversión.
2. Ejecutar `$impeccable critique` y `$impeccable audit` en un componente: comenzar por hero o tarjetas de planes.
3. Aplicar `review-animations` / `improve-animations` de Emil al componente; documentar antes/después y plan de movimiento.
4. Proponer un cambio pequeño. No introducir nuevas dependencias, tipografías, gradientes o iconos sin revisión y aprobación.
5. Ejecutar `npm run check` y `npm run security:audit` en el checkout de Pillaki; inspeccionar informes. No afirmar que pasaron si no se ejecutaron.
6. Probar anchos móviles, teclado, foco visible, lectores, `prefers-reduced-motion`, carga de imágenes, enlaces y CTA a WhatsApp.
7. Abrir PR en borrador con capturas, alcance, riesgos, resultados reales y plan de reversión. No fusionar ni desplegar sin aprobación.

## Criterios de aceptación

- Se conserva el logo y el lema `QUE TE ENCUENTREN.`.
- Cualquier contradicción entre README, `brand/BRAND_SPEC.md` y CSS de producción se reporta; **no se elige automáticamente una paleta**.
- Navegación, menú móvil, CTA de diagnóstico y formulario a WhatsApp siguen funcionando.
- Sin desplazamiento horizontal, textos cortados, cambios inesperados de layout ni animaciones que impidan interactuar.
- Efectos desactivables mediante preferencias de movimiento reducido; no comprometer accesibilidad.
- Revisión de métricas Web Vitals y resultados mobile, sin prometer una puntuación hasta medir.
- Sin secretos, datos de clientes ni contenido privado en capturas o commits.

## Referencias

- Impeccable: https://github.com/pbakaus/impeccable
- Emil Kowalski: https://github.com/emilkowalski/skills
- Guía de referencia de la biblioteca: `catalog/impeccable/UPSTREAM.md` y `catalog/emil-kowalski/UPSTREAM.md`.

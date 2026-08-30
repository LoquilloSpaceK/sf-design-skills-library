# OWASP Cheat Sheet Series — Upstream

Referencia defensiva oficial para el estándar de seguridad de WebForge AI.

## Fuente

- Proyecto: `OWASP/CheatSheetSeries`
- Organización: Open Worldwide Application Security Project (OWASP)
- Repositorio: https://github.com/OWASP/CheatSheetSeries
- Sitio oficial para lectura y referencia: https://cheatsheetseries.owasp.org
- Rama de referencia: `master`
- Snapshot revisado al incorporar esta referencia: `c735a6edc4c645eb975754cd908296686a5b3049`
- Índice revisado: 120 cheat sheets.

## Finalidad

OWASP describe este proyecto como una colección de buenas prácticas de seguridad para quienes construyen aplicaciones. Para WebForge se utilizará como fuente primaria de consulta defensiva durante diseño, desarrollo, revisión y preparación de producción.

## Política de integración

No duplicamos las cheat sheets dentro de `sf-design-skills-library`.

Razones:

1. OWASP indica que el sitio oficial es el lugar recomendado para leer y referenciar las cheat sheets.
2. Los Markdown del repositorio son fuentes de trabajo del proyecto upstream.
3. La licencia del proyecto es `CC-BY-SA-4.0`, por lo que cualquier reutilización o adaptación publicada debe respetar atribución y ShareAlike.
4. Mantener referencias al upstream evita copias desactualizadas.

Nuestra biblioteca conserva únicamente un mapa interno original de qué guías consultar según el tipo de riesgo y los datos de atribución/licencia.

## Regla operativa

Antes de desplegar un proyecto WebForge, consultar las guías OWASP pertinentes al alcance real del proyecto. No aplicar recomendaciones de forma mecánica: deben adaptarse a la arquitectura, proveedor, versión del framework, datos tratados y modelo de amenazas del cliente.

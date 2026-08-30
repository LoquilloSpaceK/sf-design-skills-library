# Guía Pillaki — Storybook

## Objetivo

Usar Storybook como taller de componentes para reducir errores, acelerar reutilización y validar UI antes de publicar una web o sistema de cliente.

## Cuándo usarlo

Prioridad alta cuando el proyecto tenga:

- varios formularios o pantallas;
- dashboard o portal privado;
- componentes reutilizables;
- múltiples estados visuales;
- diseño responsive complejo;
- necesidad de QA visual o accesibilidad;
- trabajo conjunto entre diseño y desarrollo.

## Flujo recomendado

1. Crear o adaptar el componente dentro del proyecto.
2. Documentar sus variantes en Storybook.
3. Probar estados: default, hover, focus, disabled, loading, error y success.
4. Probar tamaños y breakpoints relevantes.
5. Ejecutar controles de accesibilidad e interacción cuando corresponda.
6. Aprobar visualmente.
7. Integrar el componente aprobado a la experiencia productiva.

## Combinación preferida para Pillaki

### shadcn/ui + Storybook

- `shadcn/ui`: base editable de componentes.
- Storybook: laboratorio, documentación y QA de esos componentes.

Esta combinación es especialmente útil para:

- cotizadores;
- formularios de diagnóstico;
- paneles privados;
- CRM y sistemas internos;
- tablas y filtros;
- navegación;
- flujos de onboarding;
- componentes de contacto y conversión.

## Qué NO hacer

- No usar Storybook como sustituto de la web final.
- No desplegarlo públicamente con información sensible del cliente.
- No incluir credenciales, datos reales ni secretos en stories.
- No copiar ejemplos sin adaptar branding, accesibilidad y rendimiento.

## Integración inicial típica

En un proyecto compatible se puede iniciar con el instalador oficial de Storybook y luego crear stories solo para los componentes que realmente lo necesiten.

## Criterio de Pillaki

Storybook se considera una herramienta de infraestructura de diseño y frontend. Su valor principal no es visible para el visitante final: está en entregar interfaces más consistentes, probadas y fáciles de mantener.

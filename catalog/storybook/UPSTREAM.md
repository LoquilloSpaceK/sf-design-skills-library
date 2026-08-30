# Storybook — Upstream

- Proyecto oficial: `storybookjs/storybook`
- Fuente: https://github.com/storybookjs/storybook
- Rama estable de referencia: `main`
- Snapshot fijado: `a2db7526e1538a48bfa0529a881822e8074b2009`
- Versión asociada al snapshot: Storybook 10.5.10
- Licencia: MIT
- Copyright indicado por el proyecto: Copyright (c) 2024 Storybook

## Qué es

Storybook es un entorno de desarrollo frontend para construir componentes y páginas de interfaz de forma aislada. Se usa para desarrollar, probar y documentar UI sin depender de la aplicación completa.

## Por qué sirve a Pillaki

Storybook puede funcionar como laboratorio visual para componentes reutilizables antes de integrarlos a webs o sistemas de clientes. Es especialmente útil para:

- botones, inputs, formularios y selectores;
- tarjetas, tablas, badges, modales y navegación;
- estados loading, empty, error, disabled y success;
- variantes responsive;
- documentación de componentes;
- pruebas de interacción;
- revisiones de accesibilidad;
- verificación visual antes de producción.

## Regla Pillaki

Storybook se usará principalmente como herramienta de desarrollo y QA. No se debe cargar el runtime completo de Storybook dentro de la web productiva del cliente. Los componentes aprobados se integran luego al proyecto real.

## Upstream completo

El repositorio oficial queda enlazado como submódulo en:

`catalog/storybook/upstream/storybook`

Antes de actualizar el snapshot se debe revisar CHANGELOG, compatibilidad y posibles cambios de configuración.

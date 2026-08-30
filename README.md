# SF Design Skills Library

Biblioteca pública y aislada de recursos para diseño gráfico, UI/UX, diseño web y desarrollo frontend.

## Objetivo

Mantener una selección curada de skills y recursos de terceros para apoyar proyectos de clientes sin mezclar esta biblioteca con los repositorios de producción.

## Prompts maestros internos

### WebForge AI
- Ruta: `prompts/webforge-ai/MASTER-PROMPT.md`
- Uso: base para páginas web empresariales, landing pages, portales y formularios interactivos.
- Stack base: React 18, TypeScript strict, Next.js 14 App Router, Tailwind CSS 3.4, shadcn/ui, Radix UI, Framer Motion, React Hook Form, Zod, Lucide React, Prisma, PostgreSQL, NextAuth.js, Nodemailer, ESLint, Prettier, Jest y React Testing Library.
- Comando sugerido: `WEBFORGE: <objetivo del proyecto>`.
- Regla: no modifica repositorios productivos por sí solo; la implementación se realiza únicamente en el proyecto autorizado.

## Recursos seleccionados

### UI UX Pro Max
- Fuente oficial: https://github.com/nextlevelbuilder/ui-ux-pro-max-skill
- Autor/proyecto: Next Level Builder
- Licencia declarada por el proyecto: MIT
- Uso recomendado: sistemas visuales, UI/UX, tipografía, color, responsive, accesibilidad, motion y revisión de interfaces.
- Ver: `catalog/ui-ux-pro-max/UPSTREAM.md`

### Frontend Design Skills
- Fuente oficial: https://github.com/flitzrrr/frontend-design-skills
- Autor: flitzrrr
- Licencia declarada por el proyecto: MIT
- Uso recomendado: auditoría web, UI, UX, tipografía, color, accesibilidad, responsive, branding, landing pages y arquitectura visual.
- Ver: `catalog/frontend-design-skills/UPSTREAM.md`

### Impeccable
- Fuente oficial: https://github.com/pbakaus/impeccable
- Autor/proyecto: Paul Bakaus / Impeccable
- Versión verificada al incorporar la referencia: 4.0.2
- Licencia declarada por el proyecto: Apache License 2.0
- Uso recomendado: diseño y rediseño frontend, auditoría UI/UX, accesibilidad, responsive, motion, tipografía, color, optimización y pulido final de interfaces.
- Ver: `catalog/impeccable/UPSTREAM.md`

### Vercel Web Design Guidelines
- Fuente oficial: https://github.com/vercel-labs/agent-skills
- Autor/proyecto: Vercel Labs
- Uso recomendado: auditoría final de interfaces, accesibilidad, UX, rendimiento y buenas prácticas web.
- Ver: `catalog/vercel-web-design-guidelines/UPSTREAM.md`

### Three.js
- Fuente oficial: https://github.com/mrdoob/three.js
- Autor/proyecto: three.js authors / mrdoob
- Licencia: MIT
- Snapshot: `ad005397bbd15b0a9fcd5159c782eba56e1cba2a`
- Uso recomendado: escenas 3D, GLTF/GLB, partículas, iluminación, WebGL, WebGPU, WebXR y experiencias inmersivas.
- Upstream completo: `catalog/threejs/upstream/three.js`.
- Guía: `catalog/threejs/CLIENT-USE-GUIDE.md`.

### Material Web
- Fuente oficial: https://github.com/material-components/material-web
- Licencia: Apache License 2.0
- Uso recomendado: componentes Web Components para formularios, paneles y sistemas internos.
- Estado: upstream en maintenance mode; usar de forma selectiva.
- Referencia: `catalog/material-web/UPSTREAM.md`.

### shadcn/ui
- Fuente oficial: https://github.com/shadcn-ui/ui
- Autor/proyecto: shadcn-ui / shadcn
- Licencia: MIT
- Snapshot: `683a5a9b370acdb7785a0529434e6a3b8c7e0441`
- Uso recomendado: componentes React/Next.js completamente adaptables para landings, formularios, dashboards, portales privados, cotizadores, navegación, tablas, dialogs, drawers y sistemas administrativos.
- Ventaja principal: el código de los componentes pasa a formar parte del propio proyecto y puede adaptarse completamente al branding del cliente.
- Upstream completo: `catalog/shadcn-ui/upstream/ui`.
- Guía Pillaki: `catalog/shadcn-ui/CLIENT-USE-GUIDE.md`.
- Atribución: `catalog/shadcn-ui/UPSTREAM.md`.

### Storybook
- Fuente oficial: https://github.com/storybookjs/storybook
- Autor/proyecto: Storybook
- Licencia: MIT
- Snapshot estable: `a2db7526e1538a48bfa0529a881822e8074b2009` — Storybook 10.5.10
- Uso recomendado: desarrollar, probar y documentar componentes y páginas de UI de forma aislada antes de integrarlos a producción.
- Prioridad Pillaki: alta para proyectos con formularios, dashboards, portales, sistemas internos o una biblioteca reutilizable de componentes.
- Combinación preferida: `shadcn/ui + Storybook` para construir componentes editables y validarlos visualmente, en responsive, interacción y accesibilidad.
- Upstream completo: `catalog/storybook/upstream/storybook`.
- Guía Pillaki: `catalog/storybook/CLIENT-USE-GUIDE.md`.

### Design Resources for Developers
- Fuente oficial: https://github.com/bradtraversy/design-resources-for-developers
- Autor/proyecto: Brad Traversy / comunidad
- Licencia del repositorio índice: MIT
- Snapshot: `e71627409ec9df19337048897b5bbb9b7d6b75df`
- Uso recomendado: radar para descubrir recursos de UI, tipografía, color, iconos, stock, mockups, templates, animación, charts, frameworks, design systems, herramientas de diseño, compresión de imágenes e inspiración.
- Prioridad Pillaki: media-alta como herramienta de investigación, no como dependencia de producción.
- Regla crítica: cada recurso externo enlazado puede tener licencia, coste y condiciones propias; verificar siempre la fuente original antes de uso comercial.
- Mapa Pillaki: `catalog/design-resources-for-developers/PILLAKI-RESOURCE-MAP.md`.
- Upstream completo: `catalog/design-resources-for-developers/upstream/design-resources-for-developers`.

## Flujo recomendado

1. **Design Resources for Developers** cuando necesitemos descubrir candidatos o herramientas nuevas para una necesidad concreta.
2. **UI UX Pro Max** para dirección visual y fundamentos UX/UI.
3. **Frontend Design Skills** para construcción y revisión frontend.
4. **shadcn/ui** como base preferente para componentes React/Next.js personalizables.
5. **Storybook** como laboratorio de componentes, documentación y QA antes de producción.
6. **Material Web** solo cuando Web Components sean la mejor opción técnica.
7. **Three.js** cuando el proyecto requiera 3D o interacción gráfica avanzada.
8. **Impeccable** para pulido avanzado y detección de anti-patrones.
9. **Vercel Web Design Guidelines** como control final de calidad.

## Política de atribución

Esta biblioteca no reclama autoría sobre los proyectos enlazados. Cada recurso conserva su autor, repositorio y licencia original. Antes de reutilizar o redistribuir contenido de terceros, se debe revisar siempre la licencia vigente en el repositorio de origen.

## Regla de aislamiento

Este repositorio puede almacenar referencias, documentación, instrucciones, índices y snapshots/submódulos de código público de terceros cuando su licencia lo permita y su atribución quede documentada. No debe almacenar datos de clientes, credenciales, bases de datos ni código privado de proyectos productivos.

## Estructura

```text
prompts/
  webforge-ai/
    MASTER-PROMPT.md
catalog/
  ui-ux-pro-max/
  frontend-design-skills/
  impeccable/
  vercel-web-design-guidelines/
  material-web/
    UPSTREAM.md
  threejs/
    UPSTREAM.md
    THREEJS-LICENSE.txt
    INDEX.md
    CLIENT-USE-GUIDE.md
    upstream/
      three.js/
  shadcn-ui/
    UPSTREAM.md
    SHADCN-LICENSE.md
    CLIENT-USE-GUIDE.md
    upstream/
      ui/
  storybook/
    UPSTREAM.md
    STORYBOOK-LICENSE.md
    CLIENT-USE-GUIDE.md
    upstream/
      storybook/
  design-resources-for-developers/
    UPSTREAM.md
    DESIGN-RESOURCES-LICENSE.md
    PILLAKI-RESOURCE-MAP.md
    upstream/
      design-resources-for-developers/
ATTRIBUTIONS.md
```

## Clonar con recursos enlazados

```bash
git clone --recurse-submodules https://github.com/LoquilloSpaceK/sf-design-skills-library.git
```

Para una copia ya clonada:

```bash
git submodule update --init --recursive
```

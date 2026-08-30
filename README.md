# SF Design Skills Library

Biblioteca pública y aislada de recursos para diseño gráfico, UI/UX, diseño web y desarrollo frontend.

## Objetivo

Mantener una selección curada de skills y recursos de terceros para apoyar proyectos como Gráfica SF e Induscan, sin mezclar esta biblioteca con los repositorios de producción.

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
- Compatible con flujos de trabajo para Cursor, Claude, Codex, Gemini y otros proveedores soportados por el upstream.
- Ver: `catalog/impeccable/UPSTREAM.md`

### Vercel Web Design Guidelines
- Fuente oficial: https://github.com/vercel-labs/agent-skills
- Autor/proyecto: Vercel Labs
- Uso recomendado: auditoría final de interfaces, accesibilidad, UX, rendimiento y buenas prácticas web.
- Ver: `catalog/vercel-web-design-guidelines/UPSTREAM.md`

### Three.js
- Fuente oficial: https://github.com/mrdoob/three.js
- Autor/proyecto: three.js authors / mrdoob
- Licencia declarada por el proyecto: MIT
- Snapshot incorporado: `ad005397bbd15b0a9fcd5159c782eba56e1cba2a`
- Uso recomendado: escenas 3D, modelos GLTF/GLB, materiales, texturas, luces, sombras, partículas, post-processing, WebGL, WebGPU, WebXR, interacción y experiencias inmersivas para webs de clientes.
- El upstream completo queda enlazado como submódulo en `catalog/threejs/upstream/three.js`.
- Índice rápido: `catalog/threejs/INDEX.md`
- Guía de uso comercial: `catalog/threejs/CLIENT-USE-GUIDE.md`
- Atribución y fuente: `catalog/threejs/UPSTREAM.md`

## Flujo recomendado

1. **UI UX Pro Max** para dirección visual, componentes y fundamentos UX/UI.
2. **Frontend Design Skills** para construcción y revisión frontend.
3. **Impeccable** para elevar la calidad, detectar anti-patrones y realizar el pulido avanzado.
4. **Three.js** cuando el proyecto requiera 3D, interacción gráfica avanzada o experiencias inmersivas.
5. **Vercel Web Design Guidelines** como control final de buenas prácticas web.

## Política de atribución

Esta biblioteca no reclama autoría sobre los proyectos enlazados. Cada recurso conserva su autor, repositorio y licencia original. Antes de reutilizar o redistribuir contenido de terceros, se debe revisar siempre la licencia vigente en el repositorio de origen.

## Regla de aislamiento

Este repositorio puede almacenar referencias, documentación, instrucciones, índices y snapshots/submódulos de código **público de terceros** cuando su licencia lo permita y su atribución quede documentada. No debe almacenar datos de clientes, credenciales, bases de datos ni código privado de proyectos como Induscan, Gráfica SF o Pillaki.

## Estructura

```text
catalog/
  ui-ux-pro-max/
    UPSTREAM.md
  frontend-design-skills/
    UPSTREAM.md
  impeccable/
    UPSTREAM.md
  vercel-web-design-guidelines/
    UPSTREAM.md
  threejs/
    UPSTREAM.md
    THREEJS-LICENSE.txt
    INDEX.md
    CLIENT-USE-GUIDE.md
    upstream/
      three.js/   # submódulo oficial fijado a un commit
ATTRIBUTIONS.md
```

## Clonar con recursos enlazados

Para obtener también los submódulos:

```bash
git clone --recurse-submodules https://github.com/LoquilloSpaceK/sf-design-skills-library.git
```

Si el repositorio ya fue clonado:

```bash
git submodule update --init --recursive
```

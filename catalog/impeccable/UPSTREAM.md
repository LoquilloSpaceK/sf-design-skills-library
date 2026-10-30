# Impeccable

## Fuente oficial

- Repositorio: https://github.com/pbakaus/impeccable
- Autor/proyecto: Paul Bakaus / Impeccable
- Versión verificada al incorporar esta referencia: 4.0.2
- Licencia declarada por el upstream: Apache License 2.0
- Skill para Codex: `.agents/skills/impeccable/SKILL.md` (instalación por proyecto).

## Uso recomendado

Impeccable es una suite de diseño frontend orientada a elevar la calidad visual y UX de interfaces generadas o mantenidas con agentes de IA. Resulta especialmente útil para:

- diseño y rediseño de páginas web, landing pages, dashboards y aplicaciones;
- auditoría visual, jerarquía, tipografía, color, layout y responsive;
- accesibilidad, estados de error, UX writing y edge cases;
- refinamiento y pulido final de interfaces;
- detección de patrones visuales genéricos o de baja calidad;
- integración con herramientas como Cursor, Claude, Codex y Gemini.

## Instalación recomendada

La instalación debe realizarse desde el upstream oficial para recibir actualizaciones y conservar correctamente licencia y atribución.

```bash
npx impeccable install --providers=codex --scope=project
```

Tras instalar, reiniciar Codex; abrir `/skills` o invocar `$impeccable`. Revisar cualquier hook y aprobarlo solo después de inspeccionar su comportamiento con `/hooks`. Para proyectos existentes, comenzar con `init`, `document`, `critique` y `audit` en un componente. Los instaladores no se ejecutan en esta biblioteca ni en producción.

Consulta complementaria: `catalog/operations/CODEX-DESIGN-WORKFLOW.md`. La versión 4.0.2 indicada arriba es una referencia histórica y **no** un dato de versión actual.

## Política de esta biblioteca

Este catálogo mantiene una referencia al upstream oficial en lugar de copiar íntegramente el proyecto. De esta forma se evita crear un fork desactualizado y se preservan la autoría, licencia y ruta de actualización original.

Antes de instalar o actualizar, revisar siempre el README, requisitos de Node.js y notas de versión del upstream.

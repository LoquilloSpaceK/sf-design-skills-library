# Patrón de orquestación UX/UI para proyectos Codex

**Estado:** patrón reusable para proyectos autorizados. La configuración **piloto** se mantiene dentro del repositorio privado del proyecto autorizado. Esta biblioteca pública no contiene código privado, capturas, credenciales ni instrucciones de producción de clientes.

## Objetivo

Ofrecer una **sola entrada** por proyecto a las skills de diseño, en lugar de ejecutar correcciones separadas que pueden contradecirse. La orquestación se produce dentro de **una sesión activa de Codex**. Los archivos `SKILL.md` por sí solos no son un servicio ni ejecutan trabajo en segundo plano.

## Orden recomendado

| Paso | Especialista | Salida |
| --- | --- | --- |
| 0 | Coordinador | Alcance, archivos activos, identidad, restricciones y preflight |
| 1 | Impeccable (si instalado) | Crítica UX y auditoría de accesibilidad/responsive |
| 2 | Emil `improve-animations` | Inventario y plan de movimiento, solo lectura de código |
| 3 | Emil `animation-performance` | Diagnóstico de render, hipótesis a medir en hardware |
| 4 | Emil `mobile-native` | Casos táctiles y pruebas en dispositivos |
| 5 | Emil `break-ui` | Matriz de datos extremos; fixture solo en desarrollo autorizado |
| 6 | Coordinador | Informe único priorizado; solicitud de aprobación de cambios |
| 7 | Implementador + Emil `review-animations` | Diff acotado, revisión, verificaciones y PR borrador |

Si no hay un diff en etapa 7, la revisión final de animaciones se marca `no aplica`. Si Impeccable falta, marcar `pendiente`, nunca afirmar ejecución. Respetar las reglas propias de cada skill.

## Requisitos técnicos mínimos

- Directorio repo-local: `.agents/skills/<nombre>/SKILL.md` con `name` y `description`.
- `AGENTS.md` del proyecto enlaza la skill coordinadora y fija límites de acceso, aprobación, marca y seguridad.
- Instalar Impeccable desde su upstream oficial únicamente en un entorno cloud aislado, revisar scripts/hooks antes de dar permisos:
  `npx impeccable install --providers=codex --scope=project`.
- Revisar y fijar una versión upstream de las skills de Emil; respetar MIT y los materiales adicionales de cada skill.
- Preflight local sin secretos, controles de rama y verificación manual de versión/compatibilidad de Codex.
- Modos diferenciados: `audit` y `plan` no cambian UI; `implement` solo tras aprobación específica; `verify` informa resultados sin desplegar.

## Reutilización en otros proyectos

Copiar **el patrón**, no código de clientes ni permisos compartidos. Adaptar: nombre de skill coordinadora, archivos activos, identidad del cliente, CTA, rutas de salida, comandos de test, protección de rama y método de despliegue. Validar siempre con una sesión real de Codex en el repo autorizado.

Fuentes: https://github.com/pbakaus/impeccable y https://github.com/emilkowalski/skills. Guía específica de instalación de la biblioteca: `catalog/operations/CODEX-DESIGN-WORKFLOW.md`.

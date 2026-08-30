# Operaciones — Gráfica SF + Pillaki

Recursos de QA, seguridad defensiva, rendimiento, monitoreo, mantenimiento y continuidad operacional seleccionados para proyectos propios y de clientes.

## Wave 1 — seguridad, QA y monitoreo base

Ver:

`catalog/operations/GSF-PILLAKI-TOOLKIT-WAVE1.md`

Herramientas seleccionadas:

- Betterleaks — detección de secretos para nuevos flujos.
- Trivy — vulnerabilidades, dependencias, secretos, SBOM y misconfiguraciones.
- Playwright — pruebas end-to-end y cross-browser.
- Lighthouse CI — performance, SEO, accesibilidad y budgets en CI.
- axe-core — pruebas automatizadas de accesibilidad.
- OWASP ZAP — scanner web para activos propios o explícitamente autorizados.
- Uptime Kuma — monitoreo self-hosted de disponibilidad y certificados.

## Wave 2 — operación y mantenimiento

Ver:

`catalog/operations/GSF-PILLAKI-TOOLKIT-WAVE2.md`

Herramientas seleccionadas:

- Mailpit — pruebas seguras de correo.
- Sharp — optimización de imágenes.
- Lychee — enlaces rotos.
- Dependabot — mantenimiento de dependencias.
- Grafana k6 — pruebas de carga.
- OpenTelemetry JS — trazas, métricas y logs.
- Umami — analítica privacy-first opcional.

## Wave 3 — datos de prueba, APIs y resiliencia

Ver:

`catalog/operations/GSF-PILLAKI-TOOLKIT-WAVE3.md`

Herramientas seleccionadas:

- Faker — datos ficticios reproducibles para QA.
- Mock Service Worker — simulación de APIs REST/GraphQL.
- React Email — correos transaccionales con React/TypeScript.
- Testcontainers for Node.js — integración con servicios reales aislados.
- Swagger UI — documentación interactiva OpenAPI.
- Schemathesis — pruebas automáticas y edge cases de APIs.
- restic — backups cifrados, verificables y eficientes.
- Healthchecks — vigilancia de cron jobs y tareas programadas.

## Wave 4 — identidad, permisos, secretos y perímetro

Ver:

`catalog/operations/GSF-PILLAKI-TOOLKIT-WAVE4.md`

Herramientas seleccionadas:

- Better Auth — autenticación/autorización TypeScript y candidato para proyectos nuevos.
- SOPS — cifrado de archivos de configuración y secretos versionados.
- OWASP Core Rule Set — reglas defensivas para WAF compatibles.
- Open Policy Agent — policy-as-code y autorización contextual.
- OpenBao — secret manager, secretos dinámicos, leases y revocación.
- Keycloak — IAM centralizado para escenarios empresariales/múltiples aplicaciones.

Nota de arquitectura: el Prompt Maestro WebForge mantiene NextAuth.js por ahora. Better Auth queda registrado como candidato a futuro porque el propio proyecto Auth.js lo recomienda para proyectos nuevos; cualquier cambio del stack maestro debe decidirse explícitamente.

## Wave 5 — CI/CD, supply chain y despliegues controlados

Ver:

`catalog/operations/GSF-PILLAKI-TOOLKIT-WAVE5.md`

Herramientas seleccionadas:

- actionlint — validación de GitHub Actions.
- zizmor — análisis estático de seguridad para CI/CD.
- OpenSSF Scorecard — evaluación de prácticas de seguridad de repositorios/dependencias.
- Cosign — firma y verificación de contenedores y artefactos.
- Harden-Runner — observabilidad y endurecimiento de runners, según plan/compatibilidad.
- OpenTofu — Infrastructure as Code y planes reproducibles.
- Flagsmith — feature flags, remote config y rollouts controlados.

## Principio de uso

La biblioteca registra y estudia herramientas; no las instala automáticamente en producción. Cada implementación requiere autorización del proyecto, revisión de versión/licencia y configuración acorde a su riesgo, privacidad y necesidad real.

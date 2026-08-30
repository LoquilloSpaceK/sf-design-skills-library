# Gráfica SF + Pillaki — Toolkit Operativo Wave 5

Quinta selección curada de herramientas públicas para reforzar CI/CD, GitHub Actions, supply chain, firma de artefactos, infraestructura reproducible, evaluación de seguridad de repositorios y despliegues controlados mediante feature flags.

Este documento es un mapa operativo. No instala nada automáticamente ni modifica repositorios productivos. Cada herramienta se adopta solo en el proyecto autorizado, con revisión de versión, licencia, arquitectura, privacidad, costo y necesidad real.

## Objetivo de la Wave 5

Responder mejor estas preguntas:

1. **¿Nuestros workflows de GitHub Actions están bien escritos?** — linting y validación.
2. **¿Nuestros workflows introducen riesgos de supply chain?** — análisis estático especializado.
3. **¿Qué está haciendo realmente el runner durante CI/CD?** — monitoreo y control de ejecución.
4. **¿Podemos verificar quién produjo un artefacto y que no fue alterado?** — firma y verificación.
5. **¿La infraestructura está documentada y puede reconstruirse?** — Infrastructure as Code.
6. **¿Podemos activar/desactivar una función sin desplegar código nuevo?** — feature flags.
7. **¿Qué tan saludable es la postura de seguridad de un repositorio/dependencia?** — evaluación de prácticas OSS.

## Prioridad recomendada

### Nivel A — adopción temprana

1. **actionlint** — validación sintáctica y semántica de GitHub Actions.
2. **zizmor** — análisis de seguridad de CI/CD y workflows.
3. **OpenSSF Scorecard** — evaluación de prácticas de seguridad de repositorios y dependencias.

### Nivel B — proyectos con releases o CI/CD más sensible

4. **Cosign** — firma/verificación de contenedores y otros artefactos.
5. **Harden-Runner** — observabilidad/control de runners de CI/CD, sujeto a compatibilidad y plan.

### Nivel C — proyectos con infraestructura o despliegues más complejos

6. **OpenTofu** — Infrastructure as Code y planes reproducibles.
7. **Flagsmith** — feature flags, configuración remota y rollouts segmentados.

---

## 1. actionlint

- Upstream: `rhysd/actionlint`
- Licencia declarada: MIT.
- Función: checker estático especializado en workflows de GitHub Actions.

### Qué revisa

El proyecto documenta checks para:

- sintaxis de workflows;
- tipos en expresiones `${{ ... }}`;
- inputs/outputs de Actions;
- reusable workflows;
- secretos declarados en llamadas de workflows;
- cron;
- labels de runners;
- dependencias `needs`;
- integración con ShellCheck y pyflakes;
- ciertos errores de seguridad, como script injection por inputs no confiables y credenciales hardcodeadas.

### Por qué nos sirve

Un workflow YAML puede verse correcto y aun así fallar en producción o introducir una ruta insegura. actionlint permite encontrar errores antes del merge.

### Uso recomendado

- pre-commit o validación local;
- CI de repositorios con GitHub Actions;
- revisión antes de habilitar deploy automático;
- plantillas reutilizables de WebForge.

### Regla

actionlint valida workflows, pero no reemplaza pruebas de ejecución ni análisis de seguridad especializado. Se combina con zizmor y, cuando corresponda, Harden-Runner.

---

## 2. zizmor

- Upstream: `zizmorcore/zizmor`
- Licencia declarada: MIT.
- Función: análisis estático de seguridad para CI/CD.

### Riesgos que el upstream declara detectar

- template injection con posible ejecución de código controlado por atacante;
- persistencia o filtración accidental de credenciales;
- permisos excesivos;
- grants innecesarios de credenciales a runners;
- referencias Git confusas o commits impostores;
- otros patrones inseguros en GitHub Actions, Dependabot y pre-commit.

### Diferencia con actionlint

- **actionlint** pregunta: “¿este workflow está bien formado y usa correctamente GitHub Actions?”
- **zizmor** pregunta: “¿este workflow o configuración CI/CD introduce riesgos de seguridad?”

Ambos son complementarios.

### Uso recomendado

Incluirlo en la revisión de workflows que:

- despliegan a producción;
- usan secretos;
- publican paquetes o imágenes;
- acceden a APIs de proveedores;
- modifican infraestructura;
- generan artefactos de clientes.

### Regla

No aplicar autofixes sin revisar el diff. Cambios en permisos, triggers o referencias pueden romper CI/CD aunque reduzcan riesgo.

---

## 3. OpenSSF Scorecard

- Upstream: `ossf/scorecard`
- Licencia del software revisada: Apache License 2.0.
- Función: evaluar heurísticas de seguridad de proyectos open source y repositorios.

### Qué aporta

Scorecard ayuda a evaluar prácticas como:

- branch protection;
- code review;
- dependencias fijadas/pinned;
- actualizaciones de dependencias;
- SAST;
- CI tests;
- signed releases;
- permisos de tokens;
- política de seguridad;
- vulnerabilidades conocidas;
- mantenimiento del proyecto.

### Regla crítica

El propio proyecto advierte que sus resultados son **heurísticas**, pueden existir falsos positivos/falsos negativos y el score agregado no debe tratarse como una verdad absoluta.

### Cómo nos sirve

Antes de incorporar una dependencia grande o repositorio de terceros, Scorecard puede convertirse en una señal adicional junto a:

- licencia;
- actividad reciente;
- issues abiertos;
- historial de seguridad;
- mantenedores;
- dependencias;
- adopción real;
- compatibilidad con nuestro stack.

### Uso en nuestros repositorios

Puede utilizarse como checklist de madurez. Si se usa la Action, revisar cuidadosamente si los resultados se publican o permanecen internos. No publicar información de repositorios/clientes sin autorización.

---

## 4. Cosign / Sigstore

- Upstream: `sigstore/cosign`
- Licencia revisada: Apache License 2.0.
- Función: firmar y verificar contenedores OCI y otros artefactos mediante Sigstore.

### Capacidades relevantes

El upstream documenta:

- keyless signing mediante identidad/OIDC;
- Fulcio CA;
- transparencia con Rekor;
- firma con hardware/KMS;
- firma mediante pares de claves propios;
- firma y verificación de imágenes OCI;
- firma de blobs/artefactos;
- verificación por identidad esperada.

### Por qué nos sirve

En sistemas avanzados, no basta con saber que “la build pasó”. También podemos querer verificar:

- quién produjo el artefacto;
- desde qué workflow;
- que el digest coincide;
- que el artefacto no fue sustituido.

### Regla importante sobre privacidad

El flujo keyless puede registrar identidad asociada al certificado en logs de transparencia públicos. El propio proyecto advierte que cierta información identificable puede quedar almacenada de forma permanente. Antes de usar keyless signing en un cliente se revisará exactamente qué identidad se publica.

### Regla de firma

Firmar siempre artefactos inmutables/digests cuando la plataforma lo permita. Un tag mutable como `latest` no es una identidad suficiente del artefacto.

### Cuándo usarlo

Prioridad alta si en el futuro distribuimos:

- contenedores;
- binarios;
- CLI;
- paquetes internos;
- artefactos de infraestructura;
- componentes que terceros deban verificar.

Para una landing estática normal no es necesario.

---

## 5. Harden-Runner

- Upstream: `step-security/harden-runner`
- Licencia declarada por el proyecto: Apache License 2.0.
- Función: monitoreo y endurecimiento de runners de CI/CD.

### Capacidades documentadas

- correlación de conexiones de red, procesos y operaciones de archivo con pasos del workflow;
- detección de comportamiento anómalo;
- control de egress por allowlist en escenarios compatibles;
- detección de modificación del código durante build;
- recomendaciones sobre permisos mínimos de `GITHUB_TOKEN` en ciertos planes;
- detección orientada a ataques de supply chain.

### Restricción de plan importante

El README actual distingue funciones **Community** y **Enterprise**. En particular, declara el soporte para **repositorios privados** dentro del nivel Enterprise.

Por tanto:

- no asumir que la edición gratuita cubre todos nuestros proyectos;
- revisar plan vigente antes de implementarlo;
- comparar costo/beneficio con controles nativos de GitHub y proveedor.

### Uso recomendado

Evaluarlo para pipelines que:

- manejan secretos de producción;
- despliegan sistemas críticos;
- construyen artefactos distribuibles;
- tienen riesgo elevado de supply chain.

### Regla

Comenzar con observación/audit cuando corresponda. Bloquear egress sin baseline puede romper instalaciones, builds o despliegues legítimos.

---

## 6. OpenTofu

- Upstream: `opentofu/opentofu`
- Licencia declarada: Mozilla Public License 2.0.
- Función: Infrastructure as Code (IaC).

### Capacidades upstream

- infraestructura declarativa y versionable;
- execution plans antes del apply;
- grafo de recursos y dependencias;
- automatización de cambios;
- administración de proveedores compatibles.

### Por qué nos sirve

Cuando un cliente deje de ser “solo una web” y tenga infraestructura propia, depender de pasos manuales es difícil de auditar y reproducir.

Con IaC podemos aspirar a documentar:

- recursos cloud;
- redes;
- storage;
- bases administradas;
- DNS cuando el provider lo soporte;
- permisos;
- servicios auxiliares;
- entornos staging/producción.

### Regla de estado

El state de IaC puede contener información sensible. Nunca almacenarlo sin protección ni tratarlo como un archivo común del repositorio.

### Regla de cambio

Flujo recomendado:

`cambio → validate/lint → plan → revisión → apply autorizado → verificación`.

No ejecutar `apply` automático sobre producción sin una estrategia explícita de aprobación y recuperación.

### Cuándo NO usarlo

Si Vercel/Cloudflare/proveedor gestionado cubre todo con pocos recursos y no existe necesidad de reproducibilidad adicional, IaC puede agregar más complejidad que valor.

---

## 7. Flagsmith

- Upstream: `Flagsmith/flagsmith`
- Licencia declarada para la mayor parte de la plataforma open source: BSD 3-Clause; el proyecto también indica que ciertas partes/repositorios y funciones empresariales tienen condiciones diferentes.
- Función: feature flags, remote config, segmentación y A/B testing.

### Qué aporta

Permite desplegar código con una función apagada y activarla después, sin necesitar otro deploy para cada cambio de estado.

Casos útiles:

- activar una función gradualmente;
- habilitar beta solo a ciertos usuarios;
- apagar rápidamente una integración defectuosa;
- probar una versión nueva;
- separar disponibilidad por entorno;
- cambios de configuración remota.

### Feature flag no es rollback completo

Desactivar una bandera puede mitigar un fallo de aplicación, pero **no revierte automáticamente**:

- migraciones de base de datos;
- cambios incompatibles de esquema;
- datos ya modificados;
- infraestructura;
- efectos externos ya ejecutados.

Los cambios irreversibles requieren una estrategia de migración/rollback separada.

### Regla de seguridad

Una feature flag no es un sistema de autorización. No se debe “proteger” una función sensible solo ocultándola detrás de un flag del frontend. El servidor debe seguir aplicando permisos reales.

### Regla operativa

Las flags temporales deben tener:

- dueño;
- objetivo;
- fecha de revisión/retirada;
- estado por entorno;
- fallback seguro.

Evitar acumular flags muertas indefinidamente.

---

## Arquitectura de referencia Wave 5

```text
CAMBIO DE CÓDIGO
  ↓
actionlint
  workflows correctos
  ↓
zizmor
  seguridad CI/CD
  ↓
Betterleaks + Trivy
  secretos + vulnerabilidades
  ↓
OpenSSF Scorecard
  postura del repo/dependencias (señal complementaria)
  ↓
TESTS / QA
  Playwright + axe + Schemathesis + Lighthouse
  ↓
BUILD
  ↓
Harden-Runner (cuando aplique)
  comportamiento real del runner
  ↓
Cosign (cuando exista artefacto firmable)
  firma + verificación
  ↓
DEPLOY
  ↓
Flagsmith (cuando exista rollout controlado)
  feature flags / kill switches
  ↓
INFRA
  ↓
OpenTofu (cuando exista infraestructura declarativa)
  plan + apply autorizado
```

## Integración con Waves 1–4

```text
DISEÑO / IMPLEMENTACIÓN
  ↓
WebForge + shadcn/ui + Storybook
  ↓
CI/CD
  actionlint + zizmor
  ↓
SUPPLY CHAIN
  Betterleaks + Trivy + Dependabot + Scorecard
  ↓
IDENTIDAD / SECRETOS
  Better Auth / Keycloak + SOPS / OpenBao
  ↓
QA
  Playwright + axe + Lychee + Schemathesis + Lighthouse
  ↓
BUILD / RELEASE
  Harden-Runner + Cosign cuando se justifique
  ↓
STAGING
  k6 + ZAP
  ↓
PERÍMETRO
  WAF gestionado / OWASP CRS
  ↓
PRODUCCIÓN
  Flagsmith para rollout controlado cuando aplique
  ↓
OBSERVABILIDAD
  Uptime Kuma + Healthchecks + OpenTelemetry
  ↓
CONTINUIDAD
  restic + restores verificados
  ↓
INFRAESTRUCTURA
  OpenTofu cuando exista suficiente complejidad
```

## Reglas permanentes de la Wave 5

1. Los workflows de CI/CD son código y se revisan como código.
2. Actions de terceros deben fijarse a versiones/commits confiables según la política del proyecto.
3. Usar el mínimo permiso posible para `GITHUB_TOKEN` y otras credenciales.
4. Un workflow que recibe datos no confiables no debe interpolarlos directamente en scripts.
5. No dar secretos de producción a jobs que no los necesitan.
6. Ningún score de seguridad reemplaza una revisión técnica real.
7. Firmar artefactos solo aporta valor si después también verificamos las firmas.
8. Revisar la privacidad de identidades antes de usar transparencia pública/keyless signing.
9. Un runner de CI debe tratarse como entorno sensible, especialmente si maneja secretos o releases.
10. Feature flags no reemplazan autorización ni rollback de datos.
11. Las flags temporales deben retirarse cuando termina su propósito.
12. IaC state y credenciales se consideran secretos/sensibles.
13. `plan` debe revisarse antes de `apply` en infraestructura importante.
14. Evitar infraestructura autogestionada si un servicio gestionado simple reduce riesgo y mantenimiento.
15. Ninguna herramienta de esta biblioteca se aplica automáticamente a Gráfica SF, Pillaki o clientes.

## Orden recomendado de adopción

### Sitio/landing pequeño

1. actionlint si usa GitHub Actions;
2. zizmor si el workflow despliega o usa secretos;
3. controles de Wave 1/2;
4. proveedor gestionado para deploy/rollback;
5. sin OpenTofu/Flagsmith/Cosign salvo necesidad real.

### Portal o sistema mediano

1. actionlint + zizmor;
2. Betterleaks + Trivy + Dependabot;
3. tests automatizados;
4. feature flags si existe rollout gradual o kill switch;
5. Harden-Runner si el pipeline y plan lo justifican;
6. Cosign si distribuimos artefactos verificables;
7. OpenTofu si ya existe infraestructura no trivial.

### Plataforma/cliente empresarial

1. pipeline con controles de seguridad CI/CD;
2. permisos mínimos y approvals;
3. Scorecard/criterios de supply chain para dependencias críticas;
4. firma/verificación de releases;
5. observabilidad del runner;
6. feature management gobernado;
7. infraestructura como código con estado remoto protegido;
8. plan/review/apply y recuperación documentada.

## Resultado estratégico

La Wave 5 transforma el pipeline en una superficie de seguridad y control explícita. El objetivo no es tener más herramientas, sino reducir cambios invisibles, builds difíciles de reproducir, permisos excesivos, releases sin procedencia clara y despliegues sin mecanismo de control.
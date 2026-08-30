# Gráfica SF + Pillaki — Toolkit Operativo Wave 4

Cuarta selección curada de herramientas públicas para reforzar identidad, autenticación, autorización, secretos, cifrado de configuración y defensa perimetral.

Este documento es un mapa operativo. No instala nada automáticamente ni modifica repositorios productivos. Cada herramienta se adopta solo en el proyecto autorizado, con revisión de versión, licencia, arquitectura, privacidad y costo operativo.

## Objetivo de la Wave 4

Responder de forma sistemática cinco preguntas de seguridad:

1. **¿Quién puede entrar?** — autenticación e identidad.
2. **¿Qué puede hacer?** — autorización y políticas.
3. **¿Dónde viven los secretos?** — configuración cifrada y secret management.
4. **¿Cómo rotamos/revocamos credenciales?** — secretos dinámicos, leases y revocación.
5. **¿Qué bloquea tráfico malicioso antes de llegar a la aplicación?** — WAF / reglas perimetrales.

## Prioridad recomendada

### Nivel A — proyectos WebForge nuevos

1. **Better Auth** — candidato preferente para autenticación/2FA/multi-tenant en nuevos proyectos TypeScript.
2. **SOPS** — cifrado de archivos de configuración y secretos cuando deban mantenerse versionados de forma segura.
3. **OWASP Core Rule Set (CRS)** — referencia de reglas WAF para infraestructuras compatibles.

### Nivel B — sistemas con permisos o secretos más complejos

4. **Open Policy Agent (OPA)** — motor de políticas para autorización contextual y decisiones centralizadas.
5. **OpenBao** — secret manager para almacenamiento, secretos dinámicos, leasing, revocación y cifrado.

### Nivel C — identidad empresarial centralizada

6. **Keycloak** — Identity and Access Management completo para escenarios con múltiples apps, usuarios, federación o SSO.

---

## 1. Better Auth

- Upstream: `better-auth/better-auth`
- Licencia declarada: MIT.
- Función: framework de autenticación y autorización para TypeScript, independiente del framework.

### Por qué entra

El README actual de Auth.js/NextAuth indica que Auth.js pasó a formar parte de Better Auth y recomienda que **proyectos nuevos comiencen con Better Auth**, salvo gaps concretos —por ejemplo, session management stateless sin base de datos—. WebForge actualmente tiene NextAuth.js en su stack maestro, por lo que Better Auth entra como candidato técnico prioritario pero **no reemplaza automáticamente** ese estándar sin una decisión explícita.

### Capacidades relevantes

- autenticación TypeScript;
- autorización;
- 2FA;
- multi-tenant;
- ecosistema de plugins;
- control de datos propio;
- integración con arquitecturas modernas.

### Uso recomendado

Evaluar Better Auth en proyectos nuevos que requieran:

- portales privados;
- cuentas de clientes;
- paneles administrativos;
- 2FA;
- organizaciones/tenants;
- roles y permisos básicos/medios.

### Regla

Autenticación no equivale a autorización completa. Un usuario autenticado no debe ganar acceso a recursos solo por tener sesión válida. Las reglas de negocio y permisos se validan en servidor.

### Decisión WebForge

- **Estado actual del Prompt Maestro:** NextAuth.js permanece sin cambios.
- **Para proyectos nuevos:** comparar Better Auth vs Auth.js según requisitos.
- **No migrar aplicaciones existentes solo por tendencia.** Una migración de autenticación exige inventario de sesiones, adapters, usuarios, OAuth/OIDC, callbacks, cookies y estrategia de rollback.

---

## 2. SOPS

- Upstream: `getsops/sops`
- Licencia declarada: Mozilla Public License 2.0.
- Proyecto CNCF Sandbox.
- Función: editor de archivos cifrados.

### Formatos y backends upstream

SOPS soporta cifrado de:

- YAML;
- JSON;
- ENV;
- INI;
- archivos binarios;

con mecanismos como:

- age;
- PGP;
- AWS KMS;
- GCP KMS;
- Azure Key Vault;
- otros KMS compatibles documentados por el proyecto.

### Por qué nos sirve

Permite mantener **configuración cifrada** bajo control de versiones cuando exista una razón real para hacerlo, evitando guardar secretos en texto plano.

### Casos

- infraestructura declarativa;
- configuraciones de staging;
- secretos que deban distribuirse de forma controlada entre operadores;
- archivos de configuración cifrados en repositorios privados;
- pipelines donde el secreto solo se descifra en un entorno autorizado.

### Regla crítica

Un archivo cifrado sigue siendo un activo sensible. No asumir que por usar SOPS puede publicarse indiscriminadamente. Las claves/KMS, permisos de descifrado y política de acceso son parte de la seguridad.

### SOPS no reemplaza a Betterleaks

- **Betterleaks**: busca secretos que accidentalmente quedaron expuestos.
- **SOPS**: permite cifrar configuración que intencionalmente debe almacenarse/versionarse.

Ambas capas son complementarias.

---

## 3. OWASP Core Rule Set (CRS)

- Upstream: `coreruleset/coreruleset`
- Licencia declarada: Apache License 2.0.
- OWASP Flagship Project.
- Función: conjunto genérico de reglas de detección para WAF compatibles como OWASP ModSecurity, OWASP Coraza y otros.

### Qué aporta

El CRS busca proteger aplicaciones frente a múltiples clases de ataques —incluidos riesgos relacionados con OWASP Top Ten— mediante reglas de detección con foco en minimizar falsos positivos.

### Diferencia con OWASP ZAP

- **ZAP**: prueba/escanea una aplicación para encontrar problemas.
- **CRS/WAF**: inspecciona tráfico en tiempo de ejecución e intenta bloquear/detectar patrones de ataque antes o durante el acceso a la app.

### Uso recomendado

Solo cuando controlemos una infraestructura o proxy compatible donde tenga sentido operar un WAF propio.

Para servicios detrás de Cloudflare/Vercel/u otro proveedor gestionado, primero evaluar las capacidades WAF nativas del proveedor antes de introducir otra capa autogestionada.

### Regla de despliegue

1. empezar en modo detección cuando corresponda;
2. observar falsos positivos;
3. ajustar exclusions/reglas con evidencia;
4. probar formularios, APIs, uploads y webhooks;
5. recién después considerar bloqueo estricto.

Un WAF mal ajustado puede bloquear clientes legítimos o romper formularios.

---

## 4. Open Policy Agent (OPA)

- Upstream: `open-policy-agent/opa`
- Licencia revisada: Apache License 2.0.
- CNCF Graduated Project.
- Función: motor de políticas general-purpose para decisiones contextuales.

### Qué problema resuelve

En sistemas simples, `if (user.role === 'admin')` puede bastar. A medida que crecen roles, organizaciones, ownership, recursos y excepciones, las reglas de autorización se dispersan y se vuelven difíciles de auditar.

OPA permite separar la **decisión de política** del código de negocio.

### Ejemplos de preguntas

- ¿Puede el usuario X ejecutar la operación Y sobre el recurso Z?
- ¿Puede un vendedor leer leads de otra organización?
- ¿Puede un operador exportar datos fuera de su tenant?
- ¿Puede una automatización ejecutar cierta acción en este entorno?

### Uso recomendado

Solo cuando la complejidad lo justifique:

- sistemas multi-tenant;
- portales con múltiples roles;
- APIs con permisos contextuales;
- plataformas con políticas compartidas entre servicios;
- infraestructura que necesite policy-as-code.

### Regla

OPA no autentica al usuario por sí solo. Recibe identidad/contexto y entrega decisiones. Debe combinarse con una fuente de identidad/autenticación confiable y con enforcement real en la aplicación.

### No sobrediseñar

No introducir OPA en una landing con formulario ni en un portal de dos roles si una autorización simple, testeada y clara es suficiente.

---

## 5. OpenBao

- Upstream: `openbao/openbao`
- Licencia revisada: Mozilla Public License 2.0.
- Función: administrar, almacenar y distribuir secretos, certificados y claves.

### Capacidades relevantes upstream

- almacenamiento cifrado de secretos;
- secretos dinámicos;
- generación temporal de credenciales para ciertos sistemas;
- leases/renovación;
- revocación;
- cifrado/descifrado como servicio;
- auditabilidad según configuración.

### Qué aporta frente a SOPS

- **SOPS**: cifra archivos/configuración que existen como artefactos versionados.
- **OpenBao**: actúa como servicio de secret management en tiempo de ejecución.

### Casos

- múltiples aplicaciones que consumen secretos;
- rotación frecuente;
- credenciales dinámicas;
- entornos con varios operadores/equipos;
- necesidad de revocación rápida;
- sistemas con suficiente complejidad para justificar un servicio dedicado.

### Regla de adopción

OpenBao es infraestructura crítica. No debe instalarse solo porque “es más seguro”. Si se opera mal, se transforma en un punto central de fallo.

Antes de usarlo debe existir:

- estrategia de unseal/recuperación;
- backups;
- alta disponibilidad si aplica;
- TLS;
- autenticación fuerte;
- políticas de mínimo privilegio;
- auditoría;
- rotación;
- monitoreo;
- procedimiento documentado de recuperación.

Para sitios pequeños, los secret stores del proveedor (Vercel, GitHub Actions, cloud, etc.) pueden ser la opción más segura y simple.

---

## 6. Keycloak

- Upstream: `keycloak/keycloak`
- Licencia declarada: Apache License 2.0.
- Función: Identity and Access Management open source.

### Capacidades upstream destacadas

- autenticación fuerte;
- administración de usuarios;
- federación de usuarios;
- autorización fina;
- protección de servicios;
- SSO / identidad centralizada según arquitectura.

### Cuándo tiene sentido

- un cliente tiene varias aplicaciones;
- muchos usuarios internos/externos;
- necesidad de identidad centralizada;
- integración con directorios/IdP;
- SSO;
- políticas de autenticación empresariales;
- lifecycle de usuarios administrado fuera de una sola app.

### Cuándo NO usarlo

Para una web simple, landing, cotizador básico o portal pequeño, Keycloak puede introducir una carga operacional innecesaria.

### Diferencia con Better Auth

- **Better Auth**: autenticación/autorización embebida en la aplicación TypeScript.
- **Keycloak**: servidor/plataforma IAM centralizada que puede servir a múltiples aplicaciones.

La decisión depende de arquitectura, no de cuál tenga más funciones.

---

## Arquitectura de referencia Wave 4

```text
USUARIO
  ↓
IDENTIDAD / LOGIN
  ├─ Better Auth        → app TypeScript / proyecto nuevo
  └─ Keycloak           → IAM central / múltiples apps / empresa
  ↓
AUTORIZACIÓN
  ├─ reglas servidor simples cuando basten
  └─ OPA                → policy-as-code cuando exista complejidad real
  ↓
APP / API
  ↓
SECRETOS
  ├─ Secret store gestionado del proveedor → opción preferente en proyectos simples
  ├─ SOPS               → archivos/config cifrada versionada
  └─ OpenBao            → runtime secrets, leases y revocación en sistemas avanzados
  ↓
PERÍMETRO
  ├─ WAF gestionado del proveedor cuando exista
  └─ OWASP CRS          → WAF compatible/autogestionado
```

## Integración con Waves anteriores

```text
DESARROLLO
  ↓
Betterleaks + SOPS
  exposición accidental + configuración cifrada
  ↓
Trivy + Dependabot
  vulnerabilidades + supply chain
  ↓
Better Auth / Keycloak
  identidad
  ↓
Reglas servidor / OPA
  autorización
  ↓
Playwright + axe + Schemathesis
  QA funcional y de contratos
  ↓
OWASP ZAP
  pruebas de seguridad autorizadas
  ↓
WAF gestionado / OWASP CRS
  defensa en runtime
  ↓
OpenBao / secret store gestionado
  secretos operacionales
  ↓
Uptime Kuma + Healthchecks + OpenTelemetry
  disponibilidad + jobs + trazabilidad
```

## Reglas permanentes de la Wave 4

1. **Autenticación y autorización son problemas distintos.**
2. No almacenar contraseñas de usuarios manualmente si un framework/IdP robusto puede manejarlo.
3. MFA/2FA debe evaluarse para accesos administrativos o sensibles.
4. Las sesiones deben expirar y poder revocarse según riesgo.
5. Nunca confiar en roles/permisos entregados solo por el frontend.
6. Secretos no van en repositorios en texto plano, frontend, logs ni analytics.
7. Usar el secret store gestionado más simple que cubra el riesgo antes de autoalojar infraestructura crítica.
8. Cifrar un secreto no elimina la necesidad de proteger la clave que lo descifra.
9. WAF no reemplaza código seguro, validación, rate limiting ni pruebas.
10. WAF y scanners deben ajustarse para no dañar disponibilidad ni bloquear usuarios legítimos.
11. Política de mínimo privilegio para usuarios, servicios, CI y bases de datos.
12. Registrar accesos/acciones sensibles sin registrar contraseñas, tokens o datos privados innecesarios.
13. Diseñar un mecanismo de revocación antes de necesitarlo durante un incidente.
14. No introducir Keycloak, OPA u OpenBao en proyectos pequeños si aumentan más el riesgo operacional que la seguridad.
15. Ninguna herramienta de esta biblioteca se aplica automáticamente a Gráfica SF, Pillaki o clientes.

## Orden recomendado de adopción

### Proyecto pequeño

1. secret store del proveedor;
2. Betterleaks/Trivy;
3. Better Auth solo si requiere usuarios;
4. autorización server-side simple;
5. WAF gestionado del proveedor.

### Portal de cliente mediano

1. Better Auth + MFA cuando aplique;
2. roles/permisos server-side;
3. SOPS si existe configuración versionada cifrada;
4. pruebas Playwright/ZAP/Schemathesis según superficie;
5. WAF gestionado;
6. OPA solo si permisos comienzan a ser complejos.

### Plataforma/cliente empresarial

1. evaluar Keycloak u otro IdP corporativo existente;
2. policy-as-code con OPA cuando aporte gobernanza real;
3. secret manager dedicado como OpenBao cuando se justifique;
4. WAF gestionado o CRS compatible;
5. logging/auditoría/observabilidad;
6. procedimientos de revocación, backup y recuperación probados.

## Decisión pendiente para WebForge

El stack maestro actual declara NextAuth.js. Debido a que el README actual de Auth.js recomienda Better Auth para proyectos nuevos, queda abierta una futura decisión de arquitectura:

- mantener Auth.js como estándar;
- cambiar el estándar a Better Auth;
- o definir una matriz de decisión según tipo de proyecto.

**La Wave 4 no modifica el Prompt Maestro automáticamente.**

# Gráfica SF + Pillaki — Toolkit Operativo Wave 3

Tercera selección curada de herramientas públicas para complementar las Waves 1 y 2 con datos de prueba, simulación de APIs, integración realista, pruebas basadas en contratos OpenAPI, documentación interactiva, correos transaccionales, backups y vigilancia de tareas programadas.

Este documento es un mapa operativo. No instala nada automáticamente ni modifica repositorios productivos. Cada herramienta debe incorporarse únicamente al proyecto autorizado, con versión fijada, revisión de licencia, configuración y privacidad.

## Prioridad recomendada

### Nivel A — seguridad y velocidad de desarrollo

1. Faker — datos ficticios y reproducibles para desarrollo y QA.
2. Mock Service Worker (MSW) — simulación de APIs REST/GraphQL sin contaminar el código productivo.
3. React Email — componentes React/TypeScript para correos transaccionales consistentes.

### Nivel B — calidad de backend/API

4. Testcontainers for Node.js — dependencias reales y desechables para pruebas de integración.
5. Swagger UI — documentación e interacción con APIs OpenAPI.
6. Schemathesis — generación automática de casos y workflows para encontrar errores de API.

### Nivel C — continuidad operacional

7. restic — backups cifrados, verificables y eficientes.
8. Healthchecks — vigilancia de cron jobs y automatizaciones que deben ejecutarse a tiempo.

---

## 1. Faker

- Upstream: `faker-js/faker`
- Licencia declarada: MIT.
- Función: generar grandes cantidades de datos ficticios realistas para testing y desarrollo.

### Por qué nos sirve

Permite construir demos, formularios, tablas, dashboards, portales y bases de prueba sin copiar datos personales reales de clientes.

### Capacidades útiles

- nombres y perfiles;
- direcciones y ubicaciones;
- emails y teléfonos de prueba;
- comercio, precios y productos;
- fechas;
- strings e identificadores;
- múltiples locales;
- seeds para resultados reproducibles.

### Regla importante

El propio proyecto advierte que un dato generado puede coincidir por casualidad con información válida. No usar emails o teléfonos generados para realizar envíos o llamadas reales. Las pruebas de mensajería deben permanecer en Mailpit u otro entorno controlado.

### Uso WebForge

Usarlo para poblar interfaces y pruebas automatizadas, nunca como sustituto de validaciones reales ni para crear identidades destinadas a servicios externos.

---

## 2. Mock Service Worker (MSW)

- Upstream: `mswjs/msw`
- Licencia revisada: MIT.
- Función: interceptar requests y simular comportamiento de APIs en navegador y Node.js.

### Qué aporta

Podemos construir y probar un frontend incluso cuando una API todavía no existe o cuando no queremos depender de servicios reales durante QA.

### Uso recomendado

- respuestas REST y GraphQL simuladas;
- escenarios 200/400/401/403/404/429/500;
- latencia artificial;
- estados vacíos;
- errores de terceros;
- demos comerciales aisladas;
- tests unitarios, integración y E2E compartiendo handlers cuando sea apropiado.

### Regla

Los mocks deben reflejar contratos reales y mantenerse separados de producción. Una prueba que solo funciona contra un mock no demuestra que la integración real funcione: complementarla con Testcontainers, staging y tests contra servicios autorizados.

---

## 3. React Email

- Upstream: `resend/react-email`
- Licencia declarada: MIT.
- Función: componentes React y TypeScript para construir emails HTML responsivos.

### Por qué nos sirve

WebForge ya contempla Nodemailer y Mailpit. React Email completa ese circuito permitiendo diseñar correos transaccionales mantenibles con componentes reutilizables.

### Casos

- confirmación de contacto;
- recepción de cotización;
- aviso interno de nuevo lead;
- recuperación o acceso a portales;
- seguimiento comercial;
- documentos/enlaces solicitados por clientes.

### Ventajas

El upstream incluye componentes para HTML, Head, Button, Container, Row, Column, Image, Link, Preview, Tailwind, texto y otros elementos, y declara pruebas en clientes de correo populares.

### Combinación recomendada

`React Email → Nodemailer/proveedor → Mailpit en desarrollo → proveedor real en producción`.

### Regla

No codificar secretos ni datos sensibles en templates. Los valores se inyectan desde el backend autorizado. Revisar siempre texto plano, links, remitente, destinatario y contenido antes de producción.

---

## 4. Testcontainers for Node.js

- Upstream: `testcontainers/testcontainers-node`
- Licencia revisada: MIT.
- Función: usar contenedores desechables durante pruebas de integración.

### Qué aporta

En lugar de simular todo, un test puede levantar temporalmente servicios reales como PostgreSQL, Redis u otras dependencias compatibles, ejecutar la prueba y destruir el entorno al terminar.

### Uso recomendado

- Prisma + PostgreSQL;
- migraciones;
- queries y constraints;
- integraciones que dependen de servicios externos reproducibles;
- pruebas de backend antes de merge.

### Regla

No conectar Testcontainers a bases productivas. Los contenedores de prueba deben utilizar credenciales efímeras y datos ficticios. La disponibilidad de Docker/runtime debe considerarse en CI antes de adoptar esta capa.

---

## 5. Swagger UI

- Upstream: `swagger-api/swagger-ui`
- Licencia declarada: Apache-2.0.
- El upstream también mantiene un archivo NOTICE con avisos legales adicionales.
- Función: visualizar e interactuar con recursos de una API a partir de su especificación OpenAPI.

### Qué aporta

Una API bien documentada es mucho más fácil de mantener, probar y entregar a un cliente o integrador.

### Uso recomendado

- contratos de endpoints;
- parámetros y payloads;
- respuestas y códigos de estado;
- documentación interna;
- pruebas manuales autorizadas desde una interfaz;
- onboarding técnico de integraciones.

### Regla de seguridad

Una documentación interactiva no debe exponer endpoints administrativos, secretos, ejemplos con tokens reales ni capacidades internas que no deban ser públicas. Para APIs privadas, proteger la documentación con el mismo criterio de acceso del sistema.

### Privacidad/telemetría

El README actual de Swagger UI informa analítica anonimizada de instalación mediante Scarf y documenta cómo deshabilitarla. En proyectos sensibles, revisar y decidir explícitamente esa configuración.

---

## 6. Schemathesis

- Upstream: `schemathesis/schemathesis`
- Licencia declarada: MIT.
- Función: probar APIs OpenAPI y GraphQL generando inputs, adaptándose a respuestas y encadenando operaciones.

### Qué puede encontrar

- errores 500;
- respuestas que violan el schema;
- validaciones que aceptan datos inválidos;
- fallos de integración;
- bugs que aparecen solo al encadenar operaciones/estado.

### Por qué nos interesa

Complementa Swagger UI. Swagger documenta y permite explorar; Schemathesis usa el contrato para generar pruebas de borde que una revisión manual puede no imaginar.

### Regla de operación

Estas pruebas pueden enviar muchos inputs inesperados. Ejecutarlas primero contra local/staging y únicamente contra APIs propias o autorizadas. No usar sobre APIs de terceros sin permiso.

### Combinación recomendada

`OpenAPI → Swagger UI → Schemathesis → Playwright/k6/ZAP según alcance`.

---

## 7. restic

- Upstream: `restic/restic`
- Licencia declarada: BSD 2-Clause.
- Función: programa de backup rápido, eficiente y seguro.

### Características relevantes

- snapshots;
- restauración;
- verificación de restaurabilidad;
- cifrado/confidencialidad e integridad;
- deduplicación;
- backends locales y remotos;
- soporte SFTP, S3, B2, Azure Blob, Google Cloud Storage y otros mediante rclone.

### Por qué entra en nuestra estrategia

Un backup que nunca se ha restaurado no es una garantía suficiente. El upstream pone énfasis explícito en verificación y restore.

### Uso recomendado

Para infraestructura persistente que administremos: bases exportadas, configuraciones, volúmenes y archivos críticos según arquitectura. No aplica directamente a cada frontend estático de Vercel.

### Reglas críticas

- estrategia 3-2-1 cuando el nivel de riesgo lo justifique;
- contraseña/clave fuera del repositorio;
- destino separado del origen;
- pruebas periódicas de restore;
- política de retención;
- cifrado y control de acceso;
- no asumir que GitHub reemplaza un backup de bases/datos operacionales.

---

## 8. Healthchecks

- Upstream: `healthchecks/healthchecks`
- Licencia declarada: BSD 3-Clause.
- Función: monitorear cron jobs y tareas programadas mediante pings HTTP/email y alertar cuando un ping no llega a tiempo.

### Qué problema resuelve

Uptime Kuma nos dice si un endpoint responde. Healthchecks resuelve otra falla común: una tarea puede dejar de ejecutarse silenciosamente aunque el servidor siga encendido.

### Casos Pillaki / Gráfica SF

- backups programados;
- informes diarios;
- limpieza de datos;
- generación de documentos;
- sincronizaciones;
- importadores/exportadores;
- tareas de mantenimiento;
- jobs que envían o procesan información periódica.

### Capacidades upstream

- dashboard;
- period/grace time o expresión cron;
- API;
- múltiples integraciones de notificación;
- reportes;
- WebAuthn 2FA;
- equipos/proyectos.

### Regla

Los URLs de ping funcionan como credenciales operativas. No publicarlos en repositorios ni logs públicos. Si se autoaloja, proteger panel, secretos SMTP, base de datos y backups.

---

## Flujo ampliado Waves 1 + 2 + 3

```text
DISEÑO / DATOS DE PRUEBA
  ↓
Faker
  datos ficticios
  ↓
MSW
  APIs simuladas
  ↓
React Email + Mailpit
  emails visuales y seguros
  ↓
DESARROLLO
  ↓
Betterleaks + Trivy + Dependabot
  secretos + vulnerabilidades + mantenimiento
  ↓
Testcontainers
  integraciones reales y aisladas
  ↓
Playwright + axe-core + Lychee
  funcionalidad + accesibilidad + enlaces
  ↓
OpenAPI + Swagger UI
  contrato y documentación
  ↓
Schemathesis
  edge cases y workflows API
  ↓
Lighthouse CI
  rendimiento/SEO/budgets
  ↓
STAGING
  ↓
k6 + OWASP ZAP
  carga + seguridad autorizada
  ↓
PRODUCCIÓN
  ↓
Uptime Kuma + Healthchecks
  disponibilidad + jobs programados
  ↓
OpenTelemetry
  trazabilidad interna
  ↓
restic
  backups verificables cuando exista infraestructura persistente
  ↓
GA4 o Umami
  analítica según estrategia
```

## Reglas permanentes

1. Datos reales de clientes no se usan para QA cuando Faker puede cubrir el caso.
2. Mocks y fixtures nunca deben contener secretos productivos.
3. Las pruebas de integración usan servicios aislados, no bases de producción.
4. Toda API relevante debe aspirar a un contrato/documentación mantenible.
5. Fuzz/property-based/API testing se realiza solo sobre activos propios o autorizados.
6. Los templates de email no almacenan credenciales ni información privada fija.
7. Backup significa también poder restaurar y verificar.
8. URLs de health checks, tokens y destinos de backup son secretos.
9. No autoalojar servicios si su mantenimiento agrega más riesgo que beneficio.
10. Ninguna herramienta de esta biblioteca entra automáticamente a Gráfica SF, Pillaki o clientes.

## Orden recomendado para adopción real

En proyectos nuevos:

1. Faker para datos de prueba.
2. MSW cuando exista dependencia de APIs.
3. React Email + Mailpit cuando exista correo transaccional.
4. Testcontainers cuando exista PostgreSQL/servicios de backend relevantes.
5. OpenAPI + Swagger UI cuando la API vaya a mantenerse o integrarse.
6. Schemathesis para APIs con suficiente superficie/riesgo.
7. Healthchecks para jobs críticos.
8. restic cuando administremos almacenamiento o infraestructura persistente que necesite backup propio.

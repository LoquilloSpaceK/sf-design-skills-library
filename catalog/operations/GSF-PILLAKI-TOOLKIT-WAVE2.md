# Gráfica SF + Pillaki — Toolkit Operativo Wave 2

Segunda selección curada de herramientas públicas para complementar la Wave 1 con pruebas de carga, calidad de correo, optimización de imágenes, enlaces rotos, analítica privacy-first, mantenimiento de dependencias y observabilidad.

Este documento es un mapa operativo. No instala nada automáticamente ni modifica repositorios productivos. Cada herramienta debe incorporarse únicamente al proyecto autorizado, con versión fijada, revisión de licencia y configuración específica.

## Prioridad recomendada

### Nivel A — impacto inmediato

1. Mailpit — pruebas seguras de email sin enviar mensajes reales.
2. Sharp — pipeline de optimización y conversión de imágenes para web.
3. Lychee — detección automática de enlaces rotos.
4. Dependabot — actualización automatizada de dependencias mediante PRs.

### Nivel B — calidad y escalabilidad

5. k6 — pruebas de carga y rendimiento bajo tráfico controlado.
6. OpenTelemetry JS — trazas, métricas y logs para sistemas con backend/API.

### Nivel C — analítica alternativa

7. Umami — analítica privacy-first, self-hosted o cloud, sin cookies por defecto.

---

## 1. Mailpit

- Upstream: `axllent/mailpit`
- Licencia revisada: MIT.
- Función: servidor SMTP de pruebas + interfaz web + API para testing.

### Por qué nos sirve

Permite probar formularios, cotizaciones, notificaciones y correos transaccionales sin enviar mensajes reales a clientes durante desarrollo o staging.

### Capacidades útiles

- captura emails enviados por la aplicación;
- visualiza HTML, texto, headers y adjuntos;
- revisa links e imágenes dentro del correo;
- vista móvil/tablet;
- API REST para pruebas automáticas;
- validación de HTML y compatibilidad;
- posibilidad de simular errores SMTP para probar resiliencia.

### Uso recomendado

- conectar Nodemailer o cualquier SMTP de desarrollo a Mailpit;
- usarlo en local y staging;
- verificar asunto, destinatario, HTML, enlaces, adjuntos y fallback de texto;
- automatizar pruebas de emails críticos con su API.

### Regla de seguridad

No exponer el panel de Mailpit públicamente sin autenticación y HTTPS. No usar datos personales reales cuando una prueba pueda realizarse con datos ficticios.

---

## 2. Sharp

- Upstream: `lovell/sharp`
- Licencia revisada: Apache-2.0.
- Función: procesamiento de imágenes de alto rendimiento en Node.js.

### Por qué nos sirve

Gráfica SF y Pillaki trabajan con muchas imágenes. Sharp permite convertir imágenes grandes a formatos web eficientes y automatizar un proceso que hoy puede hacerse manualmente.

### Capacidades útiles

- resize;
- auto-orientación;
- WebP y AVIF;
- JPEG/PNG optimizados;
- recorte y extracción;
- compositing;
- transparencias;
- perfiles de color.

### Uso recomendado

Crear un pipeline reutilizable que, al recibir una imagen de cliente:

1. conserve el original fuera del bundle público cuando corresponda;
2. auto-oriente;
3. genere tamaños responsive;
4. genere WebP/AVIF cuando sea útil;
5. mantenga una calidad visual adecuada;
6. registre dimensiones y peso final;
7. evite subir imágenes gigantes directamente a producción.

### Regla

No eliminar el original del cliente automáticamente. La optimización web debe trabajar sobre copias y preservar archivos fuente cuando formen parte del trabajo gráfico.

---

## 3. Lychee

- Upstream: `lycheeverse/lychee`
- Licencias revisadas: MIT y Apache-2.0 disponibles en el upstream.
- Función: checker rápido de enlaces en sitios web, Markdown, HTML y otros archivos.

### Por qué nos sirve

Evita que una web entregue botones, links, documentos o emails rotos después de cambios.

### Uso recomendado

- ejecutar sobre sitio generado o URL de staging;
- revisar README/documentación;
- detectar 404, redirects inesperados y links inválidos;
- ejecutarlo en CI antes de producción;
- configurar exclusiones para URLs que bloquean bots o requieren sesión.

### Casos especialmente útiles

- botones WhatsApp;
- enlaces de correo;
- PDFs/documentos;
- links de navegación;
- redes sociales;
- enlaces a Maps;
- recursos externos usados por clientes.

### Regla

Un fallo de enlace externo no siempre significa un problema del proyecto. Clasificar si es 404 real, bloqueo anti-bot, rate limit, sesión requerida o timeout antes de marcarlo como defecto.

---

## 4. Dependabot

- Upstream: `dependabot/dependabot-core`
- Licencia revisada: MIT.
- Función: motor de Dependabot para actualizaciones de seguridad y versión.

### Recomendación para nosotros

En GitHub no necesitamos autoalojar Dependabot-Core para el uso normal. La forma preferida es habilitar Dependabot en cada repositorio autorizado mediante `.github/dependabot.yml` y las funciones nativas de GitHub.

### Uso recomendado

- revisar npm/pnpm;
- GitHub Actions;
- Docker cuando exista;
- submódulos Git cuando corresponda;
- abrir PRs automáticos para actualizaciones;
- agrupar actualizaciones menores cuando tenga sentido;
- nunca auto-mergear cambios críticos sin pruebas.

### Regla

Dependabot propone cambios; no garantiza compatibilidad. Cada PR debe pasar build, tests, Playwright y controles de seguridad antes de merge.

---

## 5. Grafana k6

- Upstream: `grafana/k6`
- Licencia revisada: AGPL-3.0.
- Función: pruebas de carga y performance como código.

### Qué aporta

Lighthouse mide principalmente experiencia/rendimiento de una página. k6 responde otra pregunta: ¿qué pasa cuando muchos usuarios o peticiones llegan al mismo tiempo?

### Uso recomendado

- APIs de formularios;
- endpoints de cotización;
- login/portales;
- webhooks;
- sistemas internos;
- backends de clientes con tráfico relevante.

### Regla operativa

Nunca ejecutar pruebas de carga intensas contra producción de terceros sin autorización y ventana definida. Empezar con cargas pequeñas en staging y aumentar gradualmente.

### Licencia

Como k6 está bajo AGPL-3.0, usarlo como herramienta externa de testing es distinto de incorporar/modificar y redistribuir su código. Revisar obligaciones si se pretende modificarlo o integrarlo de una forma que implique distribución de una obra derivada.

---

## 6. OpenTelemetry JS

- Upstream: `open-telemetry/opentelemetry-js`
- Licencia revisada: Apache-2.0.
- Función: framework vendor-neutral para recopilar traces, metrics y logs.

### Qué aporta

Uptime Kuma puede decir que un servicio está caído. OpenTelemetry puede ayudarnos a entender qué ruta, consulta, dependencia o servicio se está demorando o fallando dentro de una aplicación instrumentada.

### Uso recomendado

- APIs Next.js/Node con lógica relevante;
- portales privados;
- integraciones con terceros;
- procesos de cotización complejos;
- servicios con base de datos;
- automatizaciones que necesiten trazabilidad.

### Regla de privacidad

No enviar PII, tokens, cookies, cuerpos completos de formularios ni secretos como atributos de traces/logs. Definir explícitamente qué telemetría sale de la aplicación y cuánto tiempo se retiene.

### Nota técnica

El upstream indica que la instrumentación browser sigue siendo experimental. Para WebForge, priorizar inicialmente instrumentación de servidor/Node y evaluar browser por separado cuando exista una necesidad concreta.

---

## 7. Umami

- Upstream: `umami-software/umami`
- Licencia revisada: MIT.
- Función: plataforma de analítica privacy-first.

### Qué aporta

Ofrece tráfico, campañas, comportamiento y conversiones con un enfoque de privacidad, sin cookies ni vigilancia por defecto, y puede ser self-hosted o cloud.

### Uso recomendado

No reemplaza automáticamente a Google Analytics. Puede servir para:

- clientes que pidan una alternativa más simple o privacy-first;
- sitios donde queramos analítica self-hosted;
- dashboards internos de tráfico/conversión;
- proyectos donde minimizar cookies sea una prioridad.

### Seguridad al autoalojar

El README actual indica que Umami requiere PostgreSQL y crea un usuario inicial por defecto durante la instalación desde fuente. Si alguna vez lo desplegamos, el cambio inmediato de credenciales iniciales, HTTPS, backups, actualizaciones y 2FA deben considerarse obligatorios.

---

## Flujo objetivo Wave 1 + Wave 2

```text
ASSETS
  ↓
Sharp
  optimización de imágenes
  ↓
DESARROLLO
  ↓
Betterleaks
  secretos
  ↓
Trivy
  vulnerabilidades + SBOM + misconfig
  ↓
Dependabot
  mantenimiento continuo de dependencias
  ↓
Playwright + axe-core
  funcionalidad + accesibilidad
  ↓
Lychee
  enlaces
  ↓
Lighthouse CI
  rendimiento + SEO + budgets
  ↓
Mailpit
  correos de desarrollo/staging
  ↓
STAGING
  ↓
k6
  carga controlada cuando aplique
  ↓
OWASP ZAP
  seguridad web autorizada
  ↓
PRODUCCIÓN
  ↓
Uptime Kuma
  disponibilidad
  +
OpenTelemetry
  trazabilidad interna cuando aplique
  +
GA4 o Umami
  analítica según necesidad del proyecto
```

## Reglas permanentes

1. No todas las herramientas entran en todos los proyectos.
2. Elegir el mínimo conjunto que cubra el riesgo real.
3. No duplicar funciones sin beneficio concreto.
4. No enviar datos reales de clientes a herramientas de prueba si no es necesario.
5. Las pruebas de carga y seguridad activas requieren activos propios o autorización explícita.
6. Los resultados de scanners y telemetría pueden contener información sensible; tratarlos como datos internos.
7. Fijar versiones en CI cuando sea razonable y revisar upgrades.
8. Mantener producción separada de laboratorios y herramientas de desarrollo.
9. Revisar licencias antes de redistribuir código de terceros.
10. Ninguna incorporación a esta biblioteca modifica automáticamente Gráfica SF, Pillaki o proyectos de clientes.

## Orden recomendado de implementación real

Para los próximos proyectos nuevos:

1. Sharp para assets pesados.
2. Mailpit para cualquier flujo de correo.
3. Dependabot para mantenimiento.
4. Lychee para QA de enlaces.
5. k6 solo cuando exista backend o tráfico que justifique carga.
6. OpenTelemetry en sistemas con complejidad suficiente para necesitar trazas.
7. Umami solo cuando la estrategia de analítica del cliente lo haga conveniente.

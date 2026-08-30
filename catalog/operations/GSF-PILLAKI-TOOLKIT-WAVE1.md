# Gráfica SF + Pillaki — Toolkit Operativo Wave 1

Selección curada de herramientas públicas para aumentar seguridad, control de calidad, accesibilidad, rendimiento y monitoreo en proyectos propios y de clientes.

Este documento es un mapa operativo. No convierte estas herramientas en dependencias automáticas ni modifica proyectos productivos. Cada integración debe realizarse únicamente sobre el proyecto autorizado y después de revisar versión, licencia, alcance y configuración.

## Criterio de selección

Solo entran herramientas que aporten una función concreta y reutilizable:

- prevenir filtraciones de secretos;
- detectar vulnerabilidades y dependencias riesgosas;
- probar aplicaciones web de forma controlada;
- automatizar QA funcional y cross-browser;
- evitar regresiones de rendimiento/SEO/accesibilidad;
- automatizar controles de accesibilidad;
- vigilar disponibilidad después del despliegue.

## Prioridad recomendada

### Nivel A — incorporar primero en nuevos proyectos

1. Betterleaks — secretos y credenciales expuestas.
2. Trivy — vulnerabilidades, dependencias, secretos, SBOM y misconfiguraciones.
3. Playwright — pruebas end-to-end y cross-browser.
4. Lighthouse CI — rendimiento, SEO, accesibilidad y budgets en CI.
5. axe-core — accesibilidad automatizada integrada en pruebas.

### Nivel B — auditoría controlada

6. OWASP ZAP — análisis de seguridad de aplicaciones web propias o autorizadas.

### Nivel C — operación continua

7. Uptime Kuma — monitoreo self-hosted de disponibilidad, certificados y endpoints.

---

## 1. Betterleaks

- Upstream: `betterleaks/betterleaks`
- Licencia revisada: MIT.
- Función: detectar secretos, tokens y credenciales en Git, archivos y otras fuentes.
- Estado al revisar: proyecto activo en 2026 y mantenido por el equipo/original author detrás de Gitleaks.

### Por qué lo elegimos

Gitleaks sigue siendo útil, pero su README actual indica que está feature-complete y que las nuevas funciones se están moviendo a Betterleaks. Para un estándar nuevo preferimos estudiar Betterleaks como sucesor, manteniendo Gitleaks solo como compatibilidad cuando un proyecto existente ya lo use.

### Uso recomendado

- escaneo local antes de commit;
- control en CI antes de merge;
- revisión de historial Git cuando exista sospecha de una credencial expuesta;
- escaneo de repositorios propios/autorizados;
- generar reportes redactados sin revelar el secreto completo.

### Regla de seguridad

La validación de credenciales puede realizar solicitudes externas al proveedor correspondiente. No validar secretos ajenos, desconocidos o fuera del alcance autorizado. Si se descubre un secreto real, tratarlo como incidente: contener, rotar, revisar alcance y evitar copiarlo a tickets o documentación pública.

---

## 2. Trivy

- Upstream: `aquasecurity/trivy`
- Licencia declarada por upstream: Apache-2.0.
- Función: scanner integral de seguridad.

### Puede detectar

- CVEs en dependencias y paquetes;
- secretos;
- misconfiguraciones de infraestructura como código;
- inventario/SBOM;
- licencias de software;
- problemas en filesystem, repositorios Git, imágenes de contenedor, VM y Kubernetes.

### Uso recomendado Gráfica SF / Pillaki

Para Next.js/Node:

- revisar repositorio y filesystem antes de producción;
- detectar dependencias vulnerables;
- revisar Docker cuando un proyecto lo utilice;
- generar SBOM cuando un cliente requiera trazabilidad;
- integrarlo posteriormente en GitHub Actions con umbrales acordados.

### Regla

No convertir todas las alertas en bloqueos ciegos. Clasificar por severidad, explotabilidad, alcance real y disponibilidad de parche. Documentar excepciones temporales con fecha de revisión.

---

## 3. Playwright

- Upstream: `microsoft/playwright`
- Licencia: Apache-2.0.
- Función: automatización y pruebas web en Chromium, Firefox y WebKit.

### Uso recomendado

Automatizar los flujos que hoy revisamos manualmente:

- carga de home;
- navegación y botones;
- WhatsApp/mail links;
- formularios de contacto y cotización;
- validaciones y mensajes de error;
- responsive móvil;
- login y portales privados cuando existan;
- screenshots y traces solo en entornos controlados;
- regresión después de cambios importantes.

### Regla crítica

Los estados de autenticación de Playwright pueden contener cookies o tokens. Archivos como `auth.json`, `storageState` y trazas con datos sensibles deben quedar fuera de Git y tratarse como secretos/artefactos temporales.

### Objetivo WebForge

Cada proyecto importante debería tener un pequeño conjunto de pruebas de humo que valide automáticamente los flujos de negocio esenciales antes de desplegar.

---

## 4. Lighthouse CI

- Upstream: `GoogleChrome/lighthouse-ci`
- Licencia: Apache-2.0.
- Función: ejecutar Lighthouse de forma continua y detectar regresiones.

### Qué puede vigilar

- performance;
- accesibilidad;
- SEO;
- buenas prácticas;
- tamaño/presupuesto de scripts e imágenes;
- cambios entre versiones.

### Uso recomendado

- ejecutar en Pull Requests o antes de producción;
- definir budgets realistas;
- impedir que una imagen o script nuevo degrade drásticamente la página;
- guardar tendencia de métricas cuando valga la pena.

### Regla

Los puntajes Lighthouse son señales, no objetivos absolutos. No sacrificar funciones reales o accesibilidad solo por alcanzar un número. Mirar especialmente Core Web Vitals, recursos pesados y regresiones comparativas.

---

## 5. axe-core

- Upstream: `dequelabs/axe-core`
- Licencia: Mozilla Public License 2.0.
- Función: motor automatizado de pruebas de accesibilidad para HTML/UI web.

### Uso recomendado

- integrar con Playwright o tests de componentes;
- comprobar WCAG y buenas prácticas comunes;
- detectar fallos de ARIA, headings, formularios, contraste y estructura según las reglas disponibles;
- ejecutar en páginas y estados importantes del flujo.

### Límite importante

El propio proyecto indica que la automatización solo puede detectar una parte de los problemas WCAG. Siempre complementar con revisión manual: teclado, foco, lectura, jerarquía, mensajes de error y experiencia real.

### Combinación recomendada

`Playwright + axe-core` para pruebas funcionales y accesibilidad en el mismo flujo.

---

## 6. OWASP ZAP

- Upstream: `zaproxy/zaproxy`
- Licencia declarada: Apache-2.0.
- Función: scanner y proxy de seguridad para aplicaciones web.

### Uso recomendado

- aplicaciones propias;
- demos/staging;
- proyectos de clientes con autorización explícita;
- análisis pasivo como primera fase;
- validaciones activas únicamente con alcance y ventana de prueba definidos.

### Qué aporta

Nos permite revisar la aplicación desde el punto de vista de un navegador/proxy y encontrar clases de vulnerabilidades que un scanner de dependencias no puede ver por sí solo.

### Regla de operación

No ejecutar active scan contra terceros ni producción del cliente sin autorización específica. Definir dominio, subdominios, endpoints, ventana, responsable y criterio de detención. Preferir staging cuando sea posible.

---

## 7. Uptime Kuma

- Upstream: `louislam/uptime-kuma`
- Licencia: MIT.
- Función: monitoreo self-hosted.

### Puede vigilar

- HTTP/HTTPS;
- TCP;
- keywords/JSON;
- WebSocket;
- ping;
- DNS;
- certificados;
- Docker;
- páginas de estado;
- notificaciones por email y múltiples servicios.

### Uso recomendado

Útil cuando queramos una consola propia para saber si sitios y servicios de clientes siguen disponibles después del despliegue.

### Infraestructura

No se instala dentro de una web Vercel. Requiere un host persistente propio (por ejemplo VPS, servidor, NAS o máquina dedicada adecuada). Antes de desplegarlo, evaluar coste, respaldo, actualizaciones y exposición del panel administrativo.

### Seguridad

- habilitar 2FA;
- proteger el panel;
- usar HTTPS/reverse proxy cuando se exponga;
- aplicar actualizaciones;
- no almacenar credenciales innecesarias;
- evitar publicar endpoints internos en páginas de estado públicas.

---

## Herramienta evaluada pero no priorizada para proyectos nuevos: Gitleaks

Gitleaks sigue siendo un scanner válido y ampliamente usado, pero el README upstream actual declara el proyecto como feature-complete y enfocado en parches de seguridad, mientras el autor está trasladando su foco a Betterleaks.

Decisión:

- proyectos existentes con Gitleaks: puede mantenerse;
- nuevos estándares de Gráfica SF/Pillaki: evaluar Betterleaks primero;
- Trivy también puede aportar secret scanning, por lo que evitaremos duplicar herramientas sin necesidad.

---

## Pipeline objetivo para un futuro proyecto WebForge

```text
DESARROLLO
  ↓
Betterleaks
  secretos antes de llegar al repositorio
  ↓
Trivy
  dependencias + CVEs + misconfig + SBOM
  ↓
Playwright
  flujos funcionales y cross-browser
  ↓
axe-core
  accesibilidad automatizada
  ↓
Lighthouse CI
  performance + SEO + accesibilidad + budgets
  ↓
STAGING
  ↓
OWASP ZAP
  revisión web defensiva autorizada
  ↓
PRODUCCIÓN
  ↓
Uptime Kuma / monitoreo equivalente
  disponibilidad + certificados + alertas
```

## Reglas permanentes

1. Estas herramientas se aplican solo al repositorio/proyecto autorizado.
2. No compartir secretos, resultados sensibles ni datos de clientes entre proyectos.
3. Los scanners no reemplazan revisión humana ni OWASP Cheat Sheet Series.
4. No ejecutar pruebas activas contra infraestructura que no sea propia o expresamente autorizada.
5. Los reportes deben redactar tokens, cookies, passwords y PII.
6. Antes de integrar una herramienta, fijar una versión y revisar su licencia vigente.
7. No agregar herramientas por moda: si dos cubren lo mismo, elegir la que aporte mejor cobertura/mantenimiento al caso real.
8. El código productivo no se modifica solo por aparecer una nueva herramienta en esta biblioteca.

## Próximo orden recomendado

Cuando se autorice implementación real, comenzar por:

1. Betterleaks o secret scanning equivalente en repositorios nuevos.
2. Trivy para seguridad de dependencias/filesystem.
3. Playwright para smoke tests.
4. axe-core dentro del QA.
5. Lighthouse CI como quality gate.
6. ZAP en staging.
7. Uptime Kuma únicamente cuando exista infraestructura adecuada para alojarlo.

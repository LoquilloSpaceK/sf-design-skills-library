# Gráfica SF + Pillaki — Toolkit Operativo Wave 6

Sexta selección curada de herramientas públicas para observabilidad, alertas, investigación de incidentes, escalamiento humano y comunicación de estado.

Este documento es un mapa operativo. No instala nada automáticamente ni modifica repositorios productivos. Cada herramienta se adopta solo en el proyecto autorizado, con revisión de versión, licencia, arquitectura, privacidad, costo operacional y necesidad real.

## Objetivo de la Wave 6

Responder mejor estas preguntas durante operación e incidentes:

1. **¿Qué está pasando ahora?** — métricas y señales de salud.
2. **¿Cuándo una señal exige atención?** — reglas y alertas.
3. **¿Qué muestran los datos en conjunto?** — dashboards y exploración.
4. **¿Qué ocurrió exactamente en la aplicación?** — logs.
5. **¿Dónde se volvió lenta o falló una petición?** — trazas distribuidas.
6. **¿Quién debe reaccionar?** — escalamiento/on-call.
7. **¿Cómo comunicamos el incidente a usuarios/clientes?** — status page.

## Arquitectura recomendada

```text
APP / API / JOBS
  ↓
OpenTelemetry / exporters / métricas
  ├─ Prometheus      → métricas
  ├─ Loki            → logs
  └─ Tempo           → trazas
       ↓
     Grafana         → dashboards / exploración
       ↓
 Prometheus rules / Alertmanager
       ↓
     GoAlert         → on-call / escalamiento humano
       ↓
     cState          → comunicación pública de incidentes
```

Uptime Kuma y Healthchecks continúan cubriendo disponibilidad externa y tareas programadas. Wave 6 no los reemplaza: añade profundidad para entender **por qué** algo falla y cómo coordinar la respuesta.

---

## 1. Prometheus

- Upstream: `prometheus/prometheus`
- Licencia declarada: Apache License 2.0.
- Proyecto CNCF.
- Función: métricas, series temporales, reglas y alertas.

### Qué aporta

Prometheus recopila métricas desde targets configurados, evalúa expresiones y reglas y puede disparar alertas cuando observa condiciones definidas.

Capacidades relevantes:

- modelo multidimensional de series temporales;
- PromQL;
- service discovery;
- reglas de recording/alerting;
- arquitectura autónoma por nodo;
- integración natural con Alertmanager y Grafana.

### Casos para WebForge / Pillaki

- latencia de APIs;
- tasa de errores;
- uso de CPU/memoria cuando controlemos servidores;
- jobs ejecutados/fallidos;
- colas pendientes;
- métricas de base de datos expuestas de forma segura;
- indicadores de negocio agregados que no contengan PII.

### Regla de diseño

No convertir métricas en un segundo sistema de analytics de personas. Etiquetas de alta cardinalidad como `user_id`, emails, RUT, tokens, URLs con datos sensibles o IDs únicos pueden crear problemas de privacidad, costo y rendimiento.

---

## 2. Alertmanager

- Upstream: `prometheus/alertmanager`
- Ecosistema Prometheus.
- Función: deduplicar, agrupar, silenciar, inhibir y enrutar alertas.

### Por qué entra

Una alerta útil no es simplemente “algo superó un número”. Alertmanager permite transformar muchas señales repetidas en una notificación manejable y enviarla al receptor correcto.

Capacidades upstream destacadas:

- agrupación de alertas relacionadas;
- deduplicación;
- routing por labels;
- silencios;
- reglas de inhibición;
- receptores por email, webhooks y servicios compatibles.

### Regla de alertas

Una alerta debe ser **accionable**. Si nadie sabe qué hacer cuando llega, probablemente es ruido.

Cada alerta crítica debe documentar como mínimo:

- qué significa;
- servicio afectado;
- severidad;
- posible impacto;
- dashboard/log/trace relacionado;
- primera acción recomendada;
- responsable o ruta de escalamiento.

Evitar alertas por cada error individual. Preferir síntomas de impacto sostenido: error rate, latencia, disponibilidad, saturación o pérdida de funciones críticas.

---

## 3. Grafana

- Upstream: `grafana/grafana`
- Licencia principal revisada: **AGPL-3.0-only**, con excepciones Apache-2.0 documentadas por upstream para componentes concretos.
- Función: consulta, visualización, exploración y alertas sobre múltiples data sources.

### Qué aporta

Grafana permite reunir métricas, logs y otras fuentes en dashboards y herramientas de exploración.

Casos:

- tablero operativo de Pillaki;
- dashboard por cliente cuando la arquitectura lo justifique;
- errores y latencia por servicio;
- tendencias de disponibilidad;
- correlación entre despliegues y degradaciones;
- panel de salud previo a una entrega.

### Regla AGPL

No copiar, modificar, incrustar o redistribuir Grafana como parte de un producto cliente sin revisar previamente las obligaciones de AGPL-3.0 y los términos aplicables a la versión/componentes concretos.

Para un proyecto simple, preferir primero dashboards gestionados por el proveedor existente si reducen infraestructura y riesgo operativo.

### Privacidad

Los dashboards administrativos no deben ser públicos por comodidad. Aplicar autenticación, mínimo privilegio y separación por cliente/tenant cuando corresponda.

---

## 4. Grafana Loki

- Upstream: `grafana/loki`
- Licencia principal revisada: **AGPL-3.0-only**, con excepciones Apache-2.0 documentadas por upstream.
- Función: agregación y consulta de logs.

### Qué aporta

Loki utiliza un enfoque de labels inspirado en Prometheus y evita indexar todo el contenido del log, buscando simplificar y reducir costo operacional frente a otros sistemas de logging.

El README actual indica además que **Grafana Alloy reemplazó a Promtail** como dirección futura para recolección de logs. No diseñar nuevos despliegues suponiendo que Promtail seguirá siendo el collector preferente.

### Regla crítica de logging

Nunca registrar deliberadamente:

- contraseñas;
- tokens de sesión/API;
- secretos;
- cookies de autenticación;
- números de tarjetas;
- cuerpos completos de formularios con datos personales;
- RUT/email/teléfono sin una necesidad legítima y política definida;
- credenciales de base de datos.

### Logging útil

Preferir logs estructurados con:

- timestamp;
- nivel;
- servicio;
- entorno;
- request/correlation ID aleatorio;
- operación;
- resultado;
- error code estable;
- duración cuando aporte valor.

La retención debe definirse según utilidad y privacidad; “guardar todo para siempre” no es una estrategia de seguridad.

---

## 5. Grafana Tempo

- Upstream: `grafana/tempo`
- Licencia principal revisada: **AGPL-3.0-only**, con excepciones Apache-2.0 documentadas por upstream.
- Función: backend de distributed tracing.

### Qué aporta

Tempo permite seguir una petición a través de servicios y detectar dónde aparecen latencias o errores. Upstream declara compatibilidad con OpenTelemetry, Jaeger y Zipkin, y una integración profunda con Grafana/Prometheus/Loki.

### Uso recomendado

- APIs con varias dependencias;
- flujos que pasan por app → API → DB → servicio externo;
- webhooks;
- automatizaciones complejas;
- portales donde “funciona lento” requiere identificar el tramo exacto.

### Sampling

No asumir que debemos guardar el 100 % de todas las trazas en producción. Definir sampling según volumen, criticidad y presupuesto, conservando mayor detalle para errores o transacciones críticas cuando la arquitectura lo permita.

### Datos sensibles

No poner payloads completos, headers de autorización, query strings sensibles o datos personales como atributos de spans.

---

## 6. GoAlert

- Upstream: `target/goalert`
- Licencia declarada: Apache License 2.0.
- Función: on-call scheduling, escalamiento y notificaciones.

### Qué aporta

GoAlert está diseñado para contactar automáticamente a la persona adecuada mediante horarios on-call, escalaciones y notificaciones como SMS o llamadas, según configuración.

### Cuándo tendría sentido

No para una landing simple. Sí cuando tengamos:

- varios clientes con sistemas críticos;
- guardias o responsables definidos;
- servicios 24/7;
- alertas que no pueden depender de “ver el correo mañana”;
- acuerdos de soporte/SLA que exijan escalamiento.

### Regla humana

No automatizar escalamiento sin responsables reales. Antes de activar on-call deben existir:

- owner del servicio;
- horario;
- canal primario y alternativo;
- tiempos de escalamiento;
- qué severidades despiertan a una persona;
- procedimiento de handoff;
- ruta de respaldo si nadie responde.

Las credenciales de demo de upstream son solo para el contenedor de demostración; nunca reutilizarlas en producción.

---

## 7. cState

- Upstream: `cstate/cstate`
- Licencia declarada: MIT.
- Función: status page estática construida con Hugo.
- Repositorio activo al revisar esta Wave.

### Por qué entra

cState separa la comunicación pública del sistema que está fallando. Al ser estático, puede hospedarse en una infraestructura distinta al backend principal.

Puede servir para publicar:

- incidente abierto;
- componentes afectados;
- severidad;
- actualizaciones cronológicas;
- resolución;
- historial de incidentes.

### Límite importante

cState **no realiza monitoreo automático por sí solo**. Es un hub informativo. Uptime Kuma/Prometheus/Alertmanager detectan condiciones; cState comunica el estado a usuarios/clientes.

### Regla de resiliencia

Si una status page informa caídas del sistema principal, idealmente no debe depender exactamente del mismo servidor, base de datos o ruta crítica que está describiendo.

---

## Herramienta evaluada y NO priorizada: Cachet 3.x

Durante esta Wave se revisó `cachethq/cachet`. El proyecto sigue siendo una solución self-hosted de status page, pero su rama 3.x usa actualmente una **licencia propia** con condiciones específicas, entre ellas restricciones sobre redistribución standalone.

Por esa razón no queda como recomendación principal de nuestra biblioteca. Si un cliente solicita Cachet específicamente, revisar la licencia vigente y el modelo de entrega antes de adoptarlo.

Esto es precisamente parte de nuestra regla de GitHub: una herramienta técnicamente buena puede quedar fuera por mantenimiento, licencia, costo, seguridad o encaje arquitectónico.

---

## Relación con herramientas ya existentes

### OpenTelemetry vs Prometheus/Loki/Tempo

- **OpenTelemetry** → instrumentación y transporte de señales.
- **Prometheus** → almacena/consulta métricas y evalúa reglas.
- **Loki** → logs.
- **Tempo** → trazas.
- **Grafana** → explora/visualiza esas señales.

No son reemplazos directos: forman una cadena.

### Uptime Kuma vs Prometheus

- **Uptime Kuma** → “¿mi endpoint responde desde fuera?”.
- **Prometheus** → “¿qué está ocurriendo dentro del sistema?”.

Una aplicación puede responder HTTP 200 y aun estar degradada; también puede parecer sana internamente mientras falla desde Internet. Ambas perspectivas son útiles.

### Healthchecks vs Alertmanager

- **Healthchecks** → “esta tarea programada no hizo check-in”.
- **Alertmanager** → enruta alertas generadas por reglas/servicios.

### Alertmanager vs GoAlert

- **Alertmanager** → decide cómo agrupar y a qué receptor enviar alertas.
- **GoAlert** → decide qué persona está on-call y cómo escalar si no responde.

### cState vs monitoreo

- **monitoreo** → detecta el problema.
- **cState** → comunica el incidente.

---

## Flujo de incidente recomendado

```text
1. DETECTAR
   Uptime Kuma / Healthchecks / Prometheus

2. CLASIFICAR
   regla + severidad + impacto

3. ENRUTAR
   Alertmanager

4. ESCALAR
   GoAlert cuando el servicio lo justifique

5. INVESTIGAR
   Grafana → métricas + Loki logs + Tempo traces

6. CONTENER / RECUPERAR
   rollback, feature flag, restore u otra acción autorizada

7. COMUNICAR
   cState / canal oficial del cliente

8. VERIFICAR
   métricas + pruebas funcionales + monitoreo externo

9. DOCUMENTAR
   timeline, causa, impacto, acciones y prevención
```

## Severidades de referencia

El proyecto puede adaptar nombres, pero mantener criterios objetivos.

### SEV-1 — crítico

- servicio principal indisponible;
- pérdida/corrupción potencial de datos;
- incidente de seguridad activo con impacto significativo;
- función crítica bloqueada para la mayoría de usuarios.

### SEV-2 — alto

- degradación importante;
- función relevante caída con workaround limitado;
- errores elevados sostenidos;
- cliente importante afectado.

### SEV-3 — medio

- fallo acotado;
- existe workaround;
- impacto menor o intermitente.

### SEV-4 — bajo

- anomalía sin impacto inmediato;
- mantenimiento/mejora preventiva.

No inflar severidades. Si todo es SEV-1, ninguna alerta conserva prioridad real.

---

## Principios permanentes Wave 6

1. Observar no significa guardar todos los datos posibles.
2. Métricas, logs y trazas deben minimizar PII y secretos.
3. Usar correlation IDs aleatorios en vez de datos personales para unir eventos.
4. Definir retención por señal y proyecto.
5. Una alerta debe tener owner y acción posible.
6. Evitar alert fatigue: agrupar, deduplicar y ajustar umbrales con evidencia.
7. No exponer dashboards administrativos a Internet sin controles de acceso.
8. Separar datos de clientes; nunca mezclar tenants accidentalmente.
9. Probar alertas periódicamente: una alerta que nunca fue probada puede fallar justo durante el incidente.
10. Probar canales secundarios de escalamiento.
11. No depender de la infraestructura afectada para comunicar su caída cuando sea evitable.
12. Registrar cambios/deploys para correlacionarlos con incidentes.
13. Un dashboard no reemplaza un runbook.
14. Un log no reemplaza una métrica; una métrica no reemplaza una traza.
15. No adoptar el stack completo en proyectos pequeños si el proveedor ya ofrece telemetría suficiente.
16. AGPL y otras licencias deben revisarse antes de modificar, redistribuir o empaquetar herramientas con entregables comerciales.
17. No instalar ninguna herramienta de Wave 6 automáticamente en Gráfica SF, Pillaki o clientes.

---

## Orden recomendado por tamaño de proyecto

### Web/landing pequeña

1. monitoreo del proveedor;
2. Uptime Kuma cuando aporte valor;
3. Healthchecks para cron si existe;
4. logs seguros del proveedor;
5. no desplegar Prometheus/Grafana solo por tenerlos disponibles.

### Portal / aplicación mediana

1. OpenTelemetry selectivo;
2. métricas relevantes;
3. Prometheus/servicio gestionado equivalente si compensa el costo;
4. dashboards operativos;
5. Alertmanager para alertas accionables;
6. logs estructurados;
7. traces solo donde ayuden a explicar flujos complejos.

### Plataforma o cliente crítico

1. SLI/SLO definidos;
2. Prometheus o backend de métricas equivalente;
3. logs centralizados;
4. tracing distribuido;
5. dashboards y runbooks;
6. Alertmanager;
7. on-call/escalamiento real;
8. página de estado independiente;
9. simulacros de incidentes y restore;
10. postmortem con acciones verificables.

---

## Resultado de la Wave 6

Esta Wave completa una nueva etapa del toolkit:

**OpenTelemetry genera contexto → Prometheus mide → Loki registra → Tempo sigue la petición → Grafana reúne la evidencia → Alertmanager decide a dónde alertar → GoAlert encuentra al responsable → cState comunica el estado.**

La adopción siempre debe ser proporcional al tamaño y criticidad del proyecto.
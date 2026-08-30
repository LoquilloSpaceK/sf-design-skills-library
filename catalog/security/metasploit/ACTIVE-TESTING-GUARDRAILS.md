# Metasploit — Guardrails para Pruebas Activas

Este documento define cómo manejar dentro de WebForge cualquier material que incluya explotación activa, sesiones remotas, payloads, escaneo de red o validaciones con capacidad de modificar un sistema.

## Regla principal

La biblioteca pública no debe almacenar recetas operativas de explotación, payloads ejecutables, parámetros reales de objetivos, credenciales, sesiones, persistencia, evasión ni instrucciones que permitan reutilizar una técnica ofensiva fuera del contexto autorizado.

Cuando un pentest autorizado requiera una validación activa, el detalle operativo debe mantenerse en documentación privada y específica del encargo, con alcance, autorización, responsables y fecha.

## Categorías de alto riesgo

Tratar como material de prueba activa, entre otros:

- selección y ejecución de módulos de explotación;
- configuración de objetivos o listeners con direcciones reales;
- shells o sesiones remotas;
- generación de payloads o binarios;
- escaneo de subredes o rangos amplios;
- movimiento lateral, persistencia o evasión;
- obtención o reutilización de credenciales.

## Uso aceptable dentro de WebForge

- laboratorios aislados y deliberadamente vulnerables;
- staging o clones controlados del entorno del cliente;
- activos propios;
- activos de clientes con autorización explícita y alcance por escrito;
- validación mínima necesaria de una vulnerabilidad ya identificada;
- retest posterior a un parche o mitigación.

## Requisitos antes de una prueba activa

1. Confirmar propietario y autorización.
2. Definir activos exactos incluidos en alcance.
3. Definir ventana de prueba y contacto de emergencia.
4. Registrar técnicas permitidas y prohibidas.
5. Preparar snapshot, backup o mecanismo de recuperación cuando exista riesgo de alterar estado.
6. Preferir laboratorio o staging antes de producción.
7. Definir criterio de detención.
8. Acordar tratamiento y eliminación de evidencias y datos temporales.

## Requisitos durante la prueba

- detenerse si aparece degradación inesperada, acceso fuera de alcance o exposición de datos no prevista;
- usar únicamente la técnica mínima necesaria para demostrar o descartar el riesgo;
- no explorar más allá de lo requerido por el hallazgo;
- no retener secretos ni datos que no sean necesarios para el informe;
- registrar hora, activo, resultado e impacto observado.

## Requisitos posteriores

- aplicar o recomendar mitigación;
- repetir solo la comprobación necesaria para verificar la corrección;
- revocar credenciales o accesos temporales;
- eliminar payloads, archivos y datos de prueba que ya no sean necesarios;
- conservar únicamente evidencia mínima y autorizada;
- documentar el estado final y cualquier riesgo residual.

## Qué sí puede quedar en esta biblioteca pública

- instalación desde fuentes oficiales;
- referencias de licencia;
- comandos de ayuda, versión y estado;
- checklists de autorización;
- prácticas de aislamiento;
- metodología de retest y remediación;
- plantillas de informe;
- límites éticos y operativos.

## Qué debe permanecer fuera de esta biblioteca

- comandos de explotación específicos;
- payloads o binarios generados;
- objetivos reales;
- configuraciones de listeners;
- credenciales, tokens o llaves;
- procedimientos de persistencia, evasión o movimiento lateral;
- evidencia sensible de clientes.

La finalidad de estas reglas es que WebForge pueda incorporar herramientas de validación técnica sin convertir su biblioteca común en un manual reutilizable de intrusión.
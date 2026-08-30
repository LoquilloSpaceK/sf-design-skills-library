# WebForge AI — Seguridad Base

Estándar mínimo de seguridad para proyectos propios y de clientes construidos con WebForge AI.

## Principio rector

La seguridad no se agrega al final. Cada proyecto debe diseñarse con aislamiento, mínimo privilegio, validación en servidor, gestión correcta de secretos, trazabilidad y capacidad de recuperación desde el inicio.

## 1. Aislamiento por proyecto y cliente

- Mantener repositorios, despliegues, bases de datos, almacenamiento y variables de entorno separados por cliente cuando sea viable.
- No compartir credenciales, claves API ni service roles entre clientes.
- No reutilizar datos reales de un cliente en demos, pruebas o proyectos de otro cliente.
- Demos y entornos temporales deben usar datos ficticios o anonimizados.
- El acceso administrativo debe otorgarse solo a quienes lo necesiten y revocarse cuando deje de ser necesario.

## 2. GitHub y código fuente

- Código de clientes: repositorio privado por defecto salvo autorización expresa para hacerlo público.
- Proteger la rama principal y evitar cambios directos a producción cuando el proyecto lo permita.
- Revisar pull requests antes de fusionar cambios sensibles.
- Activar MFA en las cuentas con acceso al código y proveedores críticos.
- Usar permisos de mínimo privilegio para colaboradores, apps y tokens.
- No guardar secretos, archivos `.env`, claves privadas, tokens ni credenciales en commits, issues o documentación pública.
- Revisar dependencias, licencias y mantenimiento antes de incorporar código de terceros.

## 3. Secretos y variables de entorno

- Mantener `.env*` reales fuera de Git; versionar solo `.env.example` sin valores secretos.
- Guardar secretos en el gestor de variables del proveedor de despliegue o en un secret manager apropiado.
- Rotar inmediatamente cualquier secreto que haya sido expuesto.
- Separar credenciales de desarrollo, staging y producción.
- Nunca imprimir secretos completos en logs, errores, analytics o respuestas HTTP.

## 4. Formularios y entradas de usuario

- Validar todo input en servidor aunque también exista validación en cliente.
- Aplicar límites de longitud, tipos, enums y formatos con Zod u otra validación centralizada.
- Implementar honeypot, rate limiting y controles antiabuso en formularios públicos cuando corresponda.
- No persistir campos técnicos anti-spam.
- Limitar y validar uploads por tipo, tamaño y contenido; no confiar solo en la extensión del archivo.
- Escapar o renderizar de forma segura contenido controlado por usuarios para reducir riesgo de XSS.

## 5. API y backend

- Autenticar y autorizar cada operación sensible; autenticación no equivale a autorización.
- Aplicar rate limiting, cuotas o límites de tamaño en endpoints públicos y costosos.
- Mantener CORS restringido a orígenes necesarios cuando aplique.
- Verificar firmas de webhooks y evitar confiar en payloads no autenticados.
- Evitar exponer stack traces, SQL, credenciales o detalles internos en errores del cliente.
- Diferenciar errores de validación, autenticación, rate limit y fallos internos con códigos HTTP coherentes.
- Para acciones críticas, considerar idempotencia, colas y reintentos controlados.

## 6. Autenticación y sesiones

- Preferir proveedores y librerías mantenidas para autenticación.
- Usar cookies `HttpOnly`, `Secure` y `SameSite` adecuadas cuando se utilicen sesiones por cookie.
- Proteger operaciones que cambian estado frente a CSRF cuando la arquitectura lo requiera.
- Expirar sesiones y tokens de manera razonable y permitir revocación cuando corresponda.
- Nunca implementar almacenamiento casero de contraseñas; si una aplicación administra credenciales, usar hashing resistente y prácticas estándar del framework/proveedor.

## 7. Navegador y headers

- HTTPS obligatorio en producción.
- Configurar headers de seguridad apropiados para el proyecto, incluyendo una Content Security Policy razonable cuando sea posible.
- Revisar `frame-ancestors`/protección contra framing, `Referrer-Policy`, `Permissions-Policy` y `X-Content-Type-Options` según el caso.
- Evitar scripts externos innecesarios; cada CDN o script de tercero amplía la superficie de ataque y privacidad.

## 8. Base de datos y datos personales

- Aplicar mínimo privilegio a usuarios y roles de base de datos.
- Nunca exponer credenciales administrativas o service roles al navegador.
- Recoger solo los datos necesarios para la finalidad del proyecto.
- Definir retención y eliminación de datos cuando corresponda.
- Evitar información personal sensible en logs y analytics.
- Mantener backups adecuados y comprobar periódicamente que pueden restaurarse.
- Usar conexiones cifradas y las capacidades de cifrado del proveedor para datos almacenados cuando estén disponibles.

## 9. Dependencias y cadena de suministro

- Mantener lockfiles versionados.
- Revisar actualizaciones y alertas de seguridad de dependencias.
- Evitar paquetes abandonados o de procedencia dudosa cuando exista una alternativa mantenida.
- Verificar licencias de librerías, fuentes, imágenes, modelos y assets externos.
- No ejecutar scripts de instalación desconocidos con privilegios elevados sin revisión previa.

## 10. Monitoreo y recuperación

- Registrar errores importantes y disponibilidad sin filtrar secretos o PII innecesaria.
- Definir alertas para fallos de formularios, APIs, base de datos y despliegues críticos.
- Mantener una forma documentada de restaurar servicio y datos.
- Registrar cambios relevantes mediante Git y el historial del proveedor.

## 11. Respuesta a incidentes

Ante una posible exposición:

1. Contener: deshabilitar credenciales, endpoints o acceso afectado cuando corresponda.
2. Rotar: reemplazar secretos y tokens potencialmente comprometidos.
3. Revisar: identificar alcance mediante logs y cambios de configuración.
4. Recuperar: restaurar servicio desde una configuración conocida y segura.
5. Documentar: registrar causa, impacto, corrección y medida preventiva.
6. Comunicar al cliente de acuerdo con el contrato, la naturaleza del dato y las obligaciones aplicables.

## 12. OSINT y exposición pública

Herramientas OSINT pueden utilizarse para revisar la huella pública de nuestras propias marcas o de clientes que hayan autorizado explícitamente la auditoría.

Usos válidos incluyen:

- detectar nombres de usuario corporativos ocupados o abandonados;
- localizar perfiles públicos que usen la marca;
- revisar exposición pública antes de un lanzamiento;
- apoyar investigación defensiva de suplantación o incidentes.

No se deben utilizar estas herramientas para vigilancia indiscriminada, acoso, impersonación, acceso a cuentas, evasión de controles ni recopilación de información privada. El uso de proxy, Tor u otro mecanismo de red no sustituye la autorización.

Para búsquedas de nombres de usuario, consultar la guía interna:

`catalog/security/sherlock/CLIENT-USE-GUIDE.md`

## 13. Validación activa y pentesting autorizado

Las herramientas de validación activa, incluido Metasploit, solo deben utilizarse sobre activos propios o de clientes con autorización explícita, alcance definido y ventana de prueba acordada.

- Preferir laboratorio, staging o clones del entorno antes de producción.
- Documentar activos incluidos, técnicas permitidas, responsable y criterio de detención.
- No ampliar el alcance a terceros, proveedores, empleados o redes vecinas.
- Detener una prueba si aparece degradación, pérdida de datos o comportamiento inesperado.
- Recoger solo la evidencia mínima necesaria para demostrar el riesgo.
- Repetir la validación después de aplicar la corrección para comprobar que la exposición quedó cerrada.
- Mantener herramientas de pentesting fuera de los servidores productivos salvo necesidad excepcional y autorización específica.

Guía interna para Metasploit:

`catalog/security/metasploit/CLIENT-USE-GUIDE.md`

## 14. Referencia OWASP obligatoria

OWASP Cheat Sheet Series se adopta como referencia defensiva primaria para revisar controles de seguridad de aplicación.

Mapa interno de selección:

`catalog/security/owasp-cheat-sheet-series/WEBFORGE-SECURITY-MAP.md`

Antes de producción, seleccionar las cheat sheets pertinentes al proyecto y contrastar nuestra implementación con el upstream oficial. Priorizar autenticación/autorización, sesiones, validación de entrada, APIs, headers/CSP, secretos, uploads, logging, privacidad, dependencias y cadena de suministro según el alcance real.

No copiar recomendaciones de forma ciega ni mantener duplicados del contenido OWASP: consultar la versión oficial y adaptar cada control a la arquitectura y al modelo de amenazas del cliente.

## Checklist mínimo antes de producción

- [ ] No existen secretos o `.env` reales en Git.
- [ ] Accesos y MFA revisados.
- [ ] Dependencias y licencias revisadas.
- [ ] Validación de servidor activa.
- [ ] Rate limiting/antiabuso aplicado donde corresponde.
- [ ] Autorización comprobada para acciones sensibles.
- [ ] Headers y HTTPS revisados.
- [ ] Base de datos con mínimo privilegio.
- [ ] Backups y restauración considerados.
- [ ] Logs sin secretos ni PII innecesaria.
- [ ] Errores de producción no revelan detalles internos.
- [ ] Formularios y flujos críticos probados.
- [ ] Guías OWASP pertinentes revisadas y controles documentados.
- [ ] Dominio, DNS y cuentas administrativas bajo control del propietario correcto.

Este documento es una base técnica, no sustituye una evaluación específica de riesgos, requisitos contractuales o normativa aplicable a cada cliente.
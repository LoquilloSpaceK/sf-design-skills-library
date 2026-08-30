# Metasploit — Guía de Uso Defensivo para Clientes

Metasploit puede utilizarse para validar técnicamente riesgos de seguridad en infraestructura propia o de clientes con autorización explícita. Dentro de WebForge se considera una herramienta externa de auditoría, no una dependencia del producto ni un componente de producción.

## Condición previa obligatoria

Antes de cualquier prueba debe existir un alcance claro y autorizado que indique, como mínimo:

- organización que autoriza;
- activos incluidos: dominios, IP, aplicaciones o entornos concretos;
- fechas y ventana de prueba;
- técnicas permitidas y técnicas excluidas;
- responsable técnico y canal de emergencia;
- tratamiento de logs, evidencias y datos;
- criterio de detención si aparece impacto inesperado.

No ampliar el alcance automáticamente a terceros, proveedores, empleados, redes vecinas ni activos no incluidos.

## Usos defensivos recomendados

- reproducir de forma controlada una vulnerabilidad ya identificada para confirmar impacto;
- validar que un parche o mitigación realmente cerró una exposición;
- realizar pruebas en staging, laboratorio o entornos clonados antes de producción;
- apoyar un pentest autorizado con evidencia reproducible y mínima;
- comprobar configuraciones de seguridad sin causar indisponibilidad;
- formar al equipo en laboratorios aislados.

## Separación de entorno

- Ejecutar Metasploit desde una estación o laboratorio dedicado.
- No instalarlo en servidores productivos del cliente salvo una razón técnica excepcional y autorización específica.
- Mantener credenciales, VPN, llaves y evidencias fuera de repositorios públicos.
- Usar cuentas de prueba y datos ficticios cuando sea posible.
- Tomar snapshots/backups antes de pruebas con riesgo de alterar estado.

## Flujo operativo WebForge

1. Definir alcance y autorización.
2. Inventariar el activo objetivo y su criticidad.
3. Ejecutar primero análisis pasivos/no destructivos y revisar configuraciones.
4. Si se requiere validación activa, preferir staging o un clon del entorno.
5. Registrar fecha, activo, versión, hallazgo y evidencia mínima necesaria.
6. Detener la prueba ante degradación, datos inesperados o salida de alcance.
7. Aplicar mitigación o parche.
8. Repetir únicamente la validación necesaria para confirmar corrección.
9. Eliminar credenciales y datos temporales usados en la prueba.
10. Entregar un informe orientado a riesgo y remediación.

## Inicio seguro de la herramienta

Una vez instalada desde una fuente oficial y en un entorno autorizado:

```bash
msfconsole
```

Comandos de orientación/estado permitidos en esta guía:

```text
help
version
db_status
```

Las técnicas específicas de explotación deben seleccionarse únicamente dentro de un pentest autorizado, con evaluación de impacto y documentación separada del repositorio público.

## Evidencia mínima sugerida

```text
Cliente:
Activo autorizado:
Fecha/hora:
Entorno: laboratorio / staging / producción autorizada
Hallazgo previo:
Riesgo esperado:
Resultado de validación:
Impacto observado:
Mitigación recomendada:
Estado posterior a la corrección:
Responsable:
```

## Límites

No usar Metasploit desde este flujo para:

- sistemas sin autorización;
- obtención de credenciales ajenas;
- persistencia o acceso continuado;
- evasión de monitoreo o defensas;
- movimiento lateral fuera del alcance;
- extracción de información que no sea necesaria para demostrar el riesgo;
- pruebas destructivas sin aprobación específica;
- ocultar el origen o la naturaleza de una prueba no autorizada.

La finalidad es reducir riesgo y demostrar correcciones, no obtener acceso por sí mismo.
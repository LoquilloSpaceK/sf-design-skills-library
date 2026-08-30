# Metasploit Framework — Upstream

Referencia interna para evaluación de seguridad defensiva en activos propios o expresamente autorizados.

## Proyecto oficial

- Proyecto: `rapid7/metasploit-framework`
- Fuente: https://github.com/rapid7/metasploit-framework
- Organización: Rapid7
- Rama principal: `master`
- Snapshot revisado al incorporar esta guía: `e698ea413163b31759d78603e5018552bf14ae8e`
- Licencia principal: BSD de 3 cláusulas; revisar `COPYING` y `LICENSE` del upstream porque algunos componentes pueden tener condiciones adicionales.

## Estado de instalación revisado

El README oficial actual recomienda utilizar los instaladores oficiales de Metasploit para Linux/macOS y remite a la página de Nightly Installers. Kali incluye Metasploit preinstalado.

El clonado del repositorio se considera principalmente un flujo de desarrollo y debe seguir la guía oficial de entorno de desarrollo, no asumirse como instalación estándar de producción.

### Recomendación WebForge

1. Preferir el instalador oficial documentado por Rapid7 para la plataforma correspondiente.
2. Verificar siempre la documentación vigente antes de copiar scripts de instalación antiguos encontrados en tutoriales.
3. No ejecutar instaladores descargados con `curl` sin revisar su origen, contenido y vigencia.
4. Mantener Metasploit fuera de los servidores de producción de clientes; usar una estación o laboratorio de auditoría separado.
5. No incorporar Metasploit como dependencia de una aplicación WebForge.

## Inicio básico

Después de una instalación autorizada y validada:

```bash
msfconsole
```

Dentro de la consola, comenzar por comandos de orientación y estado como `help`, `version` y, cuando exista base de datos configurada, `db_status`.

## Regla de seguridad

Metasploit es una plataforma de pruebas de penetración de doble uso. Dentro de esta biblioteca se conserva únicamente como referencia para validación defensiva controlada. No se documentan aquí procedimientos de explotación, persistencia, evasión, payloads ni acceso a sistemas.

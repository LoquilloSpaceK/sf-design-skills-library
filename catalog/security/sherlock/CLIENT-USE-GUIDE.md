# Sherlock — Guía de Uso Defensivo para Clientes

Sherlock permite comprobar si un nombre de usuario aparece públicamente en múltiples redes sociales. Dentro de WebForge se usa como apoyo de OSINT defensivo para revisar exposición pública de marcas, usuarios corporativos y activos autorizados.

## Cuándo usarlo

Casos recomendados:

- revisar si el nombre de una marca está ocupado en redes relevantes;
- encontrar cuentas corporativas antiguas o abandonadas;
- detectar posibles perfiles públicos que imiten una marca;
- inventariar presencia pública antes de una migración o rebranding;
- apoyar una investigación defensiva de suplantación;
- revisar exposición de cuentas de la propia organización.

## Autorización

Antes de ejecutar una búsqueda para un cliente, definir explícitamente:

- cliente/organización autorizante;
- nombres de usuario o marcas que entran en alcance;
- objetivo de la revisión;
- fecha de la revisión;
- responsable de recibir los resultados.

No ampliar automáticamente una revisión hacia nombres personales, familiares, empleados u otras personas que no formen parte del alcance autorizado.

## Instalación recomendada

La documentación upstream actual recomienda:

```bash
pipx install sherlock-project
```

Alternativas soportadas por upstream incluyen `pip`, `uv` y Docker.

Comprobar siempre la versión instalada:

```bash
sherlock --version
sherlock --help
```

## Comandos útiles

Un usuario:

```bash
sherlock nombre_marca
```

Varios identificadores autorizados:

```bash
sherlock marca empresa producto
```

Mostrar solo coincidencias encontradas:

```bash
sherlock nombre_marca --print-found
```

Exportar a CSV:

```bash
sherlock nombre_marca --csv
```

Exportar a XLSX:

```bash
sherlock nombre_marca --xlsx
```

Cambiar timeout:

```bash
sherlock nombre_marca --timeout 10
```

Limitar a sitios concretos cuando se necesite reducir ruido:

```bash
sherlock nombre_marca --site GitHub --site Instagram
```

Usar un proxy solo cuando exista una necesidad legítima de red o privacidad y esté permitido por el entorno:

```bash
sherlock nombre_marca --proxy socks5://127.0.0.1:1080
```

No asumir que `--tor` sigue siendo una opción válida: la CLI actual revisada no la lista. Verificar `sherlock --help` de la versión instalada antes de documentar cualquier opción.

## Diferencias con comandos históricos

Un flujo antiguo puede mostrar:

```bash
git clone https://github.com/sherlock-project/sherlock.git
cd sherlock
pip install -r requirements.txt
python3 sherlock.py username
```

Ese patrón no debe considerarse nuestra instalación estándar actual. El repositorio moderno usa empaquetado Python y su documentación recomienda instalar `sherlock-project`, por lo que preferimos `pipx`, `uv`, `pip` o Docker.

## Tratamiento de resultados

- Una coincidencia no demuestra identidad ni propiedad de la cuenta.
- Verificar manualmente perfiles relevantes antes de reportarlos como relacionados con la marca.
- Clasificar resultados como: confirmado, probable, posible o falso positivo.
- Evitar descargar o almacenar contenido personal innecesario.
- Guardar solo la información necesaria para el objetivo de seguridad.
- No incluir contraseñas, cookies, tokens o datos privados en reportes.

## Informe sugerido

Para cada hallazgo relevante:

```text
Plataforma:
URL pública:
Nombre de usuario:
Estado: confirmado / probable / posible / falso positivo
Riesgo: bajo / medio / alto
Motivo:
Acción recomendada:
Fecha de revisión:
```

## Acciones defensivas típicas

Si aparece una cuenta no controlada por la organización:

1. Verificar si realmente utiliza identidad, logotipo o contenido de la marca.
2. Documentar evidencia pública mínima y necesaria.
3. Revisar si la plataforma dispone de proceso de reporte por suplantación o marca registrada.
4. Recomendar asegurar nombres de usuario corporativos disponibles en plataformas prioritarias.
5. Reforzar MFA y recuperación de las cuentas oficiales existentes.
6. Mantener un inventario actualizado de cuentas oficiales.

## Límites

Sherlock no debe utilizarse para:

- intentar entrar a cuentas;
- obtener credenciales;
- evadir controles de acceso;
- acosar o perfilar personas fuera de alcance;
- impersonar cuentas encontradas;
- recopilar información privada;
- ocultar una actividad que no está autorizada.

Es una herramienta de descubrimiento de información pública, no una prueba de identidad ni una autorización para investigar más allá del alcance acordado.
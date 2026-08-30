# Sherlock — Upstream

Repositorio oficial: `sherlock-project/sherlock`

Sitio: `https://sherlockproject.xyz`

Uso principal: búsqueda de cuentas públicas asociadas a uno o más nombres de usuario a través de cientos de redes sociales.

## Snapshot revisado

- Rama upstream: `master`
- Commit revisado: `9100f9d40a3274bd46f4ce903c5c6fee6f3745bc`
- Lenguaje principal: Python
- Estado observado: repositorio público y activo
- Licencia del repositorio: MIT

## Nota de instalación actual

La documentación actual recomienda instalar con alguno de estos métodos:

```bash
pipx install sherlock-project
```

También admite `pip`, `uv` o Docker. La documentación upstream advierte que ciertos paquetes de terceros para ParrotOS y Ubuntu 24.04 pueden estar rotos, por lo que recomienda preferir `uv`, `pipx`, `pip` o Docker.

## Uso base actual

```bash
sherlock user123
sherlock user1 user2 user3
sherlock user123 --csv
sherlock user123 --xlsx
sherlock user123 --timeout 10
sherlock user123 --print-found
```

La CLI actual también contempla `--proxy`; no asumir que opciones históricas como `--tor` siguen existiendo sin revisar `sherlock --help` de la versión instalada.

## Política interna

Sherlock se considera una herramienta OSINT defensiva y de auditoría de exposición pública. Su uso dentro de proyectos WebForge/Pillaki debe limitarse a:

- activos propios;
- marcas y usuarios propios;
- clientes que hayan autorizado explícitamente la revisión;
- investigación defensiva de exposición o suplantación pública.

No incorporar resultados de personas ajenas a expedientes de clientes ni utilizar la herramienta para acceso, engaño, impersonación o vigilancia no autorizada.
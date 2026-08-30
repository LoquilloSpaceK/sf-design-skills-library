# Inter — referencia oficial para WebForge

## Fuente upstream

- Repositorio oficial: `rsms/inter`
- Rama por defecto revisada: `master`
- Snapshot de referencia revisado: `353b61b9f4430d5f420d56605a6e7993e0941470`
- Autor/proyecto: Rasmus Andersson / The Inter Project Authors
- Licencia del Font Software: SIL Open Font License 1.1 (OFL-1.1)

## Por qué entra en la biblioteca

Inter ya es la familia sans predeterminada de WebForge AI. Su diseño está orientado a pantallas, con x-height alta para legibilidad, soporte de fuente variable y funciones OpenType útiles para interfaces, tablas, formularios, dashboards y sistemas digitales.

## Capacidades relevantes

- pesos 100–900;
- estilos romanos e itálicos;
- fuente variable;
- números tabulares;
- cero barrado;
- alternates contextuales;
- buena legibilidad en interfaces y tamaños pequeños;
- uso adecuado tanto en texto como en UI y dashboards.

## Uso comercial y licencia

La OFL 1.1 permite usar, estudiar, copiar, incrustar, modificar y redistribuir la fuente, incluso como parte de productos o servicios comerciales, con sus condiciones.

Reglas importantes:

1. La fuente no puede venderse por sí sola.
2. Si se redistribuye la fuente con software, debe conservarse el aviso de copyright y la licencia OFL.
3. Una versión modificada no puede usar un Reserved Font Name sin permiso explícito.
4. La fuente y sus derivados deben mantenerse bajo OFL cuando se redistribuyen como Font Software.
5. Los documentos, sitios o piezas creados usando Inter no quedan obligados a usar OFL por el solo hecho de utilizar la fuente.

`Inter` es un Reserved Font Name y una marca de Rasmus Andersson.

## Distribución web

El README upstream recomienda obtener las versiones actuales desde sus releases oficiales y advierte que distribuciones alternativas pueden quedar desactualizadas. También publica un CSS/CDN oficial.

Para proyectos de clientes, preferir una de estas estrategias según el caso:

- `next/font/local` o self-hosting de archivos oficiales fijados por versión cuando buscamos control, privacidad y estabilidad;
- distribución oficial/CDN solo cuando el proyecto lo justifique;
- evitar depender de una fuente remota cuando pueda afectar privacidad, disponibilidad o Core Web Vitals.

## Regla de biblioteca

Esta biblioteca guarda documentación, atribución y criterios de uso. No necesita duplicar binarios de fuente para que Inter forme parte del estándar WebForge.

Antes de incorporar archivos concretos en un cliente:

1. descargar desde una release oficial;
2. fijar la versión;
3. conservar licencia cuando corresponda a redistribución;
4. revisar peso del bundle y subconjuntos;
5. comprobar `font-display`, preload y métricas de render;
6. no reemplazar una tipografía corporativa existente sin autorización del proyecto.

## Papel dentro de WebForge

Inter es la opción base para:

- cuerpo de texto;
- navegación;
- formularios;
- tablas;
- dashboards;
- cifras y métricas;
- interfaces administrativas.

Poppins continúa como fuente display predeterminada de WebForge mientras no exista branding específico del cliente.

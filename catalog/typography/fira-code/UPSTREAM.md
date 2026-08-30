# Fira Code — referencia oficial para WebForge

## Fuente upstream

- Repositorio oficial: `tonsky/FiraCode`
- Rama por defecto revisada: `master`
- Snapshot de referencia revisado: `ecd367b040ad92a28b64fa93135775f7e2417b37`
- Autor/proyecto: Nikita Prokopov / Fira Code Project Authors
- Licencia del Font Software: SIL Open Font License 1.1 (OFL-1.1)

## Por qué entra en la biblioteca

Fira Code es una tipografía monoespaciada diseñada para programación y destaca por sus ligaduras para combinaciones frecuentes como operadores, flechas y comparadores. Las ligaduras son una característica de renderizado: el código subyacente permanece en caracteres ASCII normales.

## Papel dentro de WebForge

Fira Code queda como alternativa técnica a JetBrains Mono cuando el proyecto valore especialmente:

- ligaduras de programación;
- operadores y flechas con lectura visual compacta;
- bloques de código de producto;
- editores o playgrounds embebidos;
- consolas y terminales compatibles;
- documentación técnica con alta densidad de símbolos;
- interfaces developer-facing donde las ligaduras ayuden realmente a leer.

JetBrains Mono continúa como la opción monoespaciada predeterminada de WebForge. Fira Code no se carga de forma simultánea salvo una necesidad concreta, para evitar peso de fuentes innecesario.

## Capacidades relevantes

- fuente monoespaciada con ligaduras de programación;
- múltiples flechas y combinaciones de operadores;
- variantes de caracteres y stylistic sets;
- soporte de cero barrado, old-style numerals y otras features OpenType;
- buen soporte para ASCII, box drawing, Powerline y UIs de consola;
- glifos dedicados para barras de progreso;
- cobertura Unicode útil para escritura matemática;
- soporte web mediante WOFF/WOFF2 y fuente variable en distribuciones del proyecto.

## Ligaduras: criterio de uso

Las ligaduras pueden mejorar la lectura de código, pero no siempre son deseables. En contenido donde sea importante distinguir literalmente cada carácter —por ejemplo, documentación de sintaxis, hashes, tokens visualizados, comandos o material educativo de bajo nivel— evaluar desactivarlas.

No usar ligaduras como sustituto de accesibilidad, highlighting o buena jerarquía visual.

## Uso comercial y licencia

Fira Code se distribuye bajo SIL Open Font License 1.1. La licencia permite usar, estudiar, copiar, incrustar, modificar y redistribuir el Font Software, incluyendo uso comercial, sujeto a sus condiciones.

Reglas importantes:

1. La fuente no puede venderse por sí sola.
2. Si se redistribuye con software, debe conservarse el aviso de copyright y la licencia OFL.
3. Versiones modificadas deben respetar las condiciones de Reserved Font Names cuando correspondan.
4. El Font Software y sus derivados deben continuar bajo OFL al redistribuirse como fuente.
5. Los documentos, sitios y productos creados usando la fuente no quedan bajo OFL por el solo hecho de usarla.

Ver: `catalog/typography/fira-code/OFL-1.1.txt`.

## Distribución web recomendada

Para proyectos WebForge:

- preferir archivos oficiales de una release fijada por versión;
- self-hosting cuando privacidad, estabilidad y control lo justifiquen;
- cargar solo pesos necesarios;
- priorizar WOFF2 para web;
- usar `font-display: swap` o estrategia equivalente;
- no precargarla si aparece solo en snippets pequeños;
- probar `font-variant-ligatures` / `font-feature-settings` en los navegadores objetivo;
- medir impacto en Core Web Vitals antes de añadirla a una landing sencilla.

## Regla de biblioteca

La biblioteca guarda documentación y licencia, no necesita duplicar binarios de la fuente.

Antes de incorporar Fira Code a un proyecto cliente:

1. confirmar que existe contenido técnico que se beneficie de ella;
2. comparar con JetBrains Mono;
3. elegir una sola fuente mono principal cuando sea posible;
4. fijar versión desde release oficial;
5. conservar licencia cuando corresponda a redistribución;
6. probar legibilidad con ligaduras activas y desactivadas;
7. revisar peso y rendimiento;
8. no sustituir tipografías corporativas sin autorización.

## Comparación rápida dentro de WebForge

- `JetBrains Mono` → predeterminada para código, logs, terminales, hashes y paneles técnicos; alta diferenciación de símbolos y ligaduras opcionales.
- `Fira Code` → alternativa cuando las ligaduras y la representación visual de operadores sean una prioridad del proyecto.

Ambas son herramientas de contenido técnico; ninguna reemplaza a Inter para UI general ni a Poppins como display predeterminada cuando no exista branding específico.

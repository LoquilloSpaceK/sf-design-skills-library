# JetBrains Mono — referencia oficial para WebForge

## Fuente upstream

- Repositorio oficial: `JetBrains/JetBrainsMono`
- Rama por defecto revisada: `master`
- Snapshot de referencia revisado: `19371302b95d218af43299bce79ddbddd0bc364d`
- Autor/proyecto: JetBrains / JetBrains Mono Project Authors
- Licencia del Font Software: SIL Open Font License 1.1 (OFL-1.1)
- Licencia del código fuente del proyecto: Apache License 2.0

## Por qué entra en la biblioteca

JetBrains Mono está diseñada específicamente para desarrolladores y lectura de código. Su x-height aumentada, distinción entre símbolos, ligaduras opcionales y soporte OpenType la hacen apropiada para interfaces técnicas donde una fuente proporcional como Inter no es ideal.

## Papel dentro de WebForge

JetBrains Mono queda como opción monoespaciada de referencia para:

- bloques de código;
- terminales embebidas;
- logs;
- snippets técnicos;
- identificadores;
- hashes;
- claves visibles no sensibles;
- tablas o paneles donde la alineación carácter a carácter importe;
- documentación de APIs y herramientas internas para desarrolladores.

No debe sustituir a Inter como tipografía general de cuerpo ni a Poppins como display predeterminada.

## Capacidades relevantes

- 8 estilos desde Thin hasta ExtraBold;
- variantes itálicas;
- ligaduras de código opcionales;
- versión `JetBrains Mono NL` sin ligaduras;
- OpenType stylistic sets y character variants;
- símbolos diseñados para reducir ambigüedad visual;
- buena legibilidad en tamaños pequeños;
- archivos TTF, OTF, WOFF2 y variantes web generables desde el proyecto.

## Uso comercial y licencia

El README oficial declara JetBrains Mono disponible bajo OFL-1.1 para uso gratuito tanto comercial como no comercial. La licencia permite usar, estudiar, copiar, incrustar, modificar y redistribuir la fuente bajo sus condiciones.

Reglas importantes:

1. La fuente no puede venderse por sí sola.
2. Si se redistribuye junto con software, debe conservarse el aviso de copyright y la licencia OFL.
3. Las versiones modificadas deben respetar las condiciones sobre Reserved Font Names cuando correspondan.
4. El Font Software y sus derivados continúan bajo OFL cuando se redistribuyen como fuente.
5. Los sitios, documentos o piezas creados usando la fuente no pasan a estar bajo OFL por el solo hecho de utilizarla.
6. El código fuente del repositorio tiene licencia Apache-2.0 y debe tratarse separadamente del Font Software.

Ver también: `catalog/typography/jetbrains-mono/OFL-1.1.txt`.

## Distribución web recomendada

Para proyectos WebForge:

- preferir WOFF2 oficial o generado desde una release oficial fijada por versión;
- usar self-hosting cuando buscamos privacidad, estabilidad y control;
- cargar solo los pesos realmente necesarios;
- usar `font-display: swap` o estrategia equivalente;
- evitar precargar la fuente si solo aparece en uno o dos bloques pequeños;
- activar ligaduras únicamente cuando mejoren la lectura del contenido técnico;
- considerar la variante NL cuando símbolos literales deban permanecer visualmente separados.

## Regla de biblioteca

Esta biblioteca guarda documentación y licencia, pero no necesita almacenar ni redistribuir archivos binarios de fuente.

Antes de incorporar JetBrains Mono en un cliente:

1. confirmar que existe una necesidad real de monoespaciada;
2. obtener la versión desde el release oficial;
3. fijar versión;
4. conservar la licencia cuando corresponda a redistribución;
5. optimizar pesos y formatos;
6. probar legibilidad en móvil y desktop;
7. no usarla para datos sensibles ni secretos solo por su apariencia técnica;
8. no reemplazar la tipografía corporativa principal sin autorización.

## Combinación tipográfica WebForge

- `Inter` → cuerpo, navegación, formularios, tablas y UI general.
- `Poppins` → títulos/display cuando no exista branding específico.
- `JetBrains Mono` → código, logs, terminales, hashes y contenido técnico.

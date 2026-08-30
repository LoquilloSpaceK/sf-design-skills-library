# Guía interna — uso de Three.js en webs de clientes

## Objetivo

Usar Three.js como biblioteca de referencia para crear experiencias 3D web de alto impacto sin comprometer rendimiento, accesibilidad ni mantenimiento.

## Áreas especialmente útiles

### Escenas y fundamentos
- Scene, Camera, Renderer
- geometrías y BufferGeometry
- materiales y texturas
- luces, sombras, niebla y fondos
- transformaciones, matrices y scene graph

### Interacción
- raycasting / picking
- interacción con mouse y touch
- etiquetas CSS2D / CSS3D
- controles de cámara
- eventos y animación

### Modelos y contenido 3D
- GLTF / GLB
- OBJ, FBX, STL, USDZ y otros loaders
- animaciones esqueléticas y morph targets
- Draco y KTX2 para compresión

### Efectos visuales
- post-processing
- bloom
- depth of field
- SSAO / SSR / GTAO
- glitch, outline, pixel, LUT y transiciones
- shaders y TSL

### WebGPU / WebXR
- WebGPURenderer
- compute shaders
- partículas y simulaciones
- VR / XR

### Optimización
- instancing
- LOD
- BVH / raycasting optimizado
- render bajo demanda
- OffscreenCanvas
- liberación de recursos
- compresión de texturas/modelos

## Usos recomendados para proyectos comerciales

- hero 3D interactivo
- producto giratorio 3D
- mockup de packaging
- señalética o letreros corpóreos
- configuradores de producto
- recorridos simples
- partículas de marca
- fondos tecnológicos
- visualización de datos
- demos automotrices
- experiencias inmersivas puntuales

## Reglas antes de producción

1. Probar primero en laboratorio o demo aislada.
2. No cargar Three.js completo si solo se necesita un efecto simple.
3. Preferir GLTF/GLB optimizado para modelos.
4. Comprimir texturas y modelos.
5. Probar desktop y móvil real.
6. Implementar fallback cuando WebGL/WebGPU no esté disponible.
7. Respetar `prefers-reduced-motion` cuando corresponda.
8. No bloquear contenido esencial detrás de una escena 3D.
9. Medir Core Web Vitals antes y después.
10. Revisar licencia de cada asset de terceros antes de usarlo en un cliente.

## Flujo de reutilización

1. Buscar un ejemplo similar en `upstream/three.js/examples/`.
2. Revisar el manual correspondiente en `upstream/three.js/manual/`.
3. Identificar módulos exactos usados por el ejemplo.
4. Crear una versión mínima en un proyecto de laboratorio.
5. Sustituir assets de demo por assets propios o con licencia comercial clara.
6. Adaptar branding del cliente.
7. Optimizar.
8. QA móvil, accesibilidad y rendimiento.
9. Conservar atribución/licencia donde corresponda.

## Qué NO hacer

- Copiar una demo completa y publicarla sin entender dependencias.
- Reutilizar modelos, fotos, HDRI, audio o fuentes sin revisar su licencia particular.
- Añadir 3D solo por decoración si empeora conversión o velocidad.
- Hacer que la navegación dependa exclusivamente de WebGL/WebGPU.
- Eliminar avisos de copyright/licencia del software de terceros.

# Índice de consulta rápida — Three.js

Este índice sirve para encontrar rápido qué parte del upstream revisar antes de implementar un efecto o componente en una web de cliente.

## Ejemplos oficiales

Ruta completa en el submódulo: `upstream/three.js/examples/`

Categorías destacadas del catálogo oficial de ejemplos:

- WebGL general
- WebGL post-processing
- WebGL advanced
- WebGL TSL
- WebGPU
- WebGPU post-processing / compute
- WebXR
- CSS2D / CSS3D
- Animation
- Cameras
- Geometry / BufferGeometry
- Materials
- Lights / Shadows
- Loaders
- GLTF / GLB
- Textures / HDR / EXR / KTX2
- Instancing
- Raycasting / Picking
- Particles
- Physics
- Shaders
- Effects
- Controls
- Audio
- Games
- Performance

El archivo oficial `examples/files.json` dentro del upstream contiene el catálogo de demos mantenido por Three.js.

## Manual / tutoriales oficiales

Ruta: `upstream/three.js/manual/`

Temas principales:

### Getting Started
- Installation
- Creating a Scene
- Creating Text
- Drawing Lines
- FAQ
- Libraries and Plugins
- Loading 3D Models
- WebGL Compatibility Check

### Basics / Fundamentals
- Fundamentals
- Responsive Design
- Prerequisites
- Setup
- Primitives
- Scenegraph
- Materials
- Textures
- Lights
- Cameras
- Shadows
- Fog
- Render Targets
- Custom BufferGeometry
- Physics

### Optimization
- Optimizing Lots of Objects
- Optimizing Lots of Objects Animated
- OffscreenCanvas / Web Worker

### Solutions
- Load OBJ
- Load GLTF
- Background / Skybox
- Transparency
- Multiple scenes
- Picking
- Post Processing
- Shadertoy shaders
- Align HTML to 3D
- Canvas dynamic textures
- Billboards
- Cleanup / freeing resources
- Voxel geometry
- Game starter

### WebGPU / WebXR
- WebGPURenderer
- WebGPU Post-Processing
- VR Basics
- Look To Select
- Point To Select

## Búsqueda recomendada por necesidad comercial

| Necesidad | Buscar primero |
|---|---|
| Producto 3D giratorio | `gltf`, `OrbitControls`, `materials` |
| Packaging / mockup | `gltf`, `textures`, `canvas textures` |
| Auto / vehículo | `webgl_materials_car`, `gltf`, HDR/environment maps |
| Fondo premium | `particles`, `shaders`, `postprocessing` |
| Glow / neón | `unreal_bloom`, `postprocessing` |
| Texto 3D | `geometry_text`, `creating-text` |
| Elementos HTML sobre 3D | `CSS2DRenderer`, `CSS3DRenderer`, align HTML to 3D |
| Seleccionar objetos | `raycaster`, `picking` |
| Muchas piezas | `instancing`, `LOD`, optimization |
| Escena inmersiva | `WebXR`, `VR` |
| Experimento de nueva generación | `WebGPU`, `TSL`, compute |

## Nota

El upstream evoluciona constantemente. Antes de copiar una solución a producción, revisar el ejemplo y documentación del commit o release que se vaya a usar.

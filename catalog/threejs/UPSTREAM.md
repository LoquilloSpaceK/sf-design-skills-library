# Three.js — Upstream oficial

## Fuente

- Proyecto: `mrdoob/three.js`
- Repositorio oficial: https://github.com/mrdoob/three.js
- Rama de referencia: `dev`
- Snapshot fijado al incorporar esta biblioteca: `ad005397bbd15b0a9fcd5159c782eba56e1cba2a`
- Carpeta de ejemplos: https://github.com/mrdoob/three.js/tree/dev/examples
- Manual / tutoriales: https://github.com/mrdoob/three.js/tree/dev/manual
- Documentación: https://github.com/mrdoob/three.js/tree/dev/docs

## Qué guardamos

El repositorio completo de Three.js queda enlazado como submódulo en `catalog/threejs/upstream/three.js`, fijado al commit indicado arriba. De esta forma se conserva el código fuente, ejemplos, loaders, shaders, WebGL, WebGPU, WebXR, manuales, documentación, utilidades y assets exactamente como los publica el proyecto original, sin mezclarlos con código de producción de clientes.

## Licencia

Three.js declara licencia MIT. El aviso de copyright y el texto de licencia deben mantenerse en copias o porciones sustanciales del software.

**Copyright © 2010-2026 three.js authors**

Ver `THREEJS-LICENSE.txt` en esta carpeta y el `LICENSE` original dentro del submódulo.

## Atribución recomendada

Cuando reutilicemos código sustancial de Three.js en un proyecto de cliente, conservar en el repositorio del proyecto una nota similar a:

> Portions of this project use three.js — Copyright © 2010-2026 three.js authors — MIT License — https://github.com/mrdoob/three.js

## Importante sobre assets de ejemplos

El código principal de Three.js está bajo MIT, pero algunos modelos, texturas, HDRI, fuentes, audios u otros recursos presentes en `examples/` pueden incluir créditos o licencias adicionales. **No se debe asumir que cada asset de ejemplo está automáticamente autorizado para uso comercial en clientes.** Antes de reutilizar un asset concreto, revisar los README, LICENSE, comentarios y créditos incluidos junto a ese recurso.

## Política interna

- Usar esta biblioteca como referencia y laboratorio.
- No modificar directamente el upstream.
- Para clientes, copiar únicamente los componentes necesarios.
- Optimizar peso, accesibilidad y rendimiento antes de producción.
- Mantener atribuciones y licencias correspondientes.

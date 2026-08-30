# WebForge AI — Design Tokens

Sistema visual base para páginas web empresariales y formularios interactivos generados con WebForge AI.

## Colores

```css
--primary: #2563EB; /* azul empresarial */
--secondary: #7C3AED; /* violeta premium */
--accent: #059669; /* verde éxito */
--error: #DC2626; /* rojo alerta */
--dark: #0F172A; /* slate-900 */
--light: #F8FAFC; /* slate-50 */
```

## Tipografía

```css
--font-sans: 'Inter', system-ui, sans-serif;
--font-display: 'Poppins', sans-serif;
--font-mono: 'JetBrains Mono', ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
--text-xs: 0.75rem;
--text-sm: 0.875rem;
--text-base: 1rem;
--text-lg: 1.125rem;
--text-xl: 1.25rem;
--text-2xl: 1.5rem;
--text-4xl: 2.25rem;
--text-5xl: 3rem;
```

### Fuente base Inter

La referencia oficial de Inter para WebForge está documentada en:

`catalog/typography/inter/UPSTREAM.md`

Inter se mantiene como sans predeterminada para cuerpo, UI, formularios, tablas y dashboards. En proyectos web, preferir archivos oficiales fijados por versión y self-hosting/`next/font/local` cuando esto mejore privacidad, estabilidad y rendimiento. No sustituir la tipografía de una marca existente sin autorización.

### Fuente monoespaciada JetBrains Mono

La referencia oficial de JetBrains Mono para WebForge está documentada en:

`catalog/typography/jetbrains-mono/UPSTREAM.md`

JetBrains Mono es la opción monoespaciada de referencia para bloques de código, terminales, logs, hashes, snippets y paneles técnicos. No sustituye a Inter para texto general. Cargarla solo cuando el proyecto realmente contenga contenido técnico que justifique el peso adicional.

## Spacing — grid de 8 px

```css
--space-1: 0.25rem;
--space-2: 0.5rem;
--space-3: 0.75rem;
--space-4: 1rem;
--space-6: 1.5rem;
--space-8: 2rem;
--space-12: 3rem;
--space-16: 4rem;
```

## Animaciones

```css
--transition-fast: 150ms;
--transition-normal: 300ms;
--transition-slow: 500ms;
--ease-premium: cubic-bezier(0.4, 0, 0.2, 1);
```

## Regla de uso

- Usar estos tokens como sistema visual predeterminado cuando se active WebForge AI.
- Mantener coherencia entre Tailwind, componentes shadcn/ui, Radix UI y animaciones Framer Motion.
- La identidad específica del cliente puede reemplazar estos tokens cuando el proyecto autorizado tenga branding propio.
- No imponer estos colores o tipografías sobre una marca existente si el cliente ya cuenta con manual de identidad.
- No cargar JetBrains Mono en proyectos que no tengan una necesidad real de contenido monoespaciado.

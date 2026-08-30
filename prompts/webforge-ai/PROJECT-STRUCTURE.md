# WebForge AI — Estructura Base de Proyecto

Arquitectura de referencia para proyectos empresariales construidos con WebForge AI.

```text
project/
├── src/
│   ├── app/
│   │   ├── layout.tsx
│   │   ├── page.tsx
│   │   ├── globals.css
│   │   ├── api/
│   │   │   ├── contact/
│   │   │   │   └── route.ts
│   │   │   └── submit-form/
│   │   │       └── route.ts
│   │   └── components/
│   │       ├── ui/
│   │       │   ├── button.tsx
│   │       │   ├── input.tsx
│   │       │   ├── select.tsx
│   │       │   ├── textarea.tsx
│   │       │   └── form.tsx
│   │       ├── sections/
│   │       │   ├── Header.tsx
│   │       │   ├── Hero.tsx
│   │       │   ├── Features.tsx
│   │       │   ├── Testimonials.tsx
│   │       │   ├── Pricing.tsx
│   │       │   ├── FAQ.tsx
│   │       │   ├── ContactForm.tsx
│   │       │   └── Footer.tsx
│   │       └── shared/
│   │           ├── Logo.tsx
│   │           ├── Navigation.tsx
│   │           └── SEO.tsx
│   ├── lib/
│   │   ├── prisma.ts
│   │   ├── validations.ts
│   │   └── utils.ts
│   └── types/
│       └── index.ts
├── prisma/
│   └── schema.prisma
├── public/
├── package.json
├── tsconfig.json
├── tailwind.config.ts
├── next.config.js
├── .env.example
├── README.md
└── .gitignore
```

## Criterio de organización

- `src/app/`: App Router, páginas, layout global y endpoints del proyecto.
- `src/app/components/ui/`: componentes UI base reutilizables, preferentemente shadcn/ui + Radix UI.
- `src/app/components/sections/`: bloques completos de página y secciones comerciales.
- `src/app/components/shared/`: elementos compartidos como logo, navegación y utilidades de presentación/SEO.
- `src/lib/`: infraestructura, validaciones, Prisma y utilidades comunes.
- `src/types/`: tipos TypeScript compartidos.
- `prisma/`: modelo de datos y configuración Prisma.
- `public/`: imágenes, SVG, fuentes autorizadas y assets estáticos.

## Reglas WebForge

1. Usar esta estructura como punto de partida predeterminado para nuevos proyectos WebForge.
2. Mantener TypeScript en modo estricto.
3. Separar componentes UI genéricos de secciones de negocio.
4. Centralizar validaciones con Zod y React Hook Form.
5. Mantener acceso a base de datos encapsulado en `src/lib/prisma.ts`.
6. Mantener secretos fuera del repositorio; documentar solo nombres de variables en `.env.example`.
7. Añadir carpetas o módulos cuando la complejidad real del proyecto lo requiera; no crear abstracciones sin uso.
8. En Next.js App Router, usar Metadata API cuando sea la opción más adecuada para SEO; `SEO.tsx` puede mantenerse solo cuando el proyecto necesite lógica reutilizable adicional.
9. Cuando haya autenticación, incorporar la configuración correspondiente sin mezclar secretos o credenciales con el código.
10. Antes de producción, validar componentes críticos con Storybook y pruebas automatizadas cuando corresponda.

## Relación con el Prompt Maestro

Esta arquitectura complementa:

- `MASTER-PROMPT.md`
- `DESIGN-TOKENS.md`

El branding del cliente y los requerimientos funcionales específicos pueden extender esta estructura sin romper la separación entre UI, lógica, datos y configuración.

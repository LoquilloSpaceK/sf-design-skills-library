# WebForge AI — SEO Base

Plantilla SEO para proyectos empresariales construidos con WebForge AI sobre Next.js 14 App Router.

## Ejemplo de referencia recibido

```tsx
// Meta tags completos
export function SEO({ title, description, image }) {
  return (
    <>
      <title>{title} | Empresa</title>
      <meta name="description" content={description} />
      <meta property="og:title" content={title} />
      <meta property="og:description" content={description} />
      <meta property="og:image" content={image} />
      <meta name="twitter:card" content="summary_large_image" />
      <link rel="canonical" href={url} />

      {/* Schema.org */}
      <script type="application/ld+json">
        {JSON.stringify(schemaData)}
      </script>
    </>
  );
}
```

Este patrón expresa correctamente las piezas SEO que necesitamos, pero en Next.js 14 App Router la implementación preferida para `title`, `description`, canonical, Open Graph y Twitter es la Metadata API.

## Implementación recomendada — Metadata API

```ts
import type { Metadata } from 'next';

const siteUrl = 'https://www.empresa.cl';

export const metadata: Metadata = {
  metadataBase: new URL(siteUrl),
  title: {
    default: 'Empresa',
    template: '%s | Empresa',
  },
  description: 'Descripción clara y orientada a conversión de la empresa.',
  alternates: {
    canonical: '/',
  },
  openGraph: {
    type: 'website',
    locale: 'es_CL',
    url: '/',
    siteName: 'Empresa',
    title: 'Empresa',
    description: 'Descripción clara y orientada a conversión de la empresa.',
    images: [
      {
        url: '/og-image.jpg',
        width: 1200,
        height: 630,
        alt: 'Empresa',
      },
    ],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Empresa',
    description: 'Descripción clara y orientada a conversión de la empresa.',
    images: ['/og-image.jpg'],
  },
};
```

Para páginas dinámicas, usar `generateMetadata()` y construir títulos, descripciones, canonical e imágenes a partir de datos validados del proyecto.

## JSON-LD / Schema.org

La Metadata API no sustituye los datos estructurados. Incluir JSON-LD en la página o layout correspondiente:

```tsx
const schemaData = {
  '@context': 'https://schema.org',
  '@type': 'Organization',
  name: 'Empresa',
  url: 'https://www.empresa.cl',
  logo: 'https://www.empresa.cl/logo.png',
};

export function OrganizationSchema() {
  return (
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{
        __html: JSON.stringify(schemaData).replace(/</g, '\\u003c'),
      }}
    />
  );
}
```

## Reglas WebForge

1. Usar Metadata API de Next.js App Router como opción predeterminada para meta tags.
2. Definir `metadataBase` con el dominio real de producción; nunca dejar URLs ficticias al desplegar.
3. Cada página estratégica debe tener `title`, `description` y canonical coherentes con su contenido.
4. Open Graph y Twitter deben usar imágenes reales, optimizadas y accesibles públicamente; referencia recomendada 1200×630 px para tarjetas sociales.
5. No reutilizar el mismo título y descripción en todas las páginas cuando el sitio tenga varias URLs indexables.
6. Usar `generateMetadata()` para contenido dinámico cuando corresponda.
7. Incluir JSON-LD pertinente al negocio: `Organization`, `LocalBusiness`, `ProfessionalService`, `Product`, `Service`, `FAQPage`, `BreadcrumbList` u otros tipos válidos según el contenido real.
8. Nunca inventar ratings, reviews, precios, direcciones, disponibilidad ni otros datos estructurados.
9. Mantener canonical en una sola URL definitiva y evitar indexación duplicada.
10. Añadir `robots.txt`, `sitemap.xml`, iconos, manifest y metadata adicional cuando el proyecto lo requiera.
11. Validar las tarjetas sociales y el marcado estructurado antes de producción.
12. El branding y nombre real del cliente sustituyen siempre los placeholders `Empresa`, dominio e imágenes del ejemplo.

## Relación con la arquitectura WebForge

En App Router, SEO global puede vivir en `src/app/layout.tsx` y SEO específico en `page.tsx`, layouts anidados o `generateMetadata()`.

El archivo `src/app/components/shared/SEO.tsx` de la estructura base solo debe mantenerse cuando exista lógica SEO reutilizable que no esté mejor resuelta por Metadata API, por ejemplo componentes JSON-LD específicos.

# WebForge AI — Validación Base de Formularios

Plantilla base de validación para formularios empresariales construidos con WebForge AI usando Zod, React Hook Form y validación equivalente en servidor.

## Schema base

```ts
import { z } from 'zod';

export const schema = z.object({
  fullName: z.string().min(2, 'Nombre requerido').max(50),
  email: z.string().email('Email inválido').transform(v => v.toLowerCase()),
  phone: z.string().regex(/^[+\d\s-]{8,20}$/, 'Teléfono inválido'),
  company: z.string().optional(),
  service: z.enum(['consulting', 'development', 'design', 'marketing']),
  budget: z.enum(['5k', '10k', '25k', '50k+']),
  message: z.string().min(20, 'Mínimo 20 caracteres').max(1000),
  consent: z.boolean().refine(v => v === true, 'Debes aceptar'),
  honeypot: z.string().max(0, 'Spam detected').optional()
});

export type FormValues = z.infer<typeof schema>;
```

## Reglas WebForge

1. Usar este schema como plantilla de referencia, no como contrato rígido para todos los clientes.
2. Adaptar `service` y `budget` al negocio, moneda y oferta real del proyecto autorizado.
3. Validar en cliente con React Hook Form + Zod para UX inmediata.
4. Repetir la validación en el endpoint del servidor; nunca confiar únicamente en el navegador.
5. Mantener el campo `honeypot` oculto a usuarios reales y rechazar envíos donde llegue informado.
6. Normalizar el email antes de persistirlo o procesarlo.
7. No registrar en logs información sensible innecesaria.
8. Complementar formularios públicos con rate limiting, controles antiabuso y manejo seguro de errores cuando el proyecto lo requiera.
9. Los mensajes de validación deben ser claros, breves y adaptables al idioma del cliente.
10. Mantener el consentimiento explícito cuando se recolecten datos personales o comerciales que lo requieran.

## Ubicación recomendada

En la arquitectura base WebForge, esta lógica debe centralizarse en:

`src/lib/validations.ts`

Los componentes de formulario consumen el schema desde ahí, y los API routes reutilizan la misma definición para evitar reglas divergentes entre frontend y backend.

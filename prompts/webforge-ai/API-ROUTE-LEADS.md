# WebForge AI — API Route de Leads

Plantilla base para recibir formularios empresariales en Next.js App Router, validar con Zod, persistir con Prisma, enviar notificación por email y registrar tracking.

## Flujo base

```ts
export async function POST(req: Request) {
  try {
    const data = await req.json();
    const validated = schema.parse(data);

    // Guardar en DB
    const lead = await prisma.lead.create({
      data: validated
    });

    // Enviar email
    await sendEmail(validated);

    // Tracking
    await trackEvent('form_submit', { leadId: lead.id });

    return Response.json({ success: true, leadId: lead.id });
  } catch (error) {
    return Response.json({ error: 'Validation failed' }, { status: 400 });
  }
}
```

## Reglas WebForge para producción

1. Validar siempre el payload recibido en el servidor con el mismo schema Zod definido en `FORM-VALIDATION.md`.
2. No persistir campos técnicos anti-spam como `honeypot`; extraerlos y descartarlos antes de `prisma.lead.create()`.
3. Diferenciar errores de validación de errores internos. Un fallo de base de datos, email o tracking no debe responder como `Validation failed`.
4. Aplicar rate limiting y controles antiabuso a endpoints públicos.
5. No exponer detalles internos, stack traces, credenciales ni mensajes de base de datos al cliente.
6. El registro del lead en la base de datos es la operación principal. Email y tracking son efectos secundarios y deben diseñarse para no perder un lead válido si uno de ellos falla.
7. Cuando el proyecto lo justifique, encapsular email y tracking con manejo independiente de errores o cola/reintentos.
8. Registrar errores del servidor de forma segura, evitando datos personales innecesarios.
9. Mantener respuestas JSON consistentes y códigos HTTP apropiados: 400/422 para input inválido, 429 para rate limit y 500 para fallos internos.
10. Antes de producción, probar casos válidos, payload inválido, honeypot, duplicados, fallo de DB, fallo de email y fallo de tracking.

## Variante endurecida recomendada

```ts
import { ZodError } from 'zod';

export async function POST(req: Request) {
  try {
    const data = await req.json();
    const validated = schema.parse(data);

    const { honeypot, ...leadData } = validated;

    if (honeypot) {
      return Response.json({ error: 'Invalid submission' }, { status: 400 });
    }

    const lead = await prisma.lead.create({
      data: leadData
    });

    try {
      await sendEmail(leadData);
    } catch (error) {
      console.error('Lead email failed', error);
    }

    try {
      await trackEvent('form_submit', { leadId: lead.id });
    } catch (error) {
      console.error('Lead tracking failed', error);
    }

    return Response.json({ success: true, leadId: lead.id }, { status: 201 });
  } catch (error) {
    if (error instanceof ZodError) {
      return Response.json({ error: 'Validation failed' }, { status: 400 });
    }

    console.error('Lead submission failed', error);
    return Response.json({ error: 'Internal server error' }, { status: 500 });
  }
}
```

> Esta variante es una referencia. Cada proyecto debe adaptar Prisma, email, tracking, campos y políticas de privacidad al caso real.

## Ubicación recomendada

En la estructura base WebForge:

`src/app/api/submit-form/route.ts`

El endpoint consume la validación centralizada desde `src/lib/validations.ts` y Prisma desde `src/lib/prisma.ts`.

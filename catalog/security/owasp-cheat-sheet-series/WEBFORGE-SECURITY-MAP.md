# OWASP Cheat Sheet Series — Mapa WebForge

Mapa interno para decidir qué guías OWASP consultar en proyectos WebForge AI. No reproduce el contenido de las cheat sheets; remite a sus títulos oficiales en el upstream.

## Identidad, acceso y cuentas

Consultar según corresponda:

- Authentication Cheat Sheet
- Authorization Cheat Sheet
- Access Control Cheat Sheet
- Session Management Cheat Sheet
- Multifactor Authentication Cheat Sheet
- Password Storage Cheat Sheet
- Forgot Password Cheat Sheet
- Credential Stuffing Prevention Cheat Sheet
- OAuth2 Cheat Sheet
- JSON Web Token Cheat Sheet

Aplicación WebForge: login, paneles privados, portales de clientes, recuperación de cuenta, sesiones, roles y acciones administrativas.

## Formularios, inputs y contenido de usuario

- Input Validation Cheat Sheet
- Cross Site Scripting Prevention Cheat Sheet
- DOM based XSS Prevention Cheat Sheet
- Cross-Site Request Forgery Prevention Cheat Sheet
- File Upload Cheat Sheet
- Injection Prevention Cheat Sheet
- SQL Injection Prevention Cheat Sheet
- Query Parameterization Cheat Sheet
- OS Command Injection Defense Cheat Sheet
- Unvalidated Redirects and Forwards Cheat Sheet

Aplicación WebForge: formularios de leads, cotizaciones, uploads, buscadores, parámetros de URL, contenido editable y API routes.

## APIs y backend

- REST Security Cheat Sheet
- REST Assessment Cheat Sheet
- Web Service Security Cheat Sheet
- GraphQL Cheat Sheet, si aplica
- Server Side Request Forgery Prevention Cheat Sheet
- Mass Assignment Cheat Sheet
- Error Handling Cheat Sheet
- Logging Cheat Sheet

Aplicación WebForge: endpoints públicos, webhooks, integraciones, APIs internas, validación de errores, logging y llamadas salientes.

## Navegador, headers y transporte

- HTTP Headers Cheat Sheet
- Content Security Policy Cheat Sheet
- HTTP Strict Transport Security Cheat Sheet
- Transport Layer Security Cheat Sheet
- Clickjacking Defense Cheat Sheet
- Cookie Theft Mitigation Cheat Sheet
- Third Party Javascript Management Cheat Sheet
- HTML5 Security Cheat Sheet

Aplicación WebForge: `next.config`, headers, CSP, cookies, CDNs, scripts externos, embeds y HTTPS.

## Secretos, datos y base de datos

- Secrets Management Cheat Sheet
- Database Security Cheat Sheet
- Cryptographic Storage Cheat Sheet
- Key Management Cheat Sheet
- User Privacy Protection Cheat Sheet
- Multi Tenant Security Cheat Sheet, cuando exista arquitectura multi-cliente

Aplicación WebForge: variables de entorno, Prisma/PostgreSQL, service roles, claves API, datos personales y separación por cliente.

## GitHub, dependencias y cadena de suministro

- GitHub Actions Security Cheat Sheet
- NPM Security Cheat Sheet
- Software Supply Chain Security Cheat Sheet
- Vulnerable Dependency Management Cheat Sheet
- Dependency Graph SBOM Cheat Sheet
- CI CD Security Cheat Sheet
- Infrastructure as Code Security Cheat Sheet
- Docker Security Cheat Sheet, cuando aplique
- Nodejs Security Cheat Sheet

Aplicación WebForge: repositorios, Actions, paquetes npm, lockfiles, CI/CD, imágenes de contenedor, dependencias y despliegues.

## Diseño seguro y revisión previa a producción

- Threat Modeling Cheat Sheet
- Attack Surface Analysis Cheat Sheet
- Abuse Case Cheat Sheet
- Secure Product Design Cheat Sheet
- Secure Code Review Cheat Sheet
- Business Logic Security Cheat Sheet
- Authorization Regression Testing Cheat Sheet

Aplicación WebForge: planificación de proyectos, flujos sensibles, roles, pagos, administración y QA de seguridad.

## IA y automatizaciones futuras

Cuando un proyecto incorpore IA, agentes o RAG:

- AI Agent Security Cheat Sheet
- Secure Coding with AI Cheat Sheet
- LLM Prompt Injection Prevention Cheat Sheet
- MCP Security Cheat Sheet
- RAG Security Cheat Sheet
- Secure AI Model Ops Cheat Sheet

Aplicación WebForge: chatbots, agentes, herramientas conectadas, retrieval, automatizaciones y generación asistida de código.

## Checklist de consulta rápida

Para una landing pública con formulario:

1. Input Validation
2. XSS Prevention
3. CSRF Prevention si existe estado/sesión que lo requiera
4. HTTP Headers
5. CSP
6. Secrets Management
7. REST Security
8. Logging + Error Handling
9. NPM / Vulnerable Dependency Management
10. Third Party Javascript Management

Para un portal privado agregar, como mínimo:

- Authentication
- Authorization
- Access Control
- Session Management
- MFA
- Password Storage o proveedor de identidad equivalente
- User Privacy Protection

Para cada proyecto, seleccionar solo las guías pertinentes y registrar qué controles se implementaron, cuáles no aplican y cuáles requieren seguimiento.

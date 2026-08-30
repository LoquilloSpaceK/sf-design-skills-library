#!/bin/bash

# WebForge AI - Generador de prompt para páginas web
# Genera prompt.txt y github-instructions.md a partir de datos básicos del proyecto.

set -euo pipefail

echo "🚀 WebForge AI - Generador de Páginas Web"
echo "=========================================="

# Solicitar datos
read -r -p "Nombre de la empresa: " company_name
read -r -p "Sector: " sector
read -r -p "Colores (ej: #2563EB #7C3AED): " colors
read -r -p "Objetivo principal: " objective

if [[ -z "$company_name" || -z "$sector" || -z "$objective" ]]; then
  echo "❌ Empresa, sector y objetivo son obligatorios."
  exit 1
fi

# Slug simple y seguro para sugerir nombre de repositorio.
repo_slug=$(printf '%s' "$company_name" \
  | tr '[:upper:]' '[:lower:]' \
  | tr ' ' '-' \
  | tr -cd 'a-z0-9-')

if [[ -z "$repo_slug" ]]; then
  repo_slug="webforge-project"
fi

# Crear prompt con datos
cat > prompt.txt <<EOF
Usa el PROMPT MAESTRO WebForge AI para generar una landing page para:

**Empresa:** $company_name
**Sector:** $sector
**Colores:** $colors
**Objetivo:** $objective

Respeta el stack, design tokens, arquitectura, validación, API de leads y SEO definidos en WebForge AI.
Adapta el branding y los datos al negocio real.
Genera el código completo del proyecto y marca explícitamente cualquier dato, secreto, dominio, credencial o integración que deba configurarse antes de producción.
EOF

echo "✅ Prompt creado en prompt.txt"
echo "📋 Copia el contenido y úsalo con WebForge AI"
echo "💾 Revisa el resultado antes de guardarlo o desplegarlo"

# Instrucciones para GitHub
cat > github-instructions.md <<EOF
# 📦 Instrucciones para GitHub

1. Guarda el código generado en una carpeta de proyecto.
2. Revisa que no existan secretos, credenciales ni archivos .env reales versionados.
3. Ejecuta:

\`\`\`bash
git init
git add .
git commit -m "Landing page $company_name"
gh repo create ${repo_slug}-web --source=. --push
\`\`\`

4. Verifica el repositorio y su visibilidad antes de compartirlo.
5. Revisa build, tests, variables de entorno y seguridad antes de producción.
EOF

echo "📚 Instrucciones guardadas en github-instructions.md"

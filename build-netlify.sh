#!/bin/bash
set -e

# Crear estructura de carpetas
mkdir -p public/css public/images

# Copiar estilos
cp src/main/resources/static/css/styles.css public/css/

# Copiar imágenes
cp -r src/main/resources/static/images/* public/images/ 2>/dev/null || true

echo "Build completado. Sitio estático listo en public/"

# Script para preparar public/ para Netlify (Windows)
# Copia estilos e imagenes desde src/ a public/

$ErrorActionPreference = "Stop"

$staticPath = "src\main\resources\static"
$publicPath = "public"

# Crear carpetas si no existen
New-Item -ItemType Directory -Force -Path "$publicPath\css" | Out-Null
New-Item -ItemType Directory -Force -Path "$publicPath\images" | Out-Null

# Copiar estilos
Copy-Item "$staticPath\css\styles.css" -Destination "$publicPath\css\" -Force
Write-Host "Copiado: styles.css"

# Copiar todas las imagenes
if (Test-Path "$staticPath\images") {
    Get-ChildItem "$staticPath\images\*" -Include "*.png","*.jpg","*.jpeg","*.gif","*.webp" | ForEach-Object {
        Copy-Item $_.FullName -Destination "$publicPath\images\$($_.Name)" -Force
        Write-Host "Copiado: $($_.Name)"
    }
}

Write-Host "Build completado. Sitio listo en public/ para Netlify."

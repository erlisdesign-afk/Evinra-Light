#!/bin/bash

find . -name "*.html" -type f ! -path "./_*" | while read file; do
    echo "Cleaning: $file"
    
    # Crear backup temporal
    temp="${file}.tmp"
    
    # Procesar el archivo
    sed -E '
    # Remover theme-toggle HTML
    /<div class="theme-toggle">/,/<\/div>/d
    
    # Remover CSS de dark mode (body.light-mode blocks)
    /^[[:space:]]*body\.light-mode[[:space:]]*\{/,/^[[:space:]]*\}/d
    
    # Remover theme-toggle CSS
    /^[[:space:]]*\.theme-toggle/,/^[[:space:]]*\}/d
    
    # Remover dark mode variables (--bg: #0B0F0E, etc)
    /--bg:[[:space:]]*#0B0F0E/d
    /--bg2:[[:space:]]*#111816/d
    /--bg3:[[:space:]]*#161D1B/d
    /--bg4:[[:space:]]*#1C2422/d
    /--text:[[:space:]]*#E8F0EE/d
    /--text2:[[:space:]]*#8A9E9B/d
    /--text3:[[:space:]]*#4A5E5B/d
    /--border:[[:space:]]*rgba\(255,255,255/d
    
    # Cambiar logo dark a light
    s|evinra-logo-dark\.png|evinra-logo-light.png|g
    s|evinra-logo-dark\.svg|evinra-logo-light.svg|g
    
    # Remover lógica JavaScript de temas
    /const.*isLight.*=.*function/,/^[[:space:]]*\}/d
    /function.*toggleTheme/,/^[[:space:]]*\}/d
    /\.addEventListener.*theme-toggle/d
    /document\.body\.classList.*light-mode/d
    ' "$file" > "$temp"
    
    mv "$temp" "$file"
done

echo "✅ Todos los archivos convertidos a LIGHT MODE ONLY"

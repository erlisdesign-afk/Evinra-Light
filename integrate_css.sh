#!/bin/bash

# Leer el contenido de CSS
CSS_CONTENT=$(cat evinra-styles.css)

# Encontrar todos los HTML que NO sean de auth (que ya tienen CSS inline)
find . -name "*.html" -type f ! -path "./auth/*" ! -path "./_*" ! -path "./uploads/*" | while read file; do
    if grep -q 'href="evinra-styles.css"' "$file"; then
        echo "Processing: $file"
        
        # Crear versión temporal
        temp_file="${file}.tmp"
        
        # Reemplazar el link de CSS con style inline
        awk -v css="<style>$CSS_CONTENT</style>" '
        /href="evinra-styles.css"/ {
            print css
            next
        }
        {print}
        ' "$file" > "$temp_file"
        
        # Mover archivo temporal al original
        mv "$temp_file" "$file"
    fi
done

echo "✅ CSS integrado en todos los HTML"

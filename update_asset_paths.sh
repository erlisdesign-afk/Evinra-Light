#!/bin/bash

# Archivos en subdirectorios: cambiar a ../assets/
for dir in auth dashboard events generals orders refund-report sales-overview uploads; do
    if [ -d "$dir" ]; then
        find "$dir" -name "*.html" -type f | while read file; do
            sed -i 's|src="evinra-logo-light\.\(png\|svg\)"|src="../assets/evinra-logo-light.\1"|g' "$file"
            sed -i 's|href="evinra-|href="../assets/evinra-|g' "$file"
        done
    fi
done

# Archivos en raíz: cambiar a ./assets/
find . -maxdepth 1 -name "*.html" -type f | while read file; do
    sed -i 's|src="evinra-logo-light\.\(png\|svg\)"|src="./assets/evinra-logo-light.\1"|g' "$file"
    sed -i 's|src="assets/|src="./assets/|g' "$file"
done

echo "✅ Referencias a assets actualizadas"

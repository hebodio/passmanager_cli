#!/bin/bash

# uninstall.sh - Desinstalador del cliente PassManager

EXECUTABLE="passmanager"
TARGET_DIR="/usr/local/bin"

echo "🗑️  Desinstalando PassManager CLI..."

if [ -f "$TARGET_DIR/$EXECUTABLE" ]; then
    if [ ! -w "$TARGET_DIR" ]; then
        echo "⚠️  Requiere permisos para eliminar de $TARGET_DIR. Usando sudo."
        sudo rm -f "$TARGET_DIR/$EXECUTABLE"
    else
        rm -f "$TARGET_DIR/$EXECUTABLE"
    fi
    echo "✅ Desinstalación completada. Ejecutable eliminado."
else
    echo "ℹ️  Ejecutable no encontrado en $TARGET_DIR. Nada que eliminar."
fi

exit 0
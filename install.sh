#!/bin/bash

# install.sh - Instalador del cliente PassManager

EXECUTABLE="passmanager"
TARGET_DIR="/usr/local/bin"

echo "🔧 Instalando PassManager CLI..."

if [ ! -f "$EXECUTABLE" ]; then
    echo "❌ Error: No se encontró el ejecutable '$EXECUTABLE' en el directorio actual."
    exit 1
fi

if [ ! -w "$TARGET_DIR" ]; then
    echo "⚠️  Requiere permisos para copiar en $TARGET_DIR. Usando sudo."
    sudo cp "$EXECUTABLE" "$TARGET_DIR/"
else
    cp "$EXECUTABLE" "$TARGET_DIR/"
fi

chmod +x "$TARGET_DIR/$EXECUTABLE"
echo "✅ Instalación completada. Puede ejecutar la herramienta con el comando: $EXECUTABLE"

exit 0

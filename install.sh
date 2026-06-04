#!/bin/bash

# Nombre del archivo original y del comando final
SCRIPT_NAME="giveports"
INSTALL_DIR="/usr/local/bin"

# 1. Verificar privilegios de administrador
if [ "$EUID" -ne 0 ]; then
  echo "❌ Error: Por favor, ejecuta este script usando sudo."
  echo "Ejemplo: sudo ./install.sh"
  exit 1
fi

# 2. Verificar si el script existe en la carpeta actual
if [ ! -f "$SCRIPT_NAME" ]; then
  echo "❌ Error: No se encontró el archivo '$SCRIPT_NAME' en este directorio."
  exit 1
fi

echo "🚀 Instalando $SCRIPT_NAME de forma global..."

# 3. Copiar el archivo al directorio del PATH
cp "$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME"

# 4. Asignar permisos de ejecución (Lectura y ejecución para todos, escritura solo para root)
chmod 755 "$INSTALL_DIR/$SCRIPT_NAME"

# 5. Verificar resultado
if [ -x "$INSTALL_DIR/$SCRIPT_NAME" ]; then
  echo "✅ ¡Instalación exitosa!"
  echo "Ya puedes usar el comando '$SCRIPT_NAME' desde cualquier parte de tu terminal."
else
  echo "❌ Ocurrió un error al intentar asignar los permisos."
  exit 1
fi

#!/bin/bash

# Ir a la carpeta de dotfiles
cd ~/dotfiles

# Mostrar qué archivos han cambiado para ayudarte a recordar qué hiciste
echo "--- 📂 Archivos modificados ---"
git status -s
echo "-------------------------------"

# Preguntar al usuario por el mensaje del commit
echo "📝 Escribe el mensaje para este commit (luego pulsa Enter):"
read user_message

# Si el mensaje está vacío, cancelar para evitar commits sin sentido
if [ -z "$user_message" ]; then
    echo "❌ Error: El mensaje no puede estar vacío. Operación cancelada."
    exit 1
fi

# Obtener la fecha actual
fecha=$(date +'%d/%m/%Y %H:%M')

# Combinar el mensaje del usuario con la fecha
final_message="$user_message ($fecha)"

# Ejecutar el flujo de Git
echo "📤 Subiendo cambios a GitHub..."
git add .
git commit -m "$final_message"
git push

echo "✅ ¡Listo! Todo sincronizado."

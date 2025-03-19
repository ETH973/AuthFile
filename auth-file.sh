#!/bin/bash

# Ruta del archivo auth
AUTH_FILE="/root/auth"

# Verificar si el archivo auth ya existe
if [ -f "$AUTH_FILE" ]; then
    echo "El archivo $AUTH_FILE ya existe."
    echo "¿Deseas sobrescribirlo? (s/n)"
    read respuesta
    if [[ "$respuesta" != "s" && "$respuesta" != "S" ]]; then
        echo "Operación cancelada."
        exit 1
    fi
fi

# Solicitar el Token de Telegram
echo "Por favor, ingresa el Token de tu bot de Telegram:"
read -r BOT_TOKEN

# Validar que el Token no esté vacío
if [ -z "$BOT_TOKEN" ]; then
    echo "Error: El Token no puede estar vacío."
    exit 1
fi

# Solicitar el ID de chat de Telegram
echo "Por favor, ingresa tu ID de chat de Telegram:"
read -r CHAT_ID

# Validar que el ID de chat no esté vacío
if [ -z "$CHAT_ID" ]; then
    echo "Error: El ID de chat no puede estar vacío."
    exit 1
fi

# Guardar el Token y el ID en el archivo auth
echo "$BOT_TOKEN" > "$AUTH_FILE"
echo "$CHAT_ID" >> "$AUTH_FILE"

# Verificar que el archivo se haya creado correctamente
if [ -f "$AUTH_FILE" ]; then
    echo "El archivo $AUTH_FILE se ha creado correctamente."
    echo "Contenido del archivo:"
    cat "$AUTH_FILE"
else
    echo "Error: No se pudo crear el archivo $AUTH_FILE."
    exit 1
fi

wget https://raw.githubusercontent.com/ETH973/AuthFile/main/regv2 && mv /root/regv2 /usr/bin/ && chmod +x /usr/bin/regv2

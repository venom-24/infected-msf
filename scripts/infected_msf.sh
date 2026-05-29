#!/data/data/com.termux/files/usr/bin/bash
clear
#VARIABLES

                red='\033[1;31m'
                green='\033[1;32m'
                yellow='\033[1;33m'
                blue='\033[1;34m'                                    magenta='\033[1;35m'                                 cyan='\033[1;36m'                                    reset='\033[0m'
banner(){
echo -e "\e[1;31m"
echo "
 ░▀█▀░█▀█░█▀▀░█▀▀░█▀▀░▀█▀░█▀▀░█▀▄
 ░░█░░█░█░█▀▀░█▀▀░█░░░░█░░█▀▀░█░█
 ░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░░▀░░▀▀▀░▀▀░"
echo
echo -e "\e[1;34m AUTOR   :\033[1;31m [\033[1;36mVENOM24\033[1;31m]"

echo -e "\e[1;34m TOOL    :\033[1;31m [\033[1;36mINFECTED\033[1;31m]"

echo -e "\e[1;34m VERSION :\033[1;31m [\033[1;36m2.0 FULL\033[1;31m]"
echo
echo -e "\e[1;36m ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■"
echo -e "\e[1;36m ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■"
echo
echo -e "\e[0;31m [\033[1;0m01\033[1;31m]\033[1;36m Crear    apk con msf"
echo -e "\e[0;31m [\033[1;0m02\033[1;31m]\033[1;36m Apktool  termux"
echo -e "\e[0;31m [\033[1;0m03\033[1;31m]\033[1;36m Infected rb"
echo -e "\e[0;31m [\033[1;0m04\033[1;31m]\033[1;36m Mover Metasploit"
echo -e "\e[0;31m [\033[1;0m05\033[1;31m]\033[1;36m Create   llave_jks"
echo -e "\e[0;31m [\033[1;0m06\033[1;31m]\033[1;36m ZipaKey  termux"
echo -e "\e[0;31m [\033[1;0m00\033[1;31m]\033[1;36m EXIT"
echo
}

err() {                                              
	echo -e " \033[1;31m  Error opcion invaalida"
	seleccion                                            
}


	seleccion() {                                  
#cd ~/Infected-msf
#echo -e "\e[1;31m"                                 
echo -e -n "\e[1;31m INFECTED >> ";     
printf $reset                                        
read OPCION;
case $OPCION in

	01) cd ~/infected-msf/scripts
        bash msfvenom_apk.sh
		        ;;  
	02) cd ~/infected-msf/scripts
         bash apktool_msf.sh
		;;
	03) cd ~/infected-msf/scripts
        ruby  infected.rb
	;;	
	04) cd ~/infected-msf/scripts
           bash mover_metasploit.sh

	;;
	05) cd ~/infected-msf/scripts
	bash create_jks.sh
	;;

	06) cd ~/infected-msf/scripts
	bash zipa-key.sh
		;;
			00) exit
	     ;;		
*) err
	;;
esac
}

banner                                              
seleccion


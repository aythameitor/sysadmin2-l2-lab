#!/bin/bash

# ==============================================================================
# SCRIPT: backup_and_rotate.sh
# DESCRIPCIÓN: Copia de seguridad comprimida con rotación automática de archivos.
# USO: ./backup_and_rotate.sh [DIRECTORIO_ORIGEN] [DIRECTORIO_DESTINO] [MAX_BACKUPS]
# ==============================================================================

SOURCE_DIR="${1:-./datos_para_backup}"
BACKUP_DIR="${2:-./backups}"
MAX_BACKUPS="${3:-3}"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_NAME="backup_${TIMESTAMP}.tar.gz"

echo -e "\e[36m==========================================================\e[0m"
echo -e "\e[36m [SYSTEM BACKUP] Inicio del proceso de copia de seguridad  \e[0m"
echo -e "\e[36m==========================================================\e[0m"

if [ ! -d "$SOURCE_DIR" ]; then
    echo -e "\e[31m[ERROR] El directorio de origen '$SOURCE_DIR' no existe.\e[0m"
    echo -e "\e[33m[INFO] Creando directorio de prueba '$SOURCE_DIR' con archivos de muestra...\e[0m"
    mkdir -p "$SOURCE_DIR"
    echo "Archivo de prueba de sistemas" > "$SOURCE_DIR/sys_log.txt"
    echo "Configuracion local" > "$SOURCE_DIR/config.conf"
fi

if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    echo -e "\e[32m[OK] Creado directorio de backups en: $BACKUP_DIR\e[0m"
fi

DEST_FILE="$BACKUP_DIR/$BACKUP_NAME"
echo -e "\e[33m[+] Generando backup comprimido: $DEST_FILE ...\e[0m"

tar -czf "$DEST_FILE" -C "$SOURCE_DIR" . 2>/dev/null

if [ $? -eq 0 ]; then
    echo -e "\e[32m[OK] Backup completado con exito: $BACKUP_NAME\e[0m"
else
    echo -e "\e[31m[ERROR] Fallo al crear la copia de seguridad.\e[0m"
    exit 1
fi

echo -e "\e[33m[+] Verificando politica de rotacion (Maximo $MAX_BACKUPS copias)...\e[0m"

CURRENT_BACKUPS=$(ls -1t "$BACKUP_DIR"/backup_*.tar.gz 2>/dev/null | wc -l)

if [ "$CURRENT_BACKUPS" -gt "$MAX_BACKUPS" ]; then
    echo -e "\e[33m[!] Se encontraron $CURRENT_BACKUPS backups. Eliminando las copias mas antiguas...\e[0m"
    
    # Obtener y eliminar los archivos sobrantes manteniedo los más recientes
    ls -1t "$BACKUP_DIR"/backup_*.tar.gz | tail -n +$((MAX_BACKUPS + 1)) | while read -r OLD_BACKUP; do
        rm -f "$OLD_BACKUP"
        echo -e "\e[31m  [-] Eliminado backup antiguo: $OLD_BACKUP\e[0m"
    done
else
    echo -e "\e[32m[OK] Cantidad de backups en regla ($CURRENT_BACKUPS/$MAX_BACKUPS).\e[0m"
fi

echo -e "\e[36m==========================================================\e[0m"
echo -e "\e[36m [COMPLETADO] Operacion finalizada correctamente.        \e[0m"
echo -e "\e[36m==========================================================\e[0m"
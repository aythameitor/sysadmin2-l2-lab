# 🐧 Linux Systems & Bash Shell Automation

Este módulo contiene herramientas de automatización desarrolladas en **Bash Shell** para la gestión operativa, monitorización de recursos y políticas de mantenimiento en servidores Linux (Debian/Ubuntu/RHEL).

---

## 📂 Contenido del Módulo

| Script | Descripción / Funcionalidad |
| :--- | :--- |
| **`monitor_de_sistema.sh`** | Monitorización de recursos críticos (CPU, RAM, disco y red) con alertas. |
| **`backup_y_rotacion.sh`** | Copias de seguridad automáticas comprimidas en `.tar.gz` con política de rotación. |

---

## 🚀 Detalles Técnicos y Scripts

### 🔹 1. Monitorización de Recursos (`monitor_de_sistema.sh`)
Script diseñado para auditar en tiempo real el estado de salud de un servidor Linux.

* **Puntos clave de control:**
  * Uso de CPU y métricas de carga del sistema (*Load Average*).
  * Consumo de memoria RAM y espacio swap.
  * Porcentaje de ocupación en puntos de montaje en disco (`/`).
  * Estado e interfaces de red.
* **Alertas:** Genera avisos visuales/logs si el consumo supera los umbrales de seguridad definidos.

#### 🖼️ Evidencia de Ejecución:
![Monitor de Sistema](../docs/capturas_bash/prueba%20monitor%20de%20sistema.png)

---

### 🔹 2. Gestión de Copias de Seguridad & Rotación (`backup_y_rotacion.sh`)
Solución en Bash para asegurar la disponibilidad de datos de producción y gestionar el ciclo de vida del almacenamiento.

* **Funcionalidad principal:**
  * Comprime directorios clave (ej. `/datos_para_backup`) generando archivos con marca temporal (*timestamp*).
  * Almacena las copias en la ruta estructurada (`/backups`).
  * **Política de rotación:** Purga automáticamente backups antiguos que superen los días de retención establecidos para evitar el colapso del disco.

#### 🖼️ Evidencia de Ejecución:
![Backup y Rotación](../docs/capturas_bash/Prueba%20backups%20funcionando.png)

---

## 💻 Requisitos y Modo de Uso

### Permisos de Ejecución
Para ejecutar estos scripts en tu entorno Linux, asigna permisos de ejecución mediante `chmod`:

```bash
chmod +x monitor_de_sistema.sh
chmod +x backup_y_rotacion.sh
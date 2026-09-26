# Bash Shell Scripting - Linux System Administration

Scripts de automatización en Bash para mantenimiento, monitorización y copias de seguridad en servidores Linux.

## 📄 Contenido y Pruebas de Ejecución

### 1. `monitor_de_sistema.sh`
- **Propósito:** Monitorización en tiempo real de recursos críticos del sistema (uso de CPU, memoria RAM, espacio en disco e interfaces de red).
- **Funcionalidad:** Compara el uso con umbrales predefinidos y genera alertas/logs ante eventos de alta carga.

**Prueba de ejecución:**
![Monitor de Sistema](../docs/capturas%20bash/prueba%20monitor%20de%20sistema.png)

---

### 2. `backup_y_rotacion.sh`
- **Propósito:** Gestión automatizada de copias de seguridad y retención.
- **Funcionalidad:** Empaqueta y comprime directorios de datos especificados, aplicando políticas de rotación para evitar el llenado de espacio en disco.

**Prueba de ejecución:**
![Backup y Rotación](../docs/capturas%20bash/Prueba%20backups%20funcionando.png)
# 🛠️ SysAdmin L2 / Infrastructure & Automation Lab

![OS](https://img.shields.io/badge/OS-Linux%20%7C%20Windows%20Server-blue?style=flat-square&logo=linux)
![Scripting](https://img.shields.io/badge/Scripting-Bash%20%7C%20PowerShell-4E1C97?style=flat-square&logo=powershell)
![Containers](https://img.shields.io/badge/Containers-Docker-2496ED?style=flat-square&logo=docker)
![Status](https://img.shields.io/badge/Status-Active%20Lab-brightgreen?style=flat-square)

Este repositorio reúne un conjunto de proyectos prácticos, scripts de automatización y procedimientos operativos orientados a la **administración de sistemas (SysAdmin L2)**, **soporte de infraestructuras** y **gestión de identidades**.

El objetivo de este laboratorio es demostrar capacidades técnicas reales en la resolución de incidencias, optimización de tareas repetitivas y despliegue de servicios en entornos corporativos.

---

## 📂 Estructura del Repositorio

- **`bash/`**: Automation scripts for Linux systems (Monitoring, Backups)
- **`powershell/`**: Active Directory management & user provisioning
- **`docker/`**: Containerized infrastructure services & compose files
- **`docs/`**: Technical documentation & execution screenshots

---

## 🚀 Proyectos y Funcionalidades Destacadas

### 🔹 1. Administración Windows & Active Directory (`/powershell`)
Automatización de tareas críticas en entornos Microsoft Active Directory usando PowerShell:
* **Aprovisionamiento masivo:** Script (`create-ADUsersFromCSV.ps1`) para la creación automatizada de cuentas de usuario desde fuentes de datos `.csv`[cite: 8].
* **Auditoría de Seguridad:** Script (`audit-InactiveADUsers.ps1`) para la detección y reporte de identidades inactivas[cite: 8].

👉 [Ver código y documentación de PowerShell](./powershell/)

---

### 🔹 2. Administración Linux & Mantenimiento (`/bash`)
Herramientas en Bash Shell para la gestión operativa de servidores Linux:
* **Monitorización de Recursos:** Script (`monitor_de_sistema.sh`) para control en tiempo real de uso de CPU, RAM, disco y red con umbrales de alerta[cite: 7].
* **Gestión de Respaldos:** Script (`backup_y_rotacion.sh`) para automatización de backups comprimidos y políticas de rotación de almacenamiento[cite: 7].

👉 [Ver código y documentación de Bash](./bash/)

---

### 🔹 3. Despliegue de Infraestructura (`/docker`)
* **Docker Compose:** Orquestación básica de servicios de red, servidores web (`Nginx`) y herramientas de gestión (`Portainer`).

👉 [Ver configuración de Docker](./docker/)

---

## 🖼️ Evidencias de Ejecución y Pruebas de Laboratorio

Todas las herramientas han sido probadas en entornos de laboratorio controlados. Puedes consultar las capturas directas de ejecución en la carpeta de documentación:

| Módulo | Descripción de la Prueba | Captura |
| :--- | :--- | :---: |
| **Linux Bash** | Verificación del Monitor de Sistema | [Ver Captura](./docs/capturas_bash/prueba%20monitor%20de%20sistema.png) |
| **Linux Bash** | Ejecución de Backup y Rotación | [Ver Captura](./docs/capturas_bash/Prueba%20backups%20funcionando.png) |
| **PowerShell** | Creación masiva de usuarios AD desde CSV | [Ver Captura](./docs/capturas_powershell/creacionUsuarios.png) |
| **PowerShell** | Auditoría y revisión de usuarios inactivos | [Ver Captura](./docs/capturas_powershell/revisionUsuarios.png) |

---

## 💻 Stack Tecnológico

* **Sistemas Operativos:** Linux (Debian/Ubuntu/RHEL), Windows Server.
* **Lenguajes & Scripting:** Bash Shell, PowerShell.
* **Virtualización y Contenedores:** Docker, Docker Compose.
* **Herramientas de Gestión:** Active Directory, interfaces CLI, utilidades POSIX.

---
*Desarrollado y mantenido por [Aythami Miguel Cabrera Mayor](https://github.com/)*
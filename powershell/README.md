# 🪟 Windows Server & Active Directory Automation (PowerShell)

Este módulo contiene scripts de automatización en **PowerShell** orientados a la administración de identidades, mantenimiento de Active Directory (AD DS) y provisión automatizada de usuarios en entornos corporativos Microsoft Windows Server.

---

## 📂 Contenido del Módulo

| Archivo | Descripción / Funcionalidad |
| :--- | :--- |
| **`create-ADUsersFromCSV.ps1`** | Aprovisionamiento masivo e ingesta de usuarios en Active Directory desde CSV. |
| **`audit-InactiveADUsers.ps1`** | Auditoría de seguridad, detección e informe de cuentas de usuario inactivas. |
| **`users.csv`** | Archivo estructurado de origen con datos de prueba de usuarios. |

---

## 🚀 Detalles Técnicos y Scripts

### 🔹 1. Creación Masiva de Usuarios (`create-ADUsersFromCSV.ps1`)
Script para automatizar la incorporación (*onboarding*) de nuevos empleados en Active Directory, reduciendo errores manuales y tiempos de gestión.

* **Características principales:**
  * Lee y procesa datos desde `users.csv` (Nombre, Apellidos, SamAccountName, Departamento, Email).
  * Verifica si la cuenta ya existe antes de la creación.
  * Crea los objetos de usuario en la Unidad Organizativa (OU) correspondiente.
  * Asigna contraseñas iniciales seguras y marca la opción de cambio obligatorio en el primer inicio de sesión.

#### 🖼️ Evidencia de Ejecución:
![Creación Masiva de Usuarios AD](../docs/capturas_powershell/creacionUsuarios.png)

---

### 🔹 2. Auditoría de Cuentas Inactivas (`audit-InactiveADUsers.ps1`)
Herramienta de hardening y cumplimiento de seguridad de identidades en Active Directory.

* **Características principales:**
  * Consulta el atributo `LastLogonDate` de los objetos de usuario en el dominio.
  * Identifica cuentas sin actividad en un periodo superior a $N$ días.
  * Exporta los resultados para su revisión técnica o deshabilitación programada.

#### 🖼️ Evidencia de Ejecución:
![Auditoría de Cuentas Inactivas AD](../docs/capturas_powershell/revisionUsuarios.png)

---

## 💻 Requisitos y Modo de Uso

### Requisitos Previos
* Windows PowerShell 5.1 / PowerShell 7+.
* Módulo de Active Directory (`ActiveDirectory`) instalado (RSAT o ejecutable en Controlador de Dominio).
* Permisos de administración en el dominio (Domain Admin o delegado para gestión de OU).

### Ejecución de los Scripts

```powershell
# Importación masiva de usuarios
.\create-ADUsersFromCSV.ps1 -CsvPath ".\users.csv"

# Auditoría de cuentas inactivas
.\audit-InactiveADUsers.ps1 -DaysInactive 90
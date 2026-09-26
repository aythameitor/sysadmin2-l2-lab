\# PowerShell Automation - Active Directory Management



Conjunto de scripts diseñados para optimizar tareas repetitivas de administración de sistemas en entornos Windows Server / Active Directory.



\## 📄 Contenido y Pruebas de Ejecución



\### 1. `create-ADUsersFromCSV.ps1`

\- \*\*Propósito:\*\* Automatiza el aprovisionamiento de cuentas de usuario en Active Directory a partir de un archivo estructurado `users.csv`.

\- \*\*Funcionalidad:\*\* Lee parámetros de entrada (Nombre, Apellidos, SamAccountName, Departamento, Email) y crea los objetos en la UO correspondiente.



\*\*Prueba de ejecución:\*\*

!\[Creación de Usuarios](../docs/capturas%20powershell/creacionUsuarios.png)



\---



\### 2. `audit-InactiveADUsers.ps1`

\- \*\*Propósito:\*\* Auditoría de seguridad y limpieza de identidades.

\- \*\*Funcionalidad:\*\* Identifica cuentas de usuario que no han iniciado sesión en un periodo superior a X días y exporta un informe técnico.



\*\*Prueba de ejecución:\*\*

!\[Revisión de Usuarios](../docs/capturas%20powershell/revisionUsuarios.png)


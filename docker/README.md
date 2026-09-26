\# 🐳 Docker Infrastructure \& Services Lab



Este módulo contiene la configuración y orquestación de servicios base de infraestructura utilizando \*\*Docker\*\* y \*\*Docker Compose\*\*.



El objetivo es desplegar un entorno aislado, persistente y gestionable para pruebas de red, servicios web y administración de contenedores.



\---



\## 📂 Contenido del Módulo



| Archivo | Descripción / Funcionalidad |

| :--- | :--- |

| \*\*`docker-compose.yml`\*\* | Archivo de orquestación para el despliegue multi-contenedor de Nginx y Portainer. |



\---



\## 🚀 Arquitectura del Despliegue



El archivo `docker-compose.yml` define dos servicios principales integrados en una red dedicada:



1\. \*\*Servidor Web Nginx (`webserver`):\*\*

&#x20;  \* \*\*Imagen:\*\* `nginx:alpine` (ligera y optimizada para producción).

&#x20;  \* \*\*Puerto:\*\* Mapeo del puerto local `8080` al puerto `80` del contenedor.

&#x20;  \* \*\*Persistencia:\*\* Volumen `nginx\_data` montado en `/usr/share/nginx/html`.



2\. \*\*Panel de Gestión Portainer (`portainer`):\*\*

&#x20;  \* \*\*Imagen:\*\* `portainer/portainer-ce:latest`.

&#x20;  \* \*\*Puerto:\*\* Mapeo del puerto local `9000` para la interfaz web de administración.

&#x20;  \* \*\*Sockets \& Datos:\*\* Acceso al socket local `/var/run/docker.sock` para control del daemon de Docker y volumen `portainer\_data` para persistencia.



3\. \*\*Red \& Aislamiento (`networks`):\*\*

&#x20;  \* Uso de una red puente dedicada (`lab\_network` con driver `bridge`) para asegurar la comunicación interna entre contenedores aislada de la red host.



\---



\## 🖼️ Evidencias de Ejecución y Pruebas de Laboratorio



\#### 1. Despliegue desde Consola (`docker compose up -d` y `docker compose ps`)

!\[Ejecución en Consola](../docs/capturas\_docker/Docker\_funcionando\_consola.png)



\#### 2. Confirmación de Servicio Web Nginx Funcionando

!\[Nginx Web Display](../docs/capturas\_docker/Docker\_demostracion\_nginx.png)



\#### 3. Estado de Contenedores en GUI (Docker Desktop)

!\[Docker Desktop](../docs/capturas\_docker/Docker\_desktop\_funcionando.png)



\---



\## 💻 Modo de Uso



\### Comandos de Despliegue



```bash

\# Iniciar los servicios en segundo plano

docker compose up -d



\# Verificar el estado de los contenedores

docker compose ps



\# Detener los contenedores

docker compose down


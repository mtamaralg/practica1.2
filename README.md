# Práctica: Despliegue Automatizado de una Aplicación Web LAMP

## 📖 Descripción General
Este repositorio contiene los scripts necesarios para instalar automáticamente una pila **LAMP** (Linux, Apache, MySQL, PHP) y desplegar de forma desatendida una aplicación web completa. 

El proceso automatiza no solo la instalación del software base, sino también la clonación del código fuente de la aplicación desde un repositorio público de GitHub, la creación de la base de datos, la gestión de usuarios y la importación del esquema de datos (script SQL).

## 📂 Estructura del Repositorio
El proyecto sigue una estructura modular separando la configuración web de los scripts de automatización:

* **`conf/`**: Contiene la configuración del servidor web.
  * `000-default.conf`: VirtualHost de Apache configurado para servir el directorio `/var/www/html/` dando prioridad a los archivos `index.php`.
* **`scripts/`**: Contiene la lógica de automatización y despliegue.
  * `.env`: Archivo de variables de entorno para configurar de forma segura las credenciales de la base de datos.
  * `install_lamp.sh`: Script que actualiza el sistema, instala Apache, MySQL y PHP, aplica la configuración del VirtualHost y reinicia los servicios.
  * `deploy.sh`: Script que crea la base de datos y su usuario, clona el código fuente de la aplicación web desde GitHub, lo ubica en el directorio público de Apache e importa el script SQL inicial.

## ⚙️ Configuración Previa

Antes de ejecutar los scripts, es **obligatorio** configurar las variables de entorno. 
Abre el archivo `scripts/.env` y modifica los valores de plantilla por tus propias credenciales:

```env
DB_HOST=localhost
DB_NAME=nombre_de_tu_base_de_datos
DB_USER=tu_usuario
DB_PASSWORD=tu_contraseña_segura
# Slim Framework 3 Application

## Instalación

requerimiento:
	version php -> ^5.6.30
	extension -> php_pdo_mysql.dll
				 php_mysqli.dll

archivo config:
	src/settings.php -> modificar apartir de la linea 20, reemplazar los valores de la propiedad dns, user y pass.

archivo php ini:
	php.ini -> configurar la zona horario en el archivo php.ini buscar el siguiente linea de codigo date.timezone y agregar = America/Lima
	quedaria de esta manera date.timezone = America/Lima

archivo BD:
	BD_CHOHO.sql -> se encuentra en la ruta base de proyecto.
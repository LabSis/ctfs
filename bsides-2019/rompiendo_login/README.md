DESAFÍO: ROMPIENDO LOGIN
=====================================

Link del enunciado: https://docs.google.com/document/d/1YG4FfeXCobiTgVaKRMH6l0NRKOrR_2yatiTXTkwl3O8/edit?usp=sharing

Instalación
-------------------
1. El archivo login.php debe ser accesible vía la URL que figura en su enunciado.
2. Colocar el hash ganador en el archivo login.php donde dice: [[AQUÍ VA EL HASH GANADOR]].
3. Copiar también el directorio vendor ya que ahí está el driver para acceder a MongoDB.
4. Ocultar el directorio vendor.
5. Crear base de datos en MongoDB llamada test con una colección llamada usuarios.
6. Ejecutar el script iniciar_datos.js para insertar los datos en MongoDB. Este script no debe estar en producción.


Resolución
-------------------
Se resuelve a través de una inyección no SQL en MongoDB.

Los parámetros del POST deberían ser:
1. usuario=juan
2. clave[$ne]=1

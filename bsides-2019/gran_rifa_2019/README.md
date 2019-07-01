DESAFÍO: GRAN RIFA 2019
=====================================

Link del enunciado: https://docs.google.com/document/d/1nbzpQmj0ntvTUVO_Z9wbOycKiszYQk_T4lK9UzflJbs/edit?usp=sharing

Instalación
-------------------
1. Crear el entorno virtual: python3 -m venv entorno_virtual.
2. Activar el entorno virtual: source entorno_virtual/bin/activate
3. Instalar los paquetes de requirements.txt con: python3 -m pip install -r requirements.txt
4. Crear la base de datos SQLite3 con: python3 manage.py migrate.
5. En settings.py poner el hash del desafío en la variable HASH_DESAFIO.
6. Para producción: poner DEBUG en False y ejecutar `python3 manage.py collectstatic`
7. Por cada equipo se deben ejecutar los siguientes pasos:  
  - Crear usuario para equipo: `User.objects.create(username="nombre_equipo", email="equipo@email.com", password="clave")`
  - Crear base de datos sqlite3: `nombre_equipo.sqlite3` y agregarlo en el settings.
  - Ejecutar migrates: `python3 manage.py migrate --database=nombre_equipo`
  - Cargar datos iniciales: `python3 manage.py loaddata initial_data --database=nombre_equipo`
  

Resolución
-------------------
Realizar una petición POST a /api/numeros/:id/editar/ en formato json enviar {"esta_pago": true} enviando la cookie de 
sesión. 

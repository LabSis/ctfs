DESAFÍO: CONSULTA DE MULTAS
=====================================

Link del enunciado: https://docs.google.com/document/d/1ZXvUpyXrO7a-MynREWnLQ_GgQlGmnXGy5gYLjZlltxA/edit?usp=sharing

Instalación
-------------------
1. Crear el entorno virtual: python3 -m venv entorno_virtual.
2. Activar el entorno virtual: source entorno_virtual/bin/activate
3. Instalar los paquetes de requirements.txt con: python3 -m pip install -r requirements.txt.
4. Crear la base de datos SQLite3 con: python3 manage.py migrate.
5. Para producción: poner DEBUG en False y ejecutar `python3 manage.py collectstatic`.


Resolución
-------------------
Utilizando la SECRET_KEY en el settings de Django para firmar el JWT, se debe generar otro JWT username administrador_multas@yopmail.com.

Para obtener la SECRET_KEY se debe ver el archivo jsonp.

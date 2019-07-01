import json
from django.conf import settings
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
from django.http.response import HttpResponse
from django.db import connections
from mensajeria.mensajeria.models import NumeroRifa, NumeroRifaForm, Mensaje
from mensajeria.routers import globals


def login_tmpl(request):
    if request.method == "GET":
        if request.user is not None and not request.user.is_anonymous:
            return redirect("mensajeria:inicio")
    elif request.method == "POST":
        txt_username = request.POST.get("txt-username", None)
        txt_password = request.POST.get("txt-password", None)
        if not txt_username or not txt_password:
            mensaje = "Nombre de usuario y clave son obligatorios"
            return render(request, 'mensajeria/login.html', {"mensaje": mensaje})

        user = authenticate(request, username=txt_username, password=txt_password)
        if user is None:
            mensaje = "Nombre de usuario o clave incorrecta."
            return render(request, 'mensajeria/login.html', {"mensaje": mensaje})
        else:
            login(request, user)
            return redirect("mensajeria:inicio")

    return render(request, 'mensajeria/login.html')


@login_required
def inicio_tmpl(request):
    return render(request, "mensajeria/inicio.html")


@login_required
def get_numeros(request):
    numeros = NumeroRifa.objects.all()
    lista_numeros = [n.get_dict() for n in numeros]
    numeros_json = json.dumps(lista_numeros)
    return HttpResponse(numeros_json, content_type="application/json")


@login_required
def editar_numero(request, id):
    dic_respuesta = {
        "estado": "NO"
    }
    if request.method == "POST":
        try:
            params = json.loads(request.body.decode("utf"))
            numero = NumeroRifa.objects.filter(id=id)
            numero.update(**params)
            dic_respuesta["estado"] = "OK"
        except Exception as e:
            print("Error al editar número: ", e)
            dic_respuesta["estado"] = "NO"

    return HttpResponse(json.dumps(dic_respuesta), content_type="application/json")


def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip


@login_required
def enviar_mensaje(request):
    if request.method == "POST":
        user_agent = request.META['HTTP_USER_AGENT']
        ip = get_client_ip(request)
        contenido = request.POST.get("contenido", None)
        if contenido is not None and len(str(contenido)) > 0:
            mensaje = Mensaje()
            mensaje.contenido = contenido
            mensaje.save()

            cursor = get_conexion_bd().cursor()
            consulta = "INSERT INTO accesos (ip, agente_usuario) VALUES ('%s', '%s')" % (ip, user_agent)
            cursor.executescript(consulta)

            dic_respuesta = {
                "estado": "OK",
                "datos": {}
            }

            return HttpResponse(json.dumps(dic_respuesta), content_type="application/json")
        else:
            dic_respuesta = {
                "estado": "NO",
                "datos": {}
            }
            return HttpResponse(json.dumps(dic_respuesta), content_type="application/json")
    else:
        dic_respuesta = {
            "estado": "NO",
            "datos": {}
        }

        return HttpResponse(json.dumps(dic_respuesta), content_type="application/json")


def get_conexion_bd():
    conexion_bd = "default"
    if hasattr(globals, "db"):
        conexion_bd = globals.db
    return connections[conexion_bd]


@login_required
def get_mensajes(request):
    if request.method == "GET":
        mensajes_dic = []
        mensajes = Mensaje.objects.all()
        for mensaje in mensajes:
            mensaje_dic = {}
            mensaje_dic["contenido"] = mensaje.contenido
            mensajes_dic.append(mensaje_dic)

        dic_respuesta = {
            "estado": "OK",
            "datos": {
                "mensajes": mensajes_dic
            }
        }
        return HttpResponse(json.dumps(dic_respuesta), content_type="application/json")
    else:
        dic_respuesta = {
            "estado": "NO",
            "datos": {}
        }

        return HttpResponse(json.dumps(dic_respuesta), content_type="application/json")

from django.contrib.auth.models import User
from django.shortcuts import render
from django.http import HttpResponse
from django.core.serializers.json import DjangoJSONEncoder
import json
from django.views.defaults import *
from django.conf import settings
from rest_framework_jwt.settings import api_settings
from rest_framework_jwt.utils import jwt_decode_handler
from rest_framework_jwt.authentication import BaseJSONWebTokenAuthentication


def get_user_by_jwt(jwt):
    payload = jwt_decode_handler(jwt)
    auth = BaseJSONWebTokenAuthentication()
    usuario = auth.authenticate_credentials(payload)
    return usuario


def get_usuario_de_jwt(request):
    usuario = request.user
    jwt = request.COOKIES.get('auth', None)
    if jwt is not None:
        try:
            usuario = get_user_by_jwt(jwt)
        except Exception as e:
            print(e)
    # Si es usuario anónimo, el usuario es None
    if usuario is not None and usuario.is_anonymous:
        usuario = None

    return usuario


def es(usuario, rol):
    if usuario is not None:
        for g in usuario.groups.all():
            if g.name == rol:
                return True
    return False


def es_normal(usuario):
    return es(usuario, 'normal')


def es_admin(usuario):
    return es(usuario, 'administrador')


def index_tmpl(request):
    return render(request, 'principal/index.html', {})


def multas_pagadas_tmpl(request):
    usuario = get_usuario_de_jwt(request)
    if usuario is None:
        return permission_denied(request, Exception("Sin permisos"))
    else:
        if es_normal(usuario):
            return render(request, 'principal/multas_pagadas.html', {'perfil': 'normal'})
        elif es_admin(usuario):
            return render(request, 'principal/multas_pagadas.html', {'perfil': 'administrador'})
        else:
            return permission_denied(request, Exception("Sin permisos"))


def perfil_tmpl(request):
    usuario = get_usuario_de_jwt(request)
    if usuario is None:
        return permission_denied(request, Exception("Sin permisos"))
    else:
        print(usuario.id)
        if es_normal(usuario):
            return render(request, 'principal/perfil.html', {'perfil': 'normal'})
        elif es_admin(usuario):
            return render(request, 'principal/perfil.html', {'perfil': 'administrador'})
        else:
            return permission_denied(request, Exception("Sin permisos"))


def logout(request):
    dic = {
        'mensaje': "OK",
        'datos': ""
    }

    status_code = 200

    respuesta = HttpResponse(json.dumps(dic, cls=DjangoJSONEncoder), content_type='application/json',
                             status=status_code)

    usuario = get_usuario_de_jwt(request)
    if usuario is not None:
        respuesta.delete_cookie('auth')
    return respuesta


def login(request):
    try:
        token = None

        nombre_usuario = request.POST["usuario"]
        clave = request.POST["clave"]
        if nombre_usuario is not None and clave is not None:
            try:
                usuario = User.objects.get(username=nombre_usuario)
            except Exception as ex:
                raise Exception('Usuario o contraseña inválida.')

            def _get_jwt(self, usuario):
                token = None
                try:
                    jwt_payload_handler = api_settings.JWT_PAYLOAD_HANDLER
                    jwt_encode_handler = api_settings.JWT_ENCODE_HANDLER

                    payload = jwt_payload_handler(usuario)
                    token = jwt_encode_handler(payload)
                except Exception:
                    pass
                return token

            if usuario.is_active:
                if usuario.check_password(clave):
                    jwt_payload_handler = api_settings.JWT_PAYLOAD_HANDLER
                    jwt_encode_handler = api_settings.JWT_ENCODE_HANDLER

                    payload = jwt_payload_handler(usuario)
                    token = jwt_encode_handler(payload)
                else:
                    raise Exception('Usuario o contraseña inválida.')
            else:
                raise Exception('El usuario no está activado.')
            mensaje = "OK"
            codigo = 200
    except Exception as e:
        mensaje = "ERROR"
        codigo = 403
        token = None
    dic = {
        'mensaje': mensaje,
        'datos': token
    }
    status_code = codigo

    respuesta = HttpResponse(json.dumps(dic, cls=DjangoJSONEncoder), content_type='application/json',
                             status=status_code)
    if status_code == 200:
        respuesta.set_cookie('auth', token, httponly=True)

    return respuesta


def get_multas(request):
    dic = {
        'mensaje': "OK",
        'datos': [
            {
                "identificador": 356200,
                "fecha_hora": "10/10/2017 17:40",
                "provincia": "Córdoba",
                "departamento": "Capital",
                "ciudad": "Ciudad de Córdoba",
                "motivo": "Exceso de velocidad",
                "precio": 5700
            },
            {
                "identificador": 442344,
                "fecha_hora": "01/02/2018 17:40",
                "provincia": "Córdoba",
                "departamento": "Colón",
                "ciudad": "Jesús María",
                "motivo": "Alcoholemia positiva",
                "precio": 14500
            },
            {
                "identificador": 452355,
                "fecha_hora": "05/08/2018 17:40",
                "provincia": "Córdoba",
                "departamento": "Cruz del Eje",
                "ciudad": "Cruz del Eje",
                "motivo": "Alcoholemia positiva",
                "precio": 24000
            }
        ]
    }
    status_code = 200

    respuesta = HttpResponse(json.dumps(dic, cls=DjangoJSONEncoder), content_type='application/json',
                             status=status_code)
    return respuesta


def get_multas_pagadas(request):
    if request.method == "GET":
        dic = {
            'mensaje': "OK",
            'datos': [
                {
                    "identificador": 356200,
                    "fecha_hora": "10/08/2016 17:40",
                    "provincia": "Córdoba",
                    "departamento": "Capital",
                    "ciudad": "Ciudad de Córdoba",
                    "motivo": "Circular sin cinturón de seguridad",
                    "precio": 450
                }
            ]
        }
        status_code = 200

        respuesta = HttpResponse(json.dumps(dic, cls=DjangoJSONEncoder), content_type='application/json',
                                 status=status_code)
    else:
        respuesta = HttpResponse({}, content_type='application/json',
                             status=500)
    return respuesta


def datos_jsonp(request):
    if request.method == "GET":
        callback = request.GET.get("callback", None)
        if callback is None:
            callback = "procesar"
        datos = {
            'MODO_DESARROLLO': False,
            'LANGUAGE_CODE': settings.LANGUAGE_CODE,
            'TIME_ZONE': 'UTC',
            'USE_I18N': settings.USE_I18N,
            'USE_L10N': settings.USE_L10N,
            'USE_TZ': settings.USE_TZ,
            'SECRET_KEY': settings.SECRET_KEY
        }
        respuesta = HttpResponse(callback + "(" + json.dumps(datos, cls=DjangoJSONEncoder) + ")", "text/javascript",
                            status=200)
    else:
        respuesta = HttpResponse({}, content_type='application/json',
                             status=500)
    return respuesta


def enviar_comentario_tmpl(request):
    if request.method == "POST":
        comentario = request.POST.get("comentario", None)
        dic = {
            'mensaje': "OK",
            'datos': {}
        }
        if comentario is not None:
            if len(comentario) > 0 and len(comentario) <= 900:
                dic = {
                    'mensaje': "OK",
                    'datos': {}
                }
                respuesta = HttpResponse(json.dumps(dic, cls=DjangoJSONEncoder), "application/json",
                                         status=200)
            else:
                dic = {
                    'mensaje': "Comentario vacío o muy largo.",
                    'datos': {}
                }
                respuesta = HttpResponse(json.dumps(dic, cls=DjangoJSONEncoder), content_type='application/json',
                                         status=500)
        else:
            dic = {
                'mensaje': "Comentario no definido.",
                'datos': {}
            }
            respuesta = HttpResponse(json.dumps(dic, cls=DjangoJSONEncoder), content_type='application/json',
                                     status=500)
    else:
        respuesta = HttpResponse({}, content_type='application/json',
                                 status=500)
    return respuesta

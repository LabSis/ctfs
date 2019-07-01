import json
from django.conf import settings
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
from django.http.response import HttpResponse
from mass_assignment_challenge.mass_assignment.models import NumeroRifa, NumeroRifaForm


def login_tmpl(request):
    if request.method == "GET":
        if request.user is not None and not request.user.is_anonymous:
            return redirect("mass_assignment:inicio")
    elif request.method == "POST":
        txt_username = request.POST.get("txt-username", None)
        txt_password = request.POST.get("txt-password", None)
        if not txt_username or not txt_password:
            mensaje = "Nombre de usuario y clave son obligatorios"
            return render(request, 'mass_assignment/login.html', {"mensaje": mensaje})

        user = authenticate(request, username=txt_username, password=txt_password)
        if user is None:
            mensaje = "Nombre de usuario o clave incorrecta."
            return render(request, 'mass_assignment/login.html', {"mensaje": mensaje})
        else:
            login(request, user)
            return redirect("mass_assignment:inicio")

    return render(request, 'mass_assignment/login.html')


@login_required
def inicio_tmpl(request):
    hay_numeros_pagos = NumeroRifa.objects.filter(esta_pago=True).exists()
    hash_desafio = None
    if hay_numeros_pagos:
        hash_desafio = settings.HASH_DESAFIO
    return render(request, "mass_assignment/inicio.html",
                  {
                      "hay_numeros_pagos": hay_numeros_pagos,
                      "hash_desafio": hash_desafio
                  })


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

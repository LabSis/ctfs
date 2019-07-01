from django.conf.urls import url, include
from mensajeria.mensajeria.views import login_tmpl, inicio_tmpl, get_numeros, editar_numero, enviar_mensaje, get_mensajes


app_name = "mensajeria"

urlpatterns = [
    url(r"^$", inicio_tmpl, name="inicio"),
    url(r"^login/$", login_tmpl, name="login"),
    url(r"^api/numeros/$", get_numeros, name="get_numeros"),
    url(r"^api/numeros/(?P<id>[0-9]+)/editar/$", editar_numero, name="editar_numero"),
    url(r"^api/enviar_mensaje/$", enviar_mensaje, name="enviar_mensaje"),
    url(r"^api/mensajes/$", get_mensajes, name="get_mensajes"),
]

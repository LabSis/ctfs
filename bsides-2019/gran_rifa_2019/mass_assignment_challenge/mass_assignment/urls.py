from django.conf.urls import url, include
from mass_assignment_challenge.mass_assignment.views import login_tmpl, inicio_tmpl, get_numeros, editar_numero


app_name = "mass_assignment"

urlpatterns = [
    url(r"^$", inicio_tmpl, name="inicio"),
    url(r"^login/$", login_tmpl, name="login"),
    url(r"^api/numeros/$", get_numeros, name="get_numeros"),
    url(r"^api/numeros/(?P<id>[0-9]+)/editar/$", editar_numero, name="editar_numero"),
]

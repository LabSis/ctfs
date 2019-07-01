from django.conf.urls import url

from django.views.generic.base import TemplateView
from escalamiento_privilegio.principal.views import *

app_name = 'principal'
urlpatterns = [
    url(r'^$', index_tmpl, name='index_tmpl'),
    url(r'^perfil/$', perfil_tmpl, name='perfil_tmpl'),
    url(r'^multas_pagadas_tmpl/$', multas_pagadas_tmpl, name='multas_pagadas_tmpl'),
    url(r'^enviar_comentario/$', enviar_comentario_tmpl, name='enviar_comentario'),
    url(r'^login/$', login, name='login'),
    url(r'^multas/$', get_multas, name='multas'),
    url(r'^multas_pagadas/$', get_multas_pagadas, name='multas_pagadas'),
    url(r'^logout/', logout, name="logout"),
    url(r'^jsonp/', datos_jsonp, name="jsonp"),
]

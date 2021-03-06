from django.db import models
from django.forms import ModelForm, CharField, IntegerField, BooleanField


class NumeroRifa(models.Model):
    numero = models.IntegerField(null=True)
    vendedor = models.CharField(null=True, max_length=100)
    comprador = models.CharField(null=True, max_length=100)
    esta_pago = models.BooleanField(default=False)

    def get_dict(self):
        dic = {
            "id": self.id,
            "numero": self.numero,
            "vendedor": self.vendedor,
            "comprador": self.comprador,
            "esta_pago": self.esta_pago
        }
        return dic

    class Meta:
        db_table = "numeros_rifa"
        ordering = ('numero', )


class NumeroRifaForm(ModelForm):
    numero = IntegerField(required=False)
    vendedor = CharField(required=False)
    comprador = CharField(required=False)
    esta_pago = BooleanField(required=False)

    class Meta:
        model = NumeroRifa
        fields = '__all__'


class Persona(models.Model):
    nombre_usuario = models.CharField(null=False, max_length=100)
    clave = models.CharField(null=False, max_length=100)

    class Meta:
        db_table = "personas"

class Mensaje(models.Model):
    contenido = models.CharField(null=False, max_length=1000)

    class Meta:
        db_table = "mensajes"

class Acceso(models.Model):
    agente_usuario = models.CharField(null=True, max_length=250)
    ip = models.CharField(null=True, max_length=100)

    class Meta:
        db_table = "accesos"
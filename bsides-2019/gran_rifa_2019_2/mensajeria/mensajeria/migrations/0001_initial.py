# Generated by Django 2.2.2 on 2019-06-05 21:54

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='NumeroRifa',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero', models.IntegerField(null=True)),
                ('vendedor', models.CharField(max_length=100, null=True)),
                ('comprador', models.CharField(max_length=100, null=True)),
                ('esta_pago', models.BooleanField(default=False)),
            ],
            options={
                'db_table': 'numeros_rifa',
                'ordering': ('numero',),
            },
        ),
    ]
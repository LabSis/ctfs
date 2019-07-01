$(document).ready(function() {
    $("#btn-enviar").click(function() {
        var comentario = $("#txa-comentario").val();
        $.ajax({
            url: "/enviar_comentario/",
            data: {
                comentario: comentario
            },
            type: "post",
            success: function(r) {
                alert("Comentario enviado exitosamente.");
            },
            error: function(r) {
                alert("Comentario vacío o muy largo.");
            }
        });
    });

    $.ajax({
        url: "/multas/",
        type: "get",
        data: {},
        success: function(r) {
            var $tblMultas = $("#tbl-multas");
            var datos = r.datos;
            for (var i = 0; i < datos.length; i++) {
                var $tr = $("<tr></tr>");
                var fila = datos[i];
                var identificador = fila.identificador;
                var $tdIdentificador = $("<td></td>");
                if (identificador !== undefined && identificador !== null) {
                    $tdIdentificador.text(identificador);
                }

                var fecha_hora = fila.fecha_hora;
                var $tdFechaHora = $("<td></td>");
                if (fecha_hora !== undefined && fecha_hora !== null) {
                    $tdFechaHora.text(fecha_hora);
                }

                var provincia = fila.provincia;
                var $tdProvincia = $("<td></td>");
                if (provincia !== undefined && provincia !== null) {
                    $tdProvincia.text(provincia);
                }

                var departamento = fila.departamento;
                var $tdDepartamento = $("<td></td>");
                if (departamento !== undefined && departamento !== null) {
                    $tdDepartamento.text(departamento);
                }

                var ciudad = fila.ciudad;
                var $tdCiudad = $("<td></td>");
                if (ciudad !== undefined && ciudad !== null) {
                    $tdCiudad.text(ciudad);
                }

                var motivo = fila.motivo;
                var $tdMotivo = $("<td></td>");
                if (motivo !== undefined && motivo !== null) {
                    $tdMotivo.text(motivo);
                }

                var precio = fila.precio;
                var $tdPrecio = $("<td></td>");
                if (precio !== undefined && precio !== null) {
                    $tdPrecio.text(precio);
                }

                $tr.append($tdIdentificador);
                $tr.append($tdFechaHora);
                $tr.append($tdProvincia);
                $tr.append($tdDepartamento);
                $tr.append($tdCiudad);
                $tr.append($tdMotivo);
                $tr.append($tdPrecio);
                $tblMultas.append($tr);
            }
        },
        error: function(r) {

        }
    });
});
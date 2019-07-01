$(document).ready(function () {
    var $tablaNumeros = $("#tabla-numeros");
    var $modalMensaje = $("#modal-mensaje");

    $tablaNumeros.on("click", ".btn-editar-numero", function () {
        var textoBtn = $(this).text();
        if (textoBtn === "Editar") {
            $(this).parents("tr").find(".input-comprador").prop("disabled", false);
            $(this).text("Guardar");
        } else {
            var $inputComprador = $(this).parents("tr").find(".input-comprador");
            $inputComprador.prop("disabled", true);
            $(this).text("Editar");

            var numero = $(this).data("numero");
            var nuevoComprador = $inputComprador.val();

            editarComprador(numero.id, nuevoComprador);
        }

    });

    function editarComprador(idNumero, comprador) {
        var datosAEnviar = {
            comprador: comprador
        };

        $.ajax({
            url: "/api/numeros/" + idNumero + "/editar/",
            type: "post",
            contentType: "application/json",
            dataType: "json",
            data: JSON.stringify(datosAEnviar),
            success: function (response) {
                if (response.estado === "OK") {
                    mostrarMensaje("Éxito", "El número se modificó correctamente.");
                } else {
                    mostrarMensaje("Error", "Ha ocurrido un error.");
                }
            }
        });
    }

    function consultarNumeros(callback) {
        $.ajax({
            url: "/api/numeros/",
            type: "get",
            dataType: "json",
            success: function (numeros) {
                if (typeof callback === "function") {
                    callback(numeros);
                }
            }
        })
    }

    function renderizarNumeros(numeros) {
        $tablaNumeros.find("tbody").find("tr:not(.clone)").remove();
        var $trClone = $tablaNumeros.find("tr.clone");

        for (var i = 0; i < numeros.length; i++) {
            var numero = numeros[i];
            var $tr = $trClone.clone();
            $tr.removeClass("hidden");
            $tr.find(".td-numero").text(numero.numero);
            $tr.find(".input-comprador").val(numero.comprador);
            $tr.find(".td-vendedor").text(numero.vendedor);
            $tr.find(".td-esta-pago").text((numero.esta_pago) ? "Sí" : "No");
            $tr.find(".btn-editar-numero").data("numero", numero);
            $tablaNumeros.find("tbody").append($tr);
        }
    }

    function mostrarMensaje(titulo, mensaje) {
        $modalMensaje.find(".modal-title").text(titulo);
        $modalMensaje.find(".mensaje").text(mensaje);

        $modalMensaje.modal({show: true});
    }

    consultarNumeros(renderizarNumeros);
});
$(document).ready(function () {
    var $tablaNumeros = $("#tabla-numeros");
    var $modalMensaje = $("#modal-mensaje");
    var $txtMensaje = $("#txt-mensaje");
    var $btnEnviarMensaje = $("#btn-enviar-mensaje");
    var $tablaMensajes = $("#tbl-mensajes-enviados");

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

    $btnEnviarMensaje.click(function () {
        var mensaje = $txtMensaje.val();
        if (mensaje.trim() === "") {
            mostrarMensaje("Mensaje vacío", "Debe introducir un mensaje antes de enviarlo.");
            $txtMensaje.focus();
            return;
        }

        $.ajax({
            url: "/api/enviar_mensaje/",
            type: "POST",
            data: {
                contenido: mensaje
            },
            success: function (response) {
                if (response.estado == "OK") {
                    mostrarMensaje("Éxito", "Mensaje enviado con éxito.");
                    $txtMensaje.val("");
                    renderizarMensaje(mensaje);
                } else {
                    mostrarMensaje("Error", "Ha ocurrido un error al enviar el mensaje.");
                }
            }
        });

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
        });
    }

    function consultarMensajes(callbackMensajes) {
        $.ajax({
            url: "/api/mensajes/",
            type: "get",
            dataType: "json",
            success: function (response) {
                if (response.estado === "OK") {
                    var mensajes = response.datos.mensajes;
                    if (typeof callbackMensajes === "function") {
                        callbackMensajes(mensajes);
                    }
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

    function renderizarMensaje(mensaje) {
        var $trMensaje = $("<tr></tr>");
        $trMensaje.append($("<td>" + mensaje + "</td>"));
        $tablaMensajes.find("tbody").append($trMensaje);
    }

    function renderizarMensajes(mensajes) {
        for(var i=0; i < mensajes.length; i++){
            renderizarMensaje(mensajes[i].contenido);
        }
    }

    function mostrarMensaje(titulo, mensaje) {
        $modalMensaje.find(".modal-title").text(titulo);
        $modalMensaje.find(".mensaje").text(mensaje);

        $modalMensaje.modal({show: true});
    }

    consultarNumeros(renderizarNumeros);
    consultarMensajes(renderizarMensajes)
});
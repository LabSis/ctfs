function procesarDatos(datos) {
    console.log("Atención: MODO DESARROLLO = " + datos.MODO_DESARROLLO);
}

$(document).ready(function () {
    $("#btn-cerrar-sesion").click(function () {
        $.ajax({
            url: "/logout/",
            type: "post",
            data: {},
            success: function (r) {
                location.href = "/";
            },
            error: function (r) {

            }
        });
    })
});
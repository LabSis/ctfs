$(document).ready(function() {
    $("#btn-iniciar").click(function() {
        var usuario = $("#usuario").val();
        var clave = $("#clave").val();
        if (usuario !== "" && clave !== "") {
            $.ajax({
                url: "/login/",
                type: "post",
                data: {
                    usuario: usuario,
                    clave: clave
                },
                success: function(r) {
                    if (r.mensaje === "OK") {
                        location.href = "/perfil/"
                    }
                },
                error: function(r) {
                    alert("El usuario o clave incorrecta.");
                }
            });
        } else {
            alert("Debe completar los datos.");
        }
    });
});
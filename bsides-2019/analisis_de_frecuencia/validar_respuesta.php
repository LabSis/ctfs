<?php

$ok = false;
$respuesta = filter_input(INPUT_POST, "respuesta");
$respuesta_correcta = "sentir,\r\n".
"sentir que tu mano es mi caricia,\r\n".
"sentir que tu sueño es mi deseo,\r\n".
"sentir que tu mirada es mi descanso,\r\n".
"sentir que tu nombre es mi canción,\r\n".
"sentir que tu boca es mi refugio,\r\n".
"sentir que tu alma es mi regalo.\r\n".
"sentir que existes...\r\n".
"sentir que vivo para amarte.";

$mensaje = "";
if(isset($respuesta)){
    if($respuesta === $respuesta_correcta){
        $ok = true;
    } else {
        $mensaje = "Respuesta incorrecta";
    }
}
?>
<html>
    <head>
        <title>Análisis de frecuencias</title>
        <style>
            body{
                background-size: cover;
                background-image: url(imagen.jpg);
                color: white;
            }
            div{
                padding: 5px;
                text-align: center;
            }
            textarea{
                padding: 5px;
            }
        </style>
    </head>
    <body>
        <h1>Análisis de frecuencias</h1>
        <?php if($ok): ?>
            [[AQUÍ VA EL HASH GANADOR]]
        <?php else: ?>
            <form method="POST" >
                <div>
                    INGRESÁ TU RESPUESTA
                </div>
                <div>
                    <textarea name="respuesta" cols="50" rows="10"></textarea>
                </div>
                <div>
                    <input type="submit" value="Enviar" />
                </div>
            </form>
            <h3><?php echo $mensaje ?></h3>
        <?php endif; ?>
    </body>
</html>


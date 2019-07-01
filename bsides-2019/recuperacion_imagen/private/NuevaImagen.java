import java.util.*;
import java.io.*;

/*
Crea un nuevo archivo a partir de otro dividiendo en paquetes de 80 bits (10
bytes), esto es, 5 filas x 16 columnas. Cada uno de esos paquete contiene un
error de un bit con respecto al original.

Si el archivo no es múltiplo de 10 bytes entonces los bytes restantes quedan
como el original.
*/

public class NuevaImagen{
    public static void main(String args[]) throws IOException, FileNotFoundException{
        File archivo = new File(args[0]);
        FileInputStream fis = new FileInputStream(archivo);
        // BufferedReader buf = new BufferedReader(new InputStreamReader(fis));

        File archivoSalida = new File("imagen_rota.png");
        FileOutputStream fos = new FileOutputStream(archivoSalida);

        int b;
        int bytesLeidos = 0;
        byte paquete[] = new byte[10];
        while((b = fis.read()) != -1){
            paquete[bytesLeidos] = (byte) b;
            bytesLeidos++;
            if(bytesLeidos == 10){
                // Paquete leído.
                modificarPaquete(paquete);
                fos.write(paquete);
                bytesLeidos = 0;
            }
        }
        for(int i = 0; i < bytesLeidos; i++){
            fos.write(paquete[i]);
        }
        fos.close();
        fis.close();
    }
    
    private static void modificarPaquete(byte[] paquete){
        int desplazamiento = (int) (Math.random() * 8);
        byte mascara = (byte) (1 << desplazamiento);
        int indiceByteAModificar = (int) (Math.random() * paquete.length);
        paquete[indiceByteAModificar] = (byte) (paquete[indiceByteAModificar] ^ mascara);
    }
}

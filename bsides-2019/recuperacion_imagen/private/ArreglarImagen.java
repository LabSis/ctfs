import java.util.*;
import java.io.*;

/*
Corrige una imagen a partir de los archivos de bits de paridad.
La salida es el archivo corregido.

ArreglarImagen archivoAArreglar bitsParidadOriginal bitsParidadImagenRota
*/

public class ArreglarImagen{
    public static void main(String args[]) throws IOException, FileNotFoundException{
        File archivoAArreglar = new File(args[0]);
        FileInputStream fis1 = new FileInputStream(archivoAArreglar);

        File archivoBitsParidadOriginal = new File(args[1]);
        FileInputStream fis2 = new FileInputStream(archivoBitsParidadOriginal);
        BufferedReader buf2 = new BufferedReader(new InputStreamReader(fis2));

        File archivoBitsParidad = new File(args[2]);
        FileInputStream fis3 = new FileInputStream(archivoBitsParidad);
        BufferedReader buf3 = new BufferedReader(new InputStreamReader(fis3));

        File archivoSalida = new File("imagen_corregida.png");
        FileOutputStream fos = new FileOutputStream(archivoSalida);

        int b;
        int bytesLeidos = 0;
        byte paquete[] = new byte[10];
        while((b = fis1.read()) != -1){
            paquete[bytesLeidos] = (byte) b;
            bytesLeidos++;
            if(bytesLeidos == 10){
                
                BitsParidad bpOriginal = leerBitsParidad(buf2);
                BitsParidad bpNuevo = leerBitsParidad(buf3);
                
                byte[] bpFilasOriginal = bpOriginal.bpFilas;
                byte[] bpColumnasOriginal = bpOriginal.bpColumnas;
                byte[] bpFilas = bpNuevo.bpFilas;
                byte[] bpColumnas = bpNuevo.bpColumnas;
                // Paquete leído.
                arreglarPaquete(paquete, bpFilasOriginal, bpColumnasOriginal, 
                    bpFilas, bpColumnas);
                fos.write(paquete);
                bytesLeidos = 0;
            }
        }
        for(int i = 0; i < bytesLeidos; i++){
            fos.write(paquete[i]);
        }
        fos.close();
        fis1.close();
        buf2.close();
        buf3.close();
    }
    
    private static void arreglarPaquete(byte[] paquete, byte[] bpFilasOriginal,
        byte[] bpColumnasOriginal, byte[] bpFilas, byte[] bpColummnas){
        int fila = 0, columna = 0;
        for(int i = 0; i < bpFilasOriginal.length; i++){
            if(bpFilasOriginal[i] != bpFilas[i]){
                fila = i;
            }
        }
        for(int i = 0; i < bpColumnasOriginal.length; i++){
            if(bpColumnasOriginal[i] != bpColummnas[i]){
                columna = i;
            }
        }
        System.out.println(fila + ", " + columna);
        int indFila = fila * 2;

        int mascara = 1 << (8 - (columna % 8) - 1);
        System.out.println("Mascara" + mascara);
        if(columna >= 8){
            System.out.println("Segundo byte");
            paquete[indFila] ^= mascara;
        }else{
            System.out.println("Primer byte");
            paquete[indFila + 1] ^= mascara;
        }
    }

    private static BitsParidad leerBitsParidad(BufferedReader buf){
        BitsParidad bp = new BitsParidad();
        try{
            String linea = buf.readLine();
            String partes[] = linea.split(" ");
            String bpFilasString = partes[0];
            String bpColumnasString = partes[1];
            byte bpFilas[] = new byte[bpFilasString.length()];
            byte bpColumnas[] = new byte[bpColumnasString.length()];
            for(int i = 0; i < bpFilasString.length(); i++){
                bpFilas[i] = Byte.parseByte(bpFilasString.charAt(i) + "");
            }
            for(int i = 0; i < bpColumnasString.length(); i++){
                bpColumnas[i] = Byte.parseByte(bpColumnasString.charAt(i) + "");
            }
            bp.bpFilas = bpFilas;
            bp.bpColumnas = bpColumnas;
        }catch(IOException ex){
        }
        return bp;
    }
    
    static class BitsParidad{
        byte bpFilas[];
        byte bpColumnas[];
    }
}

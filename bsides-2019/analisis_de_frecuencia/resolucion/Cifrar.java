import java.util.*;
import java.io.*;
public class Cifrar{

    private static char[] abecedario = new char[]{
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
        'ñ', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'á',
        'é', 'í', 'ó', 'ú', ',', '.', ' '
    };

    private static int desplazamiento = 4;

    public static void main(String args[]) throws FileNotFoundException {
    
        if (args.length > 0) {
            desplazamiento = Integer.parseInt(args[0]);
        }        
    
        // El archivo a descrifrar o a cifrar
        Scanner sc = new Scanner(new File("datos/texto_cifrado"));
        LinkedList<String> lineas = new LinkedList<>();
        while(sc.hasNextLine()){
            String linea = sc.nextLine();
            lineas.add(linea);
        }
        StringBuilder resultado = new StringBuilder();
        for(String linea : lineas){
            StringBuilder sb = new StringBuilder();
            for(int i = 0; i < linea.length(); i++){
                char nuevoChar = cesar(linea.charAt(i));
                sb.append(nuevoChar);
            }
            resultado.append(sb.toString()).append("\n");
        }
        System.out.println(resultado);
    }
    
    private static char cesar(char caracter){
        int indice = 0;
        for(int i = 0; i < abecedario.length; i++){
            if(abecedario[i] == caracter){
                indice = i;
            }
        }
        indice = (indice + desplazamiento);
        if (indice < 0) {
            return abecedario[abecedario.length - ((indice * -1) % abecedario.length) - 1];
        } else {
            return abecedario[indice % abecedario.length];
        }
    }
}

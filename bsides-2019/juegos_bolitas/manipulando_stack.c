#include <stdio.h>
#include <stdlib.h>

/*
Para compilar:
    gcc desafio8.c -fno-stack-protector
*/

void main(void){
    printf("Ingrese su nombre:\n");
    int turno = 2;
    int suma = 0;
    char nombre[80];

    scanf("%s", nombre);

    int n = 0;

    while(suma < 15){
        printf("\nElige un número:\n");
        scanf("%d", &n);
        while(n <= 0 || n >= 3){
            printf("Reintente, 1 ó 2:\n");
            scanf("%d", &n);
        }
        suma += n;
        printf("La suma es: %d\n", suma);
        turno = 1;

        if(suma == 15){
            break;
        }

        n = 3 - n;
        printf("\nLa computadora eligió: %d\n", n);
        suma += n;
        printf("La suma es: %d\n", suma);
        turno = 2;
    }

    if(turno == 2){
        printf ("PERDISTE\n");
    }else{
        printf ("GANASTE: eca0049bb012c0ab9df50049c750cdc3\n");
    }
}

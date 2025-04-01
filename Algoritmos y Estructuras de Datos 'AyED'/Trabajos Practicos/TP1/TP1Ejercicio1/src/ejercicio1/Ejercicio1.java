/* 1. Escriba tres métodos de clase (static) que reciban por parámetro dos números enteros (tipo 
int) a y b e impriman todos los números enteros comprendidos entre a; b (inclusive), uno por 
cada línea en la salida estándar. Para ello, dentro de una nueva clase escriba un método por 
cada uno de los siguientes incisos: 
a. Que realice lo pedido con un for. 
b. Que realice lo pedido con un while. 
c. Que realice lo pedido sin utilizar estructuras de control iterativas (for, while, do 
while). 
Por último, escriba en el método de clase main el llamado a cada uno de los métodos 
creados, con valores de ejemplo. En su computadora, ejecute el programa y verifique 
que se cumple con lo pedido.  */

package ejercicio1;

public class Ejercicio1 {

    
    public static String metodoFor(int inf , int sup){
        String retorno = "";
       
        for(int i=inf ; i<=sup ;i++){
            retorno = retorno + i + "\n";
        }
            
       return retorno;    
    }
    
    public static String metodoWhile(int inf, int sup){
        String retorno = "";

        int i=inf;
        
        while(i<=sup){
            retorno = retorno + i + "\n";
            i++;
        }
        
        return retorno;
    }
    
    public static void metodoRecursivo(int inf , int sup){
        if(inf>sup) 
            return;
        System.out.println(inf);
        metodoRecursivo(inf+1,sup);
    }
    

    public static void main(String[] args) {
        int a=1 ; int b=5;
        
        int inf,sup;
        if(a<b){
            inf=a;
            sup=b;
        }else{
            inf=b;
            sup=a;
        }
        
        System.out.println("Imprimir con For \n"+Ejercicio1.metodoFor(inf, sup));
        System.out.println("Imprimir con While \n"+Ejercicio1.metodoWhile(inf, sup));
        System.out.println("Imprimir Recursivo");
        Ejercicio1.metodoRecursivo(inf, sup);    
    }
    
}

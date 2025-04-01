
package contarparrecursivo;

import java.util.List;
import java.util.ArrayList;
/**
 *
 * @author DEMIA
 */
public class ContarParRecursivo {

    public static void main(String[] args) {
        /*PSEUDO CODIGO
          metodo contarPares(Lista)
            si(la lista esta vacia o llegue al final) // CASO BASE
                devolver 0
            sino    //CASO RECURSIVO
                Evaluacion del primer elemento: si es par se suma 1
                sino 0
                Se llama recusivamente a contarPares() con el resto de la lista
        */      
        
        List<Integer> Lista = new ArrayList<>();
        Lista.add(3);
        Lista.add(8);
        Lista.add(10);
        Lista.add(12);
        System.out.println("La cantidad de numeros pares es: "+ContarParRecursivo.contarPares(Lista));
        
    }
    
    public static int contarPares(List<Integer> Lista){
        if(!Lista.isEmpty()){
            return contarParesRecursivo(Lista,0);
        }
        else
            return 0;        
    }
    
    private static int contarParesRecursivo(List<Integer> Lista , int indice){
        if(indice == Lista.size())  //CASO BASE, se llega al final de la lista
            return 0;
        else
            return evaluarPar(Lista.get(indice)) + contarParesRecursivo(Lista,indice+1);   //Llamada recursiva aumentando el indice
    }                                                                                      //de la lista
    
    private static int evaluarPar(int valor){
    int par = 0;
    if(valor % 2 == 0)
        par = 1;
    return par;
    }
    
}

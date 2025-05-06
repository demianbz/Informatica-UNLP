/* a) Implemente en la clase RecorridosAG los siguientes métodos:
 public List<Integer> numerosImparesMayoresQuePreOrden (GeneralTree <Integer> a,
 Integer n)
 Método que retorna una lista con los elementos impares del árbol “a” que sean mayores al valor “n”
 pasados como parámetros, recorrido en preorden.
 public List<Integer> numerosImparesMayoresQueInOrden (GeneralTree <Integer> a,
 Integer n)
 Método que retorna una lista con los elementos impares del árbol “a” que sean mayores al valor “n”
 pasados como parámetros, recorrido en inorden.
 public List<Integer> numerosImparesMayoresQuePostOrden (GeneralTree <Integer> a,
 Integer n)
 Método que retorna una lista con los elementos impares del árbol “a” que sean mayores al valor “n”
 pasados como parámetros, recorrido en postorden.
 public List<Integer> numerosImparesMayoresQuePorNiveles(GeneralTree <Integer> a,
 Integer n)
 Método que retorna una lista con los elementos impares del árbol “a” que sean mayores al valor “n”
 pasados como parámetros, recorrido por niveles.
 b) Si ahora tuviera que implementar estos métodos en la clase GeneralTree<T>, ¿qué modificaciones
 haría tanto en la firma como en la implementación de los mismos?*/
package tp3ejercicio2;

import java.util.List;

public class TP3Ejercicio2 {

    public static void main(String[] args) {
        GeneralTree<Integer> arbolA = new GeneralTree<>(4);
        GeneralTree<Integer> arbolB = new GeneralTree<>(2);
        GeneralTree<Integer> arbolC = new GeneralTree<>(8);
        GeneralTree<Integer> arbolD = new GeneralTree<>(7);
        GeneralTree<Integer> arbolE = new GeneralTree<>(6);
        GeneralTree<Integer> arbolF = new GeneralTree<>(3);
        GeneralTree<Integer> arbolG = new GeneralTree<>(-9);
        GeneralTree<Integer> arbolH = new GeneralTree<>(5);
        
        arbolA.addChild(arbolB);
        arbolA.addChild(arbolC);
        arbolA.addChild(arbolD);
        
        arbolB.addChild(arbolE);
        arbolB.addChild(arbolF);
        arbolB.addChild(arbolG);
        
        arbolD.addChild(arbolH );
        
        arbolA.recorridoPorNiveles();
        System.out.println("\n");
        
        System.out.println("Elementos impares del árbol que sean mayores al valor N, pasado como parametro");
        RecorridosAG r = new RecorridosAG();
        
        List<Integer> l = r.numerosImparesMayoresQuePreOrden(arbolA, 3);
        System.out.println("----Recorrido PreOrden----");
        System.out.println(l);
        
        l = r.numerosImparesMayoresQueInOrden(arbolA, 1);
        System.out.println("----Recorrido InOrden----");
        System.out.println(l);
        
        l = r.numerosImparesMayoresQuePostOrden(arbolA, 5);
        System.out.println("----Recorrido PostOrden----");
        System.out.println(l);
    
        l= r.numerosImparesMayoresQuePorNiveles(arbolA, 2);
        System.out.println("----Recorrido Por Niveles----");
        System.out.println(l);
    
    }
    
    
}

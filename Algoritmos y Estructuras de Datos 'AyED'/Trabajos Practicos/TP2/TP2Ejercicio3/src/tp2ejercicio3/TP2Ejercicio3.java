/*
 Ejercicio 3
 Defina una clase Java denominada ContadorArbol cuya función principal es proveer métodos de
 validación sobre árboles binarios de enteros. Para ello la clase tiene como variable de instancia un
 BinaryTree<Integer>. Implemente en dicha clase un método denominado numerosPares() que
 devuelve en una estructura adecuada (sin ningún criterio de orden) todos los elementos pares del
 árbol (divisibles por 2).
 a) Implemente el método realizando un recorrido InOrden.
 b) Implemente el método realizando un recorrido PostOrden.
 */
package tp2ejercicio3;

import java.util.ArrayList;

public class TP2Ejercicio3 {

    public static void main(String[] args) {
        BinaryTree<Integer> a = new BinaryTree<>(4);
        a.addLeftChild(new BinaryTree<>(2));
        a.addRightChild(new BinaryTree<>(6));
        a.getLeftChild().addLeftChild(new BinaryTree<>(1));
        a.getLeftChild().addRightChild(new BinaryTree<>(3));
        a.getRightChild().addLeftChild(new BinaryTree<>(5));
        a.getRightChild().addRightChild(new BinaryTree<>(8));
        ContadorArbol ab = new ContadorArbol(a);
        
        ArrayList<Integer> listInt = ab.numerosParesInOrden();
        System.out.println("Los elementos pares del arbol InOrden son:");
        System.out.println(listInt);
        
        System.out.println("");
        
        listInt = ab.numerosParesPostOrden();
        System.out.println("Los elementos pares del arbol PostOrden son:");
        System.out.println(listInt);
    }
    
}

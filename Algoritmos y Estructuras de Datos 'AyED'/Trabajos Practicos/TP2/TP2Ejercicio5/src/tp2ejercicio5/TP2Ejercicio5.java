/*
Ejercicio 5
Implemente una clase Java llamada ProfundidadDeArbolBinario que tiene como variable de instancia un árbol binario de 
números enteros y un método de instancia sumaElementosProfundidad (int p):int el cuál devuelve la suma de todos los nodos del árbol
que se encuentren a la profundidad pasada como argumento.
 */

package tp2ejercicio5;


public class TP2Ejercicio5 {

    public static void main(String[] args) {
        BinaryTree<Integer> ab = new BinaryTree<>(4);
        ab.addLeftChild(new BinaryTree<>(2));
        ab.addRightChild(new BinaryTree<>(6));
        ab.getLeftChild().addLeftChild(new BinaryTree<>(1));
        ab.getLeftChild().addRightChild(new BinaryTree<>(3));
        ab.getRightChild().addLeftChild(new BinaryTree<>(5));
        ab.getRightChild().addRightChild(new BinaryTree<>(8));
        
        ProfundidadDeArbolBinario a = new ProfundidadDeArbolBinario(ab);
        System.out.println(a.sumaElementosProfundidad(2));
    }
    
}

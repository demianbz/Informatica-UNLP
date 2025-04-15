/*
 Una red binaria es una red que posee una topología de árbol binario lleno. Por ejemplo:
Los nodos que conforman una red binaria llena tiene la particularidad de que todos ellos conocen
 cuál es su retardo de reenvío. El retardo de reenvío se define como el período comprendido entre
 que un nodo recibe un mensaje y lo reenvía a sus dos hijos.
 Su tarea es calcular el mayor retardo posible, en el camino que realiza un mensaje desde la raíz
 hasta llegar a las hojas en una red binaria llena. En el ejemplo, debería retornar 10+3+9+12=34
 (Si hay más de un máximo retorne el último valor hallado).
 Nota: asuma que cada nodo tiene el dato de retardo de reenvío expresado en cantidad de
 segundos.
 a) Indique qué estrategia (recorrido en profundidad o por niveles) utilizará para resolver el
 problema.
 b) Cree una clase Java llamada RedBinariaLlena donde implementará lo solicitado en el
 método retardoReenvio():int
 */
package tp2ejercicio4;

public class TP2Ejercicio4 {

    public static void main(String[] args) {
        BinaryTree<Integer> ab = new BinaryTree<>(4);
        ab.addLeftChild(new BinaryTree<>(2));
        ab.addRightChild(new BinaryTree<>(6));
        ab.getLeftChild().addLeftChild(new BinaryTree<>(1));
        ab.getLeftChild().addRightChild(new BinaryTree<>(3));
        ab.getRightChild().addLeftChild(new BinaryTree<>(5));
        ab.getRightChild().addRightChild(new BinaryTree<>(8));
        
        RedBinariaLlena a = new RedBinariaLlena(ab);
        System.out.println("El mayor retardo posible es de: " + a.retardoReenvio() + " segundos");
    }
    
}

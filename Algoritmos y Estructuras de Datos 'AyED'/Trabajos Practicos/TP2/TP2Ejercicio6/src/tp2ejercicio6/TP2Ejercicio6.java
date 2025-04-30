/*
 Cree una clase Java llamada Transformacion que tenga como variable de instancia un árbol
 binario de números enteros y un método de instancia suma (): BinaryTree<Integer> el cuál
 devuelve el árbol en el que se reemplazó el valor de cada nodo por la suma de todos los
 elementos presentes en su subárbol izquierdo y derecho. Asuma que los valores de los subárboles
 vacíos son ceros. Por ejemplo:
 ¿Su solución recorre una única vez cada subárbol? En el caso que no, ¿Puede mejorarla para que
 sí lo haga?
 */
package tp2ejercicio6;


public class TP2Ejercicio6 {

    public static void main(String[] args) {
        BinaryTree<Integer> ab = new BinaryTree<>(4);
        ab.addLeftChild(new BinaryTree<>(2));
        ab.addRightChild(new BinaryTree<>(6));
        ab.getLeftChild().addLeftChild(new BinaryTree<>(1));
        ab.getLeftChild().addRightChild(new BinaryTree<>(3));
        ab.getRightChild().addLeftChild(new BinaryTree<>(5));
        ab.getRightChild().addRightChild(new BinaryTree<>(8));
        
        System.out.println("-----Arbol Cargado-----");
        ab.imprimirArbol();
        System.out.println();
        
        Transformacion a = new Transformacion(ab);
        a.suma();
        
        System.out.println("-----Arbol transformado-----");
        a.imprimirArbol();
        System.out.println();
        
        

        
    }
}
    


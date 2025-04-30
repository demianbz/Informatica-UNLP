/*
Ejercicio 9
 Escribir en una clase ParcialArboles el método público con la siguiente firma:
 public BinaryTree<?> sumAndDif(BinaryTree<Integer> arbol)
 El método recibe un árbol binario de enteros y devuelve un nuevo árbol que contenga en cada
 nodo dos tipos de información:
 ● Lasuma de los números a lo largo del camino desde la raíz hasta el nodo actual.
 ● Ladiferencia entre el número almacenado en el nodo original y el número almacenado en el
 nodo padre
*/
package tp2ejercicio9;

public class TP2Ejercicio9 {

    public static void main(String[] args) {
        ParcialArboles p = new ParcialArboles();
        
        BinaryTree<Integer> ab = new BinaryTree<>(20);
        ab.addLeftChild(new BinaryTree<>(5));
        ab.getLeftChild().addLeftChild(new BinaryTree<>(-5));
        ab.getLeftChild().addRightChild(new BinaryTree<>(10));
        ab.getLeftChild().getRightChild().addLeftChild(new BinaryTree<>(1));
        ab.addRightChild(new BinaryTree<>(30));
        ab.getRightChild().addLeftChild(new BinaryTree<>(50));
        ab.getRightChild().addRightChild(new BinaryTree<>(-9));
        ab.getRightChild().getLeftChild().addRightChild(new BinaryTree<>(4));
        ab.getRightChild().getLeftChild().getRightChild().addRightChild(new BinaryTree<>(6));
        
        System.out.println("Arbol Cargado");
        ab.imprimirArbol();
        System.out.println("");
        
        System.out.println("Nuevo Arbol");
        BinaryTree<SumyDif> nuevoArbol = p.sumAndDif(ab);
        p.imprimirPreorden(nuevoArbol);

    }
}
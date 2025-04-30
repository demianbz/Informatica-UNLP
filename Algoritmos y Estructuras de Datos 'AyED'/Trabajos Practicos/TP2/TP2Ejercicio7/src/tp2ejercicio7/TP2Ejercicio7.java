/*
Escribir en una clase ParcialArboles que contenga UNA ÚNICA variable de instancia de tipo
 BinaryTree de valores enteros NO repetidos y el método público con la siguiente firma:
 public boolean isLeftTree (int num)
 El método devuelve true si el subárbol cuya raíz es “num”, tiene en su subárbol izquierdo una
 cantidad mayor estricta de árboles con un único hijo que en su subárbol derecho. Y false en caso
 contrario. Consideraciones:
 ● Si“num” no se encuentra en el árbol, devuelve false.
 ● Siel árbol con raíz “num” no cuenta con una de sus ramas, considere que en esa rama hay-1 árboles con único hijo.
 Por ejemplo, con un árbol como se muestra en la siguiente imagen:
 Si num = 7 devuelve true ya que en su rama izquierda
 hay 1 árbol con un único hijo (el árbol con raíz 23) y en
 la rama derecha hay 0. (1 > 0) → true
 Si num = 2 devuelve false, ya que en su rama izquierda
 hay 1 árbol con único hijo (árbol con raíz 23) y en la
 rama derecha hay 3 (árboles con raíces-5, 19 y 4). (1 >
 3) → false)
 Si num =-5 devuelve true, ya que en su rama izquierda
 hay 2 árboles con único hijo (árboles con raíces 19 y 4) y
 al no tener rama derecha, tiene-1 árboles con un único
 hijo. (2 >-1) → true
 Si num = 19 debería devolver false, ya que al no tener
 rama izquierda tiene-1 árboles con un único hijo y en su
 rama derecha hay 1 árbol con único hijo. (-1 > 1) → false
 Si num =-3 debería devolver false, ya que al no tener
 rama izquierda tiene-1 árboles con un único hijo y lo
 mismo sucede con su rama derecha. (-1 >-1 ) → false
 */
package tp2ejercicio7;

public class TP2Ejercicio7 {


    public static void main(String[] args) {
        BinaryTree<Integer> ab = new BinaryTree<>(2);
        ab.addLeftChild(new BinaryTree<>(7));
        ab.addRightChild(new BinaryTree<>(-5));
        ab.getLeftChild().addLeftChild(new BinaryTree<>(23));
        ab.getLeftChild().addRightChild(new BinaryTree<>(6));
        ab.getLeftChild().getLeftChild().addLeftChild(new BinaryTree<>(-3));
        ab.getLeftChild().getRightChild().addLeftChild(new BinaryTree<>(55));
        ab.getLeftChild().getRightChild().addRightChild(new BinaryTree<>(11));
        ab.getRightChild().addLeftChild(new BinaryTree<>(19));
        ab.getRightChild().getLeftChild().addRightChild(new BinaryTree<>(4));
        ab.getRightChild().getLeftChild().getRightChild().addLeftChild(new BinaryTree<>(18));
        
        ParcialArboles parcialArb = new ParcialArboles(ab);
        System.out.println("Num=7 Resultado: " + parcialArb.isLeftTree(7));
        System.out.println("Num=2 Resultado: " + parcialArb.isLeftTree(2));
        System.out.println("Num=-5 Resultado: " + parcialArb.isLeftTree(-5));
        System.out.println("Num=19 Resultado: " + parcialArb.isLeftTree(19));
        System.out.println("Num=-3 Resultado: " + parcialArb.isLeftTree(-3));
    }
    
}

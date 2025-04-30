/*
Ejercicio 8
Escribir en una clase ParcialArboles el método público con la siguiente firma:
public boolean esPrefijo(BinaryTree<Integer> arbol1, BinaryTree<Integer> arbol2)
El método devuelve true si arbol1 es prefijo de arbol2, false en caso contrario.
Se dice que un árbol binario arbol1 es prefijo de otro árbol binario arbol2, cuando arbol1 coincide
con la parte inicial del árbol arbol2 tanto en el contenido de los elementos como en su
estructura. 
 */
package tp2ejercicio8;

public class TP2Ejercicio8 {

    public static void main(String[] args) {
        ParcialArboles p = new ParcialArboles();
        
        BinaryTree<Integer> ab1 = new BinaryTree<>(65);
        ab1.addLeftChild(new BinaryTree<>(37));
        ab1.addRightChild(new BinaryTree<>(81));
        ab1.getLeftChild().addRightChild(new BinaryTree<>(47));
        ab1.getRightChild().addRightChild(new BinaryTree<>(93));
        
        BinaryTree<Integer> ab2 = new BinaryTree<>(65);
        ab2.addLeftChild(new BinaryTree<>(37));
        ab2.addRightChild(new BinaryTree<>(81));
        ab2.getLeftChild().addLeftChild(new BinaryTree<>(22));
        ab2.getLeftChild().addRightChild(new BinaryTree<>(47));
        ab2.getRightChild().addLeftChild(new BinaryTree<>(76));
        ab2.getRightChild().addRightChild(new BinaryTree<>(93));
        
        if(p.esPrefijo(ab1, ab2)){
            System.out.println("Arbol 1 ES prefijo de Arbol 2");
        }else System.out.println("Arbol 1 NO es prefijo de Arbol 2");
        
        BinaryTree<Integer> arbol1 = new BinaryTree<>(65);
        arbol1.addLeftChild(new BinaryTree<>(37));
        arbol1.getLeftChild().addLeftChild(new BinaryTree<>(47));
        arbol1.addRightChild(new BinaryTree<>(81));
        arbol1.getRightChild().addRightChild(new BinaryTree<>(93));

        BinaryTree<Integer> arbol2 = new BinaryTree<>(65);
        arbol2.addLeftChild(new BinaryTree<>(62));
        arbol2.getLeftChild().addLeftChild(new BinaryTree<>(22));
        arbol2.getLeftChild().addRightChild(new BinaryTree<>(47));
        arbol2.getLeftChild().getLeftChild().addLeftChild(new BinaryTree<>(11));
        arbol2.getLeftChild().getLeftChild().addRightChild(new BinaryTree<>(29));
        arbol2.addRightChild(new BinaryTree<>(81));
        arbol2.getRightChild().addRightChild(new BinaryTree<>(93));
        arbol2.getRightChild().getRightChild().addLeftChild(new BinaryTree<>(85));
        arbol2.getRightChild().getRightChild().addRightChild(new BinaryTree<>(94));

        if(p.esPrefijo(arbol1, arbol2)){
            System.out.println("Arbol 1 ES prefijo de Arbol 2");
        }else System.out.println("Arbol 1 NO es prefijo de Arbol 2");
            
    }
    
}

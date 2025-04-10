/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp2ejercicio2;

/**
 *
 * @author DEMIA
 */
public class TP2Ejercicio2 {
    
    public static void main(String[] args) {
        //Creacion y carga del arbol
        BinaryTree<Integer> ab = new BinaryTree<>(4);
        ab.addLeftChild(new BinaryTree<>(2));
        ab.addRightChild(new BinaryTree<>(6));
        ab.getLeftChild().addLeftChild(new BinaryTree<>(1));
        ab.getLeftChild().addRightChild(new BinaryTree<>(3));
        ab.getRightChild().addLeftChild(new BinaryTree<>(5));

        System.out.print("Cantidad de Hojas: ");
        System.out.println(ab.contarHojas());
        System.out.println("");
        System.out.println("---Arbol original---");
        ab.imprimirArbol();
        System.out.println("");
        System.out.println("");
        System.out.println("---Arbol espejo---");
        BinaryTree<Integer> abEspejo = ab.espejo(); //una copia del arbol original modificada
        abEspejo.imprimirArbol();
        System.out.println("");
        System.out.println("");
        System.out.println("---Impresion Arbol por niveles 0 y 2---");
        ab.entreNiveles(0, 2);
   }
    
}

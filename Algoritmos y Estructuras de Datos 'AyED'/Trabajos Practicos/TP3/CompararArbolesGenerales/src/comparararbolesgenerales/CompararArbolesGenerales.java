/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package comparararbolesgenerales;

/**
 *
 * @author DEMIA
 */
public class CompararArbolesGenerales {

    public static void main(String[] args) {
        // Árbol 1
        //      10
        //     / | \
        //    4  8  1
        //   /
        //  6

        GeneralTree<Integer> arbol10 = new GeneralTree<>(10);
        GeneralTree<Integer> arbol4 = new GeneralTree<>(4);
        GeneralTree<Integer> arbol8 = new GeneralTree<>(8);
        GeneralTree<Integer> arbol1 = new GeneralTree<>(1);
        GeneralTree<Integer> arbol6 = new GeneralTree<>(6);

        arbol10.addChild(arbol4);
        arbol10.addChild(arbol8);
        arbol10.addChild(arbol1);

        arbol4.addChild(arbol6);

        // Árbol 2
        //        9
        //       / \
        //      3   5
        //    / | \   \
        // -21 -1 15   7

        GeneralTree<Integer> arbol9 = new GeneralTree<>(9);
        GeneralTree<Integer> arbol3 = new GeneralTree<>(3);
        GeneralTree<Integer> arbol5 = new GeneralTree<>(5);
        GeneralTree<Integer> arbol21N = new GeneralTree<>(-21);
        GeneralTree<Integer> arbol1N = new GeneralTree<>(-1);
        GeneralTree<Integer> arbol15 = new GeneralTree<>(15);
        GeneralTree<Integer> arbol7 = new GeneralTree<>(7);

        arbol9.addChild(arbol3);
        arbol9.addChild(arbol5);

        arbol3.addChild(arbol21N);
        arbol3.addChild(arbol1N);
        arbol3.addChild(arbol15);

        arbol5.addChild(arbol7);
        
        System.out.println("----Arbol 1----");
        arbol10.recorridoPorNiveles();
        System.out.println("\n");
        System.out.println("----Arbol 2----");
        arbol9.recorridoPorNiveles();
        System.out.println("\n");
        
        CompararDosArboles c = new CompararDosArboles();
        System.out.println("Arbol 1 es sustituto de Arbol 2? :" + c.esSustituto(arbol10,arbol9));
        
        
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package primercaminosumaminima;

/**
 *
 * @author DEMIA
 */
public class PrimerCaminoSumaMinima {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneralTree<Integer> arbolA = new GeneralTree<>(4);
        GeneralTree<Integer> arbolB = new GeneralTree<>(2);
        GeneralTree<Integer> arbolC = new GeneralTree<>(8);
        GeneralTree<Integer> arbolD = new GeneralTree<>(-7);
        GeneralTree<Integer> arbolE = new GeneralTree<>(6);
        GeneralTree<Integer> arbolF = new GeneralTree<>(3);
        GeneralTree<Integer> arbolG = new GeneralTree<>(9);
        GeneralTree<Integer> arbolH = new GeneralTree<>(5);

        
        arbolA.addChild(arbolB);
        arbolA.addChild(arbolC);
        arbolA.addChild(arbolD);
        
        arbolB.addChild(arbolE);
        arbolB.addChild(arbolF);
        arbolB.addChild(arbolG);
        
        arbolD.addChild(arbolH);

        arbolA.recorridoPorNiveles();
        System.out.println("\n");
        
        CaminoSumaMinima c = new CaminoSumaMinima();
        System.out.println("Primer Camino Suma Minima");
        System.out.println(c.buscarCaminoSumaMinima(arbolA));
    }
    
}

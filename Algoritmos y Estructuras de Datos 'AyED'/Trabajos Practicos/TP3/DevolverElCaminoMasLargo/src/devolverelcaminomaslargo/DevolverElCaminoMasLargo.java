/* Devolver el camino más largo donde todos los valores estén en el rango [min, max] */
package devolverelcaminomaslargo;

public class DevolverElCaminoMasLargo {

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
        
        arbolF.addChild(arbolH);

        arbolA.recorridoPorNiveles();
        System.out.println("\n");
        
        CaminoMasLargo c = new CaminoMasLargo();
        int min = 1;
        int max = 6;
        System.out.println("Camino mas largo del arbol c/nodos entre los valores "+min+".."+max+":");
        System.out.println(c.camMasLargoDentroRango(arbolA, min, max));
        
    }
    
}

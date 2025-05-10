/* Devolver el camino más corto donde todos los valores estén en el rango [min, max] */
package devolverelcaminomascorto;

public class DevolverElCaminoMasCorto {

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
        
        arbolE.addChild(arbolH);

        arbolA.recorridoPorNiveles();
        System.out.println("\n");
        
        CaminoMasCorto c = new CaminoMasCorto();
        int min = 1;
        int max = 7;
        System.out.println("Camino mas corto del arbol c/nodos entre los valores "+min+".."+max+":");
        System.out.println(c.camMasCortoDentroRango(arbolA, min, max));
        
    }
    
}


package primercaminonegag;

public class PrimerCaminoNegAG {

    public static void main(String[] args) {
        GeneralTree<Integer> arbolA = new GeneralTree<>(-4);
        GeneralTree<Integer> arbolB = new GeneralTree<>(-2);
        GeneralTree<Integer> arbolC = new GeneralTree<>(8);
        GeneralTree<Integer> arbolD = new GeneralTree<>(-7);
        GeneralTree<Integer> arbolE = new GeneralTree<>(6);
        GeneralTree<Integer> arbolF = new GeneralTree<>(3);
        GeneralTree<Integer> arbolG = new GeneralTree<>(9);
        GeneralTree<Integer> arbolH = new GeneralTree<>(-5);

        
        arbolA.addChild(arbolB);
        arbolA.addChild(arbolC);
        arbolA.addChild(arbolD);
        
        arbolB.addChild(arbolE);
        arbolB.addChild(arbolF);
        arbolB.addChild(arbolG);
        
        arbolD.addChild(arbolH);

        arbolA.recorridoPorNiveles();
        System.out.println("\n");
        CaminosArboles c = new CaminosArboles();
        
        System.out.println("--1er camino desde la raiz a una hoja con todos val Neg PREORDER--");
        System.out.println(c.primerCaminoTodosNegativosPre(arbolA));
        
        System.out.println("--1er camino desde la raiz a una hoja con todos val Neg POSTORDER--");        
        System.out.println(c.primerCaminoTodosNegativosPost(arbolA));
        
    }
    
}

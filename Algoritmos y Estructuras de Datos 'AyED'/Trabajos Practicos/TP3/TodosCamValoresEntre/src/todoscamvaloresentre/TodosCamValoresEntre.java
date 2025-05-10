/* Devolver todos los caminos desde la raiz hasta las hojas en que todos los valores de los nodos esten entre min y max inculisve */

package todoscamvaloresentre;

public class TodosCamValoresEntre {

    public static void main(String[] args) {
        GeneralTree<Integer> arbolA = new GeneralTree<>(4);
        GeneralTree<Integer> arbolB = new GeneralTree<>(2);
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
        
        int min = 1;
        int max = 8;
        System.out.println("Caminos c/nodos entre los valores "+min+".."+max+":");
        System.out.println(c.todosLosCaminosConValoresEntre(arbolA,min,max).toString());
    }
    
}

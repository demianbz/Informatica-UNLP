/*
 Ejercicio 3
 Implemente en la clase GeneralTree los siguientes métodos
 a) public int altura(): int devuelve la altura del árbol, es decir, la longitud del camino más largo
 desde el nodo raíz hasta una hoja.
 b) public int nivel(T dato) devuelve la profundidad o nivel del dato en el árbol. El nivel de un nodo
 es la longitud del único camino de la raíz al nodo.
 c) public int ancho(): int la amplitud (ancho) de un árbol se define como la cantidad de nodos que
 se encuentran en el nivel que posee la mayor cantidad de nodos.    
 */
package tp3ejercicio3;

public class TP3Ejercicio3 {

    public static void main(String[] args) {
            GeneralTree<Integer> arbolA = new GeneralTree<>(4);
        GeneralTree<Integer> arbolB = new GeneralTree<>(2);
        GeneralTree<Integer> arbolC = new GeneralTree<>(8);
        GeneralTree<Integer> arbolD = new GeneralTree<>(7);
        GeneralTree<Integer> arbolE = new GeneralTree<>(6);
        GeneralTree<Integer> arbolF = new GeneralTree<>(3);
        GeneralTree<Integer> arbolG = new GeneralTree<>(-9);
        GeneralTree<Integer> arbolH = new GeneralTree<>(5);
        GeneralTree<Integer> arbolI = new GeneralTree<>(10);
        
        arbolA.addChild(arbolB);
        arbolA.addChild(arbolC);
        arbolA.addChild(arbolD);
        
        arbolB.addChild(arbolE);
        arbolB.addChild(arbolF);
        arbolB.addChild(arbolG);
        
        arbolD.addChild(arbolH);
        
        arbolH.addChild(arbolI);
        
        arbolA.recorridoPorNiveles();
        System.out.println("\n");
        
        System.out.println("------Altura del Arbol------");
        System.out.println(arbolA.altura());
        
        System.out.println("---Nivel del dato Pasado como parametro---");
        System.out.println(arbolA.nivel(5));
        
    }
    
}

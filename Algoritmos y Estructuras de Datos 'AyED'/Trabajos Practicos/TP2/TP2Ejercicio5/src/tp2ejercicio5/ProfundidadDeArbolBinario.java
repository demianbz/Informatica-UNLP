package tp2ejercicio5;

public class ProfundidadDeArbolBinario {
    private BinaryTree<Integer> ab;

    
    public ProfundidadDeArbolBinario(BinaryTree<Integer> unArbol){
        ab = unArbol;
    }
    
    public int sumaElementosProfundidad(int p){
        if(!ab.isEmpty())
            return MetodoSumaElementosProfundidad(ab,p);
            //return MetodoSumaElementosProfundidad(ab,p,0);
        else
            return 0;
    }
    
    public int MetodoSumaElementosProfundidad (BinaryTree<Integer> ab , int p){//devuelve la suma de todos los nodos del árbol que se encuentren a la profundidad pasada como argumento.
         Queue<BinaryTree<Integer>> cola = new Queue<>();
         BinaryTree<Integer> aux;
         boolean encontre = false;
         int sumaProfundidad = 0;
         int nivelAct = 0;  //contador para los niveles
         
         cola.enqueue(ab);  //encolo la raiz
         while(!cola.isEmpty() && !encontre ){    //mientras la cola no se vacie
             int cantNivel = cola.size();   //tamaño de la cola
             if(p == nivelAct){   
                 for(int i= 0 ; i<cantNivel ;i++){
                     aux = cola.dequeue();    //desencolo el nodo act
                     sumaProfundidad += aux.getData();   //sumo el nodo porque estoy en en nivel que quiero
                 }
                 encontre = true;
             }else{     //no estoy en el nivel pero tengo que procesar lo siguiente
                 for(int i=0 ; i<cantNivel ; i++){
                     aux = cola.dequeue();
                     if(aux.hasLeftChild())
                         cola.enqueue(aux.getLeftChild());  //si tiene hijo izq encolo hijo izq
                     if(aux.hasRightChild())
                         cola.enqueue(aux.getRightChild());     //si tiene hijo der encolo hijo der
                 }
             }
             nivelAct++;
         }
         return sumaProfundidad;
    }
    
    /*public int MetodoSumaElementosProfundidad (BinaryTree<Integer> ab , int p , int nivelAct){//devuelve la suma de todos los nodos del árbol que se encuentren a la profundidad pasada como argumento.
        if(p == nivelAct){
            return ab.getData();
        } else {
            int suma = 0;
            if(ab.hasLeftChild()) suma+= MetodoSumaElementosProfundidad(ab.getLeftChild(),p, nivelAct+1);
            if(ab.hasRightChild()) suma+= MetodoSumaElementosProfundidad(ab.getRightChild(),p, nivelAct+1);
            return suma;
        }
    }*/

}
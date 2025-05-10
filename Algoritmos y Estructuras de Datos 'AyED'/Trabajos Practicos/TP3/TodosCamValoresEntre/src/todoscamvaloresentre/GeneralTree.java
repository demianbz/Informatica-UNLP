package todoscamvaloresentre;

import java.util.List;
import java.util.LinkedList;

public class GeneralTree <T>{
    private T data;
    private List<GeneralTree<T>> children = new LinkedList<GeneralTree<T>>();
    
    
    public GeneralTree(){
        
    }
    
    public GeneralTree(T data){//inicializa un árbol que tiene como raíz un nodo y este nodo tiene
                               // el dato pasado como parámetro y una lista vacía.
        this.data = data;
    }
    
    public GeneralTree(T data , List<GeneralTree<T>> children){ // inicializa un árbol que tiene como raíz a un nodo y este nodo tiene
                                                                //el dato pasado como parámetro y como hijos children.
        this(data);
        this.children = children;
    }
    
    public T getData(){ // retorna el dato almacenado en la raíz del árbol.
        return data;
    }
    
    public void setData(T data){
        this.data = data;
    }
    
    public List<GeneralTree <T>> getChildren(){ //retorna la lista de hijos de la raíz del árbol
        return this.children;
    }
    
    public void setChildren(List<GeneralTree<T>> children) {
        if (children != null)
            this.children = children;
    }
    
    public void addChild(GeneralTree <T> child){    // agrega un hijo al final de la lista de hijos del árbol
        this.getChildren().add(child);
    }    
    
    public boolean hasChildren(){   // devuelve verdadero si la lista de hijos del árbol no es null y tampoco es vacía
        return !this.children.isEmpty();
    }
    
    public boolean isLeaf(){
        return !this.hasChildren();
    }
    
    public boolean isEmpty(){       //devuelve verdadero si el dato del árbol es null y además no tiene hijos
        return this.data == null && !this.hasChildren();
    }
        
    public void removeChild(GeneralTree <T> child){     //elimina del árbol el hijo pasado como parámetro.
        if(this.hasChildren())
            children.remove(child);
    }
    
    
    public void recorridoPorNiveles(){
        Queue<GeneralTree<T>> cola = new Queue<>();
        if(!this.isEmpty()){
            
            cola.enqueue(this);
            cola.enqueue(null);
        
        while(!cola.isEmpty()){
            GeneralTree<T> a = cola.dequeue();
            
            if(a != null){
                System.out.print(a.getData()+" ");
                List<GeneralTree<T>> hijos = a.getChildren();
                for(GeneralTree<T> h:hijos)
                    cola.enqueue(h);
            }
            else
                if(!cola.isEmpty()){
                    cola.enqueue(null);
                    System.out.println(); //cambio de nivel
                }
        }
        
        }
    }
    
    
    public int altura() { //devuelve la altura del árbol, es decir, la longitud del camino más largo  desde el nodo raíz hasta una hoja.
        if(!this.isEmpty())
            return metodoAltura();
        else
            return 0;
    }
    /*la altura de un arbol es la altura del nodo raiz*/
    public int metodoAltura(){
        if(this.isLeaf())
            return 0;
        int alturaMax = -1;
        for(GeneralTree<T> hijos: this.getChildren()){
            if(hijos.metodoAltura()>alturaMax)
                alturaMax = hijos.metodoAltura();
        }
        return alturaMax+1;
    }
    
    public int nivel(T dato){ //devuelve la profundidad o nivel del dato en el árbol. El nivel de un nodo es la longitud del único camino de la raíz al nodo.
        if(!this.isEmpty())
            return metodoNivel(dato);
        else
            return -1;
    }
    
    public int metodoNivel(T dato){
        int nivel = 0;
        int nivelAct = 0;
        boolean encontre = false;
        Queue<GeneralTree<T>> cola = new Queue<>();
        cola.enqueue(this);
        while(!cola.isEmpty() && !encontre){
            int cantNivel = cola.size();
            for(int i=0 ; i<cantNivel ; i++){
                GeneralTree<T> aux = cola.dequeue();
                if(aux.getData().equals(dato)){
                    nivel = nivelAct;
                    encontre = true;
            }
            
            for(GeneralTree<T> hijos: aux.getChildren())
                cola.enqueue(hijos);
            }
            nivelAct++;
        }
        return nivel;
    }
    
    public int ancho(){ //la amplitud (ancho) de un árbol se define como la cantidad de nodos que se encuentran en el nivel que posee la mayor cantidad de nodos.
        return 0;
    }
    
}

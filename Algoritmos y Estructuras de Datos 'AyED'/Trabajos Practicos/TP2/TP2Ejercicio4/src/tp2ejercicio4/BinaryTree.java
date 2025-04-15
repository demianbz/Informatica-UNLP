package tp2ejercicio4;


public class BinaryTree <T> {	
    private T data;
    private BinaryTree<T> leftChild;   
    private BinaryTree<T> rightChild; 

	
    public BinaryTree() {
	super();
    }

    
    public BinaryTree(T data) { //inicializa un árbol con el dato pasado como parámetro y ambos hijos nulos
        this.data = data;
    }

    
    public T getData() {    //getter de data
        return data;
    }

    
    public void setData(T data) {   //setter de data
	this.data = data;
    }
    
   
    /**
     * Preguntar antes de invocar si hasLeftChild()
     * @return
     */
    public BinaryTree<T> getLeftChild() {   //retorna un hijo izquierdo, si no tiene hijo tira error
	return leftChild;
    }
    
    
    /**
     * Preguntar antes de invocar si hasRightChild()
     * @return
    */
    public BinaryTree<T> getRightChild() {  //retorna un hijo derecho, si no tiene hijo tira error
	return this.rightChild;
    }

   
    public void addLeftChild(BinaryTree<T> child) {     //agrega un hijo izquierdo
        this.leftChild = child;
    }

   
    public void addRightChild(BinaryTree<T> child) {    //agrega un hijo derecho
        this.rightChild = child;
    }

   
    public void removeLeftChild() { //elimina hijo izquierdo
	this.leftChild = null;
    }

   
    public void removeRightChild() {    //elimina hijo derecho
	this.rightChild = null;
    }

   
    public boolean isEmpty(){   //indica si el arbol esta vacio
	return (this.isLeaf() && this.getData() == null);
    }

   
    public boolean isLeaf() {   //indica si el arbol no tiene hijos.
	return (!this.hasLeftChild() && !this.hasRightChild());
    }
		
   
    public boolean hasLeftChild() {     //devuelve si tiene hijo izquierdo
        return this.leftChild!=null;
    }

    
    public boolean hasRightChild() {    //devuelve si tiene hijo derecho
	return this.rightChild!=null;
    }
	
    
    @Override
    public String toString() {
        return this.getData().toString();
    }
    
    public void imprimirArbol() {
        if(this.hasLeftChild()) 
            this.getLeftChild().imprimirArbol();
        System.out.print(this.getData() + " ");
        if(this.hasRightChild()) 
            this.getRightChild().imprimirArbol();
    }
    
        
    public  int contarHojas() { //contarHojas():int Devuelve la cantidad de árbol/subárbol hojas del árbol receptor
        int leftC = 0; int rightC = 0;
        if(this.isEmpty())
            return 0;
        else if(this.isLeaf())
            return 1;
        else {
            if(this.hasLeftChild())
                leftC = this.getLeftChild().contarHojas();
            if(this.hasRightChild())
                rightC = this.getRightChild().contarHojas();
        }
            
        return leftC + rightC;
    }
		
    
    public BinaryTree<T> espejo(){  //espejo(): BinaryTree<T> Devuelve el árbol binario espejo del árbol receptor. (cambio los hijos hizquierdos por derechos y viceversa)		       		  
        BinaryTree<T> arbEspejo = new BinaryTree<>(this.getData());
        if(this.hasLeftChild()){
            arbEspejo.addRightChild(this.getLeftChild().espejo());
        }
        if(this.hasRightChild()){
            arbEspejo.addLeftChild(this.getRightChild().espejo());
        }
        return arbEspejo;
    }

    /*// 0<=n<=m
    //entreNiveles(int n, m) Imprime el recorrido por niveles de los elementos del árbol
    //receptor entre los niveles n y m (ambos inclusive). (0≤n<m≤altura del árbol)
    public void entreNiveles(int n, int m){                                         
        BinaryTree<T> ab;
        if(this.isEmpty())
            return ;
        Queue<BinaryTree<T>> cola = new Queue<>();
        cola.enqueue(this);
        int nivelAct = 0;
        
        while (!cola.isEmpty()) {   //mientras la cola no se vacie
            int cantNivel = cola.size();
            if (nivelAct >=n && nivelAct <=m) {
                for(int i=0; i < cantNivel; i++) {
                    ab = cola.dequeue();    //desencolo ab
                    System.out.print(ab.getData() + " | "); //imprimo dato de ab
                    if(ab.hasLeftChild())   
                        cola.enqueue(ab.getLeftChild());    //encolo hijo izquierdo
                    if(ab.hasRightChild()) 
                        cola.enqueue(ab.getRightChild());   //encolo hijo derecha
                }
            } else{
                for(int i=0 ; i<cantNivel ; i++)
                    cola.enqueue(null);             //encolo null
            }
            nivelAct++;
            System.out.println("");
        }
    }*/
    
}
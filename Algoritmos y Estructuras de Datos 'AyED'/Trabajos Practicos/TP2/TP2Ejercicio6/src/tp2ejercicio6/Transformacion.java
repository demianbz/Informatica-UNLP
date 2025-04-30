
package tp2ejercicio6;


public class Transformacion {
    private BinaryTree<Integer> ab;


    public Transformacion (BinaryTree<Integer> unArbol){
        ab = unArbol;
    }
    
    public BinaryTree<Integer> suma (){
        if(!ab.isEmpty())
            metodoSuma(ab);
        return ab;
    }
    
    public int metodoSuma(BinaryTree<Integer> ab){
        int sumIzq = 0; int sumDer = 0;
        
       
       if(ab.isLeaf()){ //si es hoja
           int hoja = ab.getData();
           ab.setData(0);
           return  hoja;
       }
       
        if(ab.hasLeftChild())
            sumIzq += metodoSuma(ab.getLeftChild());           
        if(ab.hasRightChild())
            sumDer += metodoSuma(ab.getRightChild());
        
        int sum = sumDer + sumIzq;
        int aux = ab.getData();
        ab.setData(sum);
        return aux + sum;   //retorno el valor del nodo original + la suma
    }
    
    
    public void imprimirArbol() {
        if(this.ab.hasLeftChild()) 
            this.ab.getLeftChild().imprimirArbol();
        System.out.print(this.ab.getData() + " ");
        if(this.ab.hasRightChild()) 
            this.ab.getRightChild().imprimirArbol();
    }

}


package tp2ejercicio8;


public class ParcialArboles {
    
    
     public boolean esPrefijo(BinaryTree<Integer> arbol1, BinaryTree<Integer> arbol2){
         boolean aux;
         
         if(arbol1.getData().equals(arbol2.getData())){
             aux = true;
         }else aux = false;
         
         if(aux){
             
             if(arbol1.hasLeftChild()){
                 if(arbol2.hasLeftChild()){
                    aux = esPrefijo(arbol1.getLeftChild(),arbol2.getLeftChild());
                }else aux = false;
             }
             
             if(aux){
             if(arbol1.hasRightChild()){
                 if(arbol2.hasRightChild()){
                    aux = esPrefijo(arbol1.getRightChild(),arbol2.getRightChild());
             }else aux = false;
             }
             }
         }
         return aux;
     }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp2ejercicio7;

/**
 *
 * @author DEMIA
 */
public class ParcialArboles {
    
    private BinaryTree<Integer> ab;
    
    
    public ParcialArboles (BinaryTree<Integer> unAb){
        ab = unAb;
    }
    
    public BinaryTree<Integer> esNum(BinaryTree<Integer> unAb , int num){
        if(unAb.getData() == num){
            return unAb;
        }
        
        BinaryTree<Integer> aux = null;
        
        if(unAb.hasLeftChild())
            aux = esNum(unAb.getLeftChild(),num);
        if(aux == null && unAb.hasRightChild())     //si mi aux es igual a null osea no entontre en izquierda, busco en derecha
            aux = esNum(unAb.getRightChild(),num);
            
        return aux;
    }
    
    public int contarCant(BinaryTree<Integer> arb){
        if(arb == null)
            return 0;
        if(((arb.hasLeftChild() && !arb.hasRightChild()) || (arb.hasRightChild() && !arb.hasLeftChild())))
            return 1 + contarCant(arb.getLeftChild()) + contarCant(arb.getRightChild());
        return 0 + contarCant(arb.getLeftChild()) + contarCant(arb.getRightChild());
    }
    
    public boolean isLeftTree (int num){
    /*devuelve true si el subárbol cuya raíz es “num”, tiene en su subárbol izquierdo una cantidad 
    mayor estricta de árboles con un único hijo que en su subárbol derecho. Y false en caso contrario.*/  
    BinaryTree<Integer> raizNum = esNum(ab,num);
    if(raizNum == null){
        return false;
    }
    else{
        int cantIzq = -1 ; int cantDer = -1;
        
        if(raizNum.hasLeftChild())
            cantIzq  = contarCant(raizNum.getLeftChild());
        if(raizNum.hasRightChild())
            cantDer = contarCant(raizNum.getRightChild());
        return cantIzq>cantDer;
    }

}
    
}

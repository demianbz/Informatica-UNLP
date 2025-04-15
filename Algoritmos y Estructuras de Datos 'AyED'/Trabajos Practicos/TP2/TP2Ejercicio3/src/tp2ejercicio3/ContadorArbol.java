package tp2ejercicio3;

import java.util.ArrayList;

public class ContadorArbol {
    BinaryTree<Integer> ab;
    
    public ContadorArbol(BinaryTree<Integer> unAB){
        ab = unAB;
    }
    
    public ArrayList<Integer> numerosParesInOrden(){
        ArrayList<Integer> listInt = new ArrayList<>();
        if(!ab.isEmpty())   //si el arbol no esta vacio
            this.RecorridoInOrden(listInt, this.ab);
        return listInt;
    }
    
    public void RecorridoInOrden(ArrayList<Integer> listInt , BinaryTree<Integer> ab){
        if(this.ab.hasLeftChild()){
            RecorridoInOrden(listInt,ab.getLeftChild());
        }
        if((ab.getData() % 2) == 0){
            listInt.add(ab.getData());
        }
        if(this.ab.hasRightChild()){
            RecorridoInOrden(listInt,ab.getRightChild());
        }
    }
    
    public ArrayList<Integer> numerosParesPostOrden(){
        ArrayList<Integer> listInt = new ArrayList<>();
        if(!ab.isEmpty())   //si el arbol no esta vacio
            this.RecorridoPostOrden(listInt, this.ab);
        return listInt;
    }
    
    public void RecorridoPostOrden(ArrayList<Integer> listInt , BinaryTree<Integer> ab){
        if(this.ab.hasLeftChild())
            RecorridoPostOrden(listInt,ab.getLeftChild());
        
        if(this.ab.hasRightChild())
            RecorridoPostOrden(listInt,ab.getRightChild());
        
        if((this.ab.getData() % 2) == 0)
            listInt.add(this.ab.getData());
    }
    
}

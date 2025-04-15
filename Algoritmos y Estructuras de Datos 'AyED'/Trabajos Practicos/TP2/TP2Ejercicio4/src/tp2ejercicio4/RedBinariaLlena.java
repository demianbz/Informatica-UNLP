package tp2ejercicio4;

public class RedBinariaLlena {
    private BinaryTree<Integer> ab;
    
    public RedBinariaLlena (BinaryTree<Integer> unArbol){
        ab = unArbol;
    }
    
    public int retardoReenvio(){
        if(!ab.isEmpty()){
            return metodoRetardoReenvio(ab);
        }
        else
            return 0;
    }
    
    public int metodoRetardoReenvio(BinaryTree<Integer> ab){
        int RetardoHI = 0;
        int RetardoHD = 0;
        int max = 0;
        if(ab.hasLeftChild()){
            RetardoHI = metodoRetardoReenvio(ab.getLeftChild());
        }
        if(ab.hasRightChild()){
            RetardoHD = metodoRetardoReenvio(ab.getRightChild());
        }
        if(RetardoHI>RetardoHD){
            max = RetardoHI;
        }
        else
            max = RetardoHD;
        return max + ab.getData();
    }
    
}

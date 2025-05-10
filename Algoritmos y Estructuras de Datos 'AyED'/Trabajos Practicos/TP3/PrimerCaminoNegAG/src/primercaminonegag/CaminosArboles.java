package primercaminonegag;

import java.util.List;
import java.util.LinkedList;
import java.util.Iterator;

public class CaminosArboles {
    
    public List<Integer> primerCaminoTodosNegativosPre(GeneralTree<Integer> arbol){
        List<Integer> lista = new LinkedList<>();
        if(arbol != null && !arbol.isEmpty())
            metodoCaminoNegPre(arbol,lista);
        return lista;
    }
    
    private boolean metodoCaminoNegPre (GeneralTree<Integer> ab , List<Integer> l){
        boolean encontre = false;
        if(ab.getData() < 0){ //si es negativo
            l.add(ab.getData());
            if(ab.isLeaf())    //si es hoja y a su vez negativo, significa que complete el camino
                encontre=true;
            else{
                List<GeneralTree<Integer>> hijos = ab.getChildren();
                Iterator<GeneralTree<Integer>> iterador = hijos.iterator(); //uso un iterador para iterar sobre la lista de hijos, se puede usar un for tmbn pero en este caso es mas complicado
                while(!encontre && iterador.hasNext()){
                    encontre = metodoCaminoNegPre(iterador.next(),l);
                }
                
                if(!encontre)//puedo salir del while porque encontre o porque llegue al final
                    l.remove(l.size()-1);//si no encontre elimino el ultimo elemnto
            }
        }
        return encontre;
    }
    
    public List<Integer> primerCaminoTodosNegativosPost(GeneralTree<Integer> arbol){
        List<Integer> lista = new LinkedList<>();
        if(arbol != null && !arbol.isEmpty() && arbol.getData() < 0)
            metodoCaminoNegPost(arbol,lista);
        return lista;
    }
    
    private boolean metodoCaminoNegPost(GeneralTree<Integer> ab , List<Integer> l){
        boolean encontre = false;
        if(ab.isLeaf()){ //si es hoja ya se que es negativo, agrego al camino y devuelvo true
            encontre = true;
            l.add(0,ab.getData());
        }
        else{   //sino recorro los hijos
            List<GeneralTree<Integer>> hijos = ab.getChildren();
            Iterator<GeneralTree<Integer>> iterador = hijos.iterator();
            while( !encontre && iterador.hasNext()){
                GeneralTree<Integer> hijo = iterador.next();    //tengo que guardarme si o si el next en la variable auxiliar hijo porque si no llamo al next dos veces y eso hace que saltee hijos
                if(hijo.getData() < 0)
                    encontre = metodoCaminoNegPost(hijo,l);
            }
        
        if(encontre)
            l.add(0,ab.getData());
        }
        return encontre;
    }
    
}

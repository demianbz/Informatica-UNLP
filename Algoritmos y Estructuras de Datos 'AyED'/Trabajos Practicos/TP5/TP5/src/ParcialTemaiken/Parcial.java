/*public ??? resolver(Graph<???> sitios, int tiempo)
Una familia se encuentra planificando su visita al Bioparque Temaikèn en las vacaciones de invierno. 
Quieren visitar la máxima cantidad de recintos posibles dentro del tiempo que disponen.
Se tiene que saber la cantidad máxima de recintos que se puede visitar en un tiempo determinado 
partiendo desde la “Entrada”.Cada vértice contiene el nombre del sitio (o recinto de animal) y el tiempo 
que se tarda en recorrerlo, y en las aristas se cuenta con el tiempo que toma ir de un sitio a otro.
Por ejemplo para este grafo, si el tiempo disponible es 100 minutos, el método debería devolver 5, 
ya que con un total de 98 minutos se pueden recorrer los siguientes sitios:
15' (Entrada) + 15' (Tigres) + 8' + 10' (Cebras) + 5' + 10' (Tortugas) + 15' + 10' (Pumas) = 98'
Si el tiempo inicial fuera 30 minutos solo podría recorrer la “Entrada”. Debería devolver 1 vértice*/

package ParcialTemaiken;

import Grafos.*;
import java.util.*;

//Respeto el nombre de la clase que pide el enunciado
public class Parcial {

	//Respeto la firma que pide el enunciado completando los tipos
	public int resolver(Graph<Recinto> sitios, int tiempo){
		
		//Busco la entrada usando un iterator sobre la lista de vertices
		List<Vertex<Recinto>> lista = sitios.getVertices();
		Iterator<Vertex<Recinto>> iterador = lista.iterator();
		Vertex<Recinto> aux , entrada = null;
		
		while(iterador.hasNext() && entrada == null) {
			aux = iterador.next();
			if(aux.getData().getNombre().equals("entrada")) {
				entrada = aux;
			}
		}
		
		int resultado = 0;
		if(entrada != null ) {
			//Creo un array para hacer marcas y evitar loops infinitos
			boolean[] marcas = new boolean[lista.size()];
			//Llamo a otro metodo que resuelve el problema
			//Agrego a los parametros, el vertice  de partida y las marcas
			resultado = resolverRec(sitios,entrada,tiempo,marcas);
		}
		return resultado;
	}
	
	
	private int resolverRec(Graph<Recinto> grafo , Vertex<Recinto> entrada , int tiempo , boolean [] marcas) {
		int retorno;
		//Marco el vertice actual
		marcas[entrada.getPosition()] = true;
		
		//Caso base no dispongo de tiempo para avanzar no hago nada
		if(tiempo < entrada.getData().getTiempo())
			retorno = 0;
		
		else {
			//Dispongo de tiempo, visito el sitio actual y consumo el tiempo
			tiempo = tiempo - entrada.getData().getTiempo();
			
			List<Edge<Recinto>> vecinos = grafo.getEdges(entrada); //hago la lista de Adyacentes(Vecinos)
			
			int lugares = 0 , maxLugares = 0;
			for(Edge<Recinto> edge: vecinos) {
				Vertex<Recinto> vecino = edge.getTarget(); //me guardo uno de los vecinos
				int tiempoCaminoVecino = edge.getWeight(); //me guardo el peso de ese vecino
				int tiempoVecino = vecino.getData().getTiempo(); //me guardo el tiempo que tarda ese vecino
			
			
				//Tomo solo los caminos que me alcanza el tiempo y que no pase previamente
				if((tiempoCaminoVecino < tiempo) && (!marcas[vecino.getPosition()])) {
					//Llamo recursivamente para resolver el mismo problema, pero mas chico(menos tiempo y mas marcas)
					lugares = resolverRec(grafo,vecino,tiempo - tiempoCaminoVecino,marcas);
					if(lugares > maxLugares)
						maxLugares = lugares;
				}
			}
			retorno = maxLugares + 1; //MaxLugares + el ultimo vertice en el que quede(osea en el que estoy parado)
		}
		
		//Desmarco el vertice actual
		marcas[entrada.getPosition()] = false;	//BackTracking
		
		return retorno;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}

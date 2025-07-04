/*Implemente la clase Parcial, y el método:
	
	public ??? resolver(Graph<???> sitios, int tiempo)

Una familia se encuentra planificando su visita al Bioparque Temaiken en las vacaciones de invierno. 
Quieren visitar la máxima cantidad de recintos posibles dentro del tiempo que disponen. Se quiere saber 
la cantidad máxima de recintos que se puede visitar en un tiempo determinado partiendo desde la “Entrada”.
Cada vértice contiene el nombre del sitio (o recinto de animal) y el tiempo que se tarda en recorrerlo,
y en las aristas se cuenta con el tiempo que toma ir de un sitio a otro.
Por ejemplo, para este grafo, si el tiempo disponible es 100 minutos, el método debería devolver 5, ya 
que con un total de 98 minutos se pueden recorrer los siguientes sitios:
15’ (Entrada)
15’ + 10’ (Tigres)
8’ + 10’ (Cebras)
5’ + 10’ (Tortugas)
15’ + 10’ (Pumas)
= 98’
Si el tiempo inicial fuera 30 minutos, solo podría recorrer la “Entrada”. Debería devolver 1 vértice.*/
import java.util.Iterator;
import java.util.List;

import Grafos.Graph;
import Grafos.Vertex;
import Grafos.Edge;
import adjList.AdjListGraph;

//Respeto el nombre de la clase que pide el enunciado 
public class Parcial {

	//Respeto la firma que pide el enunciado, completando los tipos que faltan
	public int resolver(Graph<Recinto> sitios, int tiempo){
		int retorno = 0;
		
		//Busco la entrada usando un iterador en la lista de vertices
		List<Vertex<Recinto>> listaVertices = sitios.getVertices();
		Iterator<Vertex<Recinto>> iterador = listaVertices.iterator();
		Vertex<Recinto>	aux,entrada = null;
		
		while(iterador.hasNext() && entrada ==null) {
			aux = iterador.next();
			if(aux.getData().getNombre().equals("entrada")) {
				entrada = aux;
			}
		}
		
		//Si encontre la entrada, ejecuto el metodo recursivo
		if(entrada != null) {
			//Creo el array de marcas para evitar loops infinitos de posibles ciclos
			boolean [] marcas = new boolean[listaVertices.size()];
			//Llamo al metodo recursivo que resuelve el problema, agregandole los parametros necesarios
			retorno = resolverRecursivo(sitios,entrada,tiempo,marcas);
		}
		
		return retorno;
	}
	
	
	private int resolverRecursivo(Graph<Recinto> sitios , Vertex<Recinto> entrada , int tiempo , boolean [] marcas) {
		int retorno;
		//Lo primero que hago es marcar el vertice actual como visitado
		marcas[entrada.getPosition()] = true;
		
		//Pregunto si me alcanza el tiempo para recorrer el sitio actual
		if(tiempo < entrada.getData().getTiempo()) {	//Si no dispongo de tiempo
			//Caso base, no dispongo de tiempo para avanzar, no puedo recorrer nada
			retorno = 0;
		} 
		else {	//Si dispongo de tiempo
			//Visito el sitio actual y consumo el tiempo
			tiempo = tiempo - entrada.getData().getTiempo();
			
			List<Edge<Recinto>> vecinos = sitios.getEdges(entrada);	//Genero la lista de aristas
			
			int lugares = 0, maxLugares = 0;
			for(Edge<Recinto> edge : vecinos) {	//For para iterar sobre los vecinos
				Vertex<Recinto> vecino = edge.getTarget();	//Tomo el primero y le pido el destino
				int tiempoCaminoVecino = edge.getWeight();	//Le pido el tiempo que tarda
				int tiempoVecino = vecino.getData().getTiempo();	//Le pido el tiempo que toma el vecino
			
				//Tomo solo los caminos que me alcanza el tiempo y que no pase previamente
				if((tiempoCaminoVecino + tiempoVecino <= tiempo) && (!marcas[vecino.getPosition()])) {
					//Llamo recursivamente achicando el problema(menos tiempo y mas marcas)
					lugares = resolverRecursivo(sitios,vecino,tiempo-tiempoCaminoVecino,marcas);
					if(lugares > maxLugares) {
						maxLugares = lugares;
					}
				}
			}
			
			retorno = maxLugares + 1;	//Agrego el primer lugar que me quedo sin agregar osea el actual
			
		}
		
		//Desmarco el vertice actual 
		marcas[entrada.getPosition()] = false;	//BackTracking
	
		return retorno;
	}
	
	public static void main(String[] args) {
	    Graph<Recinto> zoo = new AdjListGraph<Recinto>();
	    
	    // Crea los vértices
	    Vertex<Recinto> entrada = zoo.createVertex(new Recinto("entrada", 15));
	    Vertex<Recinto> flamencos = zoo.createVertex(new Recinto("flamencos", 10));
	    Vertex<Recinto> murcielagos = zoo.createVertex(new Recinto("murcielagos", 20));
	    Vertex<Recinto> tigres = zoo.createVertex(new Recinto("tigres", 10));
	    Vertex<Recinto> cebras = zoo.createVertex(new Recinto("cebras", 10));
	    Vertex<Recinto> tortugas = zoo.createVertex(new Recinto("tortugas", 10));
	    Vertex<Recinto> pumas = zoo.createVertex(new Recinto("pumas", 10));
	    Vertex<Recinto> wallabies = zoo.createVertex(new Recinto("wallabies", 30));

	    // Grafo no dirigido. Cada arista se agrega en ambos sentidos.
	    zoo.connect(entrada, flamencos, 25);
	    zoo.connect(flamencos, entrada, 25);
	    zoo.connect(entrada, murcielagos, 20);
	    zoo.connect(murcielagos, entrada, 20);
	    zoo.connect(entrada, tigres, 15);
	    zoo.connect(tigres, entrada, 15);
	    zoo.connect(entrada, cebras, 10);
	    zoo.connect(cebras, entrada, 10);
	    zoo.connect(tigres, cebras, 8);
	    zoo.connect(cebras, tigres, 8);
	    zoo.connect(cebras, tortugas, 5);
	    zoo.connect(tortugas, cebras, 5);
	    zoo.connect(tortugas, pumas, 15);
	    zoo.connect(pumas, tortugas, 15);
	    zoo.connect(tortugas, wallabies, 10);
	    zoo.connect(wallabies, tortugas, 10);
	    zoo.connect(wallabies, murcielagos, 10);
	    zoo.connect(murcielagos, wallabies, 10);
	    zoo.connect(murcielagos, flamencos, 25);
	    zoo.connect(flamencos, murcielagos, 25);

	    Parcial p = new Parcial();
	    System.out.println(p.resolver(zoo, 30));
	    System.out.println(p.resolver(zoo, 100));
	    System.out.println(p.resolver(zoo, 10));
	}

}

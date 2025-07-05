import Grafos.*;
import java.util.*;
import adjList.AdjListGraph;

public class Parcial {

	public Dupla nivelPopularidad(Graph<String> red , String usuario , int distancia , int umbral) {
		Dupla d = null;
		if(red != null && !red.isEmpty()) {
			Vertex<String> origen = red.search(usuario);
			if(origen != null) {
				d = new Dupla();
				bfs(red,origen,distancia,d);
				d.setPopular(d.getDistancia() >= umbral);
			}
		}
		return d;
	}
	
	private void bfs(Graph<String> red , Vertex<String> origen , int distancia , Dupla d) {
		int cant = 0;
		int grado = 0;
		Queue<Vertex<String>> cola = new Queue<Vertex<String>>();
		boolean [] visitados = new boolean[red.getSize()];	//Vector de marcas
		visitados[origen.getPosition()] = true;			//Pongo el origen como visitado
		cola.enqueue(origen);   						//Encolo el origen
		cola.enqueue(null); 							//Encolo null(marca del primer nivel)
		//Sigo recorriendo mientras la cola no se vacie y mientras el nivel, sea menor a la distancia requerida
		while(!cola.isEmpty() && grado < distancia) {
			Vertex<String> v = cola.dequeue();
			if(v != null) {
				List<Edge<String>> adyacentes = red.getEdges(v);	//Le pido los ady al que desencole
				for(Edge<String> edge : adyacentes) {
					Vertex<String> w = edge.getTarget();
					if(!visitados[w.getPosition()]) {
						visitados[w.getPosition()] = true;
						if(grado + 1 == distancia) {
							cant++;
						}else cola.enqueue(w);
					}
				}
				
			}else {
				if(!cola.isEmpty()) {
					grado++;
					cola.enqueue(null);
				}
			}
		}
		d.setDistancia(cant);
	}
	
	public static void main(String[] args) {
        Graph<String> grafo = new AdjListGraph<String>();
        Vertex<String> v1 = grafo.createVertex("Lionel");
        Vertex<String> v2 = grafo.createVertex("Rodrigo");
        Vertex<String> v3 = grafo.createVertex("Ángel");
        Vertex<String> v4 = grafo.createVertex("Emiliano");
        Vertex<String> v5 = grafo.createVertex("Julián");
        Vertex<String> v6 = grafo.createVertex("Diego");
        Vertex<String> v7 = grafo.createVertex("Lautaro");
        Vertex<String> v8 = grafo.createVertex("Enzo");
        
        grafo.connect(v1, v2);
        grafo.connect(v2, v1);
        
        grafo.connect(v1, v3);
        grafo.connect(v3, v1);
        
        grafo.connect(v2, v4);
        grafo.connect(v4, v2);
        
        grafo.connect(v2, v5);
        grafo.connect(v5, v2);
        
        grafo.connect(v3, v5);
        grafo.connect(v5, v3);
        
        grafo.connect(v3, v6);
        grafo.connect(v6, v3);
        
        grafo.connect(v6, v7);
        grafo.connect(v7, v6);
        
        grafo.connect(v5, v7);
        grafo.connect(v7, v5);
        
        grafo.connect(v6, v8);
        grafo.connect(v8, v6);
        
        grafo.connect(v4, v8);
        grafo.connect(v8, v4);
        
        grafo.connect(v4, v7);
        grafo.connect(v7, v4);
        
        Parcial p = new Parcial();
        
        System.out.println(p.nivelPopularidad(grafo, "Lionel", 2, 3));
        System.out.println(p.nivelPopularidad(grafo, "Lionel", 1, 3));
        System.out.println(p.nivelPopularidad(grafo, "Matias", 1, 0));
    }

	}


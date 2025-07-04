/*EJERCICIO 1: Puntaje 5 puntos

Implemente la clase ParcialGrafos, y el método:
public List<String> rtdtExploracionMaxima(Graph<String> mapa, String rover, String base, int maxTiempo)

Un robot explorador autónomo se encuentra en una zona de Marte investigando formaciones geológicas.
El terreno está representado mediante un grafo, donde:
	●Cada vertice representa una zona del terreno marciano(identificadas por un String).
	●Cada arista respresenta un pasaje entre zonas, con un peso que indica el tiempo estimado (en minutos)
	para atravesarlo.

El objetivo es encontrar un camino desde la posición actual del robot (rover) hasta la base que cumpla
con las siguentes condiciones:
	●Tiempo total del recorrido (suma de pesos de aristas) no debe superar maxTiempo ( ≤ maxTiempo).
	●Se debe visitar la mayor cantidad posible de zonas distintas(maximo numero de vertices).
	●No se debe pasar dos veces por la misma zona
	●Si hay varios caminos con igual cantidad maxima de zonas, se puede devolver cualquiera
	●Si no existe recorrido válido, devolver una lista vacía.

Consideraciones:
	●Validar que los vértices rover y base existan en el grafo antes de iniciar el recorrido.
	●El recorrido debe realizarse mediante una única exploración completa del grafo.
	●No se pueden usar variables de clase ni de instancia.*/

import java.util.*;
import Grafos.*;
import adjList.AdjListGraph;


public class ParcialGrafos {

	public List<String> rutaExploracionMaxima(Graph<String> mapa, String rover, String base, int maxTiempo){
		//Creo la lista de Strings de retorno
		List<String> retorno = new LinkedList<>();
		
		if(mapa !=null && !mapa.isEmpty()) {	//Si el grafo inicial no esta vacio
			
			////Busco que los vertices rover y base existan en el grafo antes de iniciar el recorrido
			Vertex<String> inicio = mapa.search(rover);
			Vertex<String> fin = mapa.search(base);
		
			
			//Si encontre ambos vertices, ejecuto el metodo recursivo
			if(inicio != null && fin != null) {
				//Creo el array de marcas para evitar loops infinitos en posibles ciclos
				boolean [] marcas = new boolean[mapa.getVertices().size()];
				//Llamo al metodo recursivo que resuelve el problema, agregandole los parametros necesarios
				Maximo maxZonas = new Maximo(0);	//Uso una clase para manejar el maximo
				rutaMaximaRecursiva(mapa,inicio,fin,maxTiempo,0,marcas,retorno,new LinkedList <>(),maxZonas);
			}
		}
		
		return retorno;
	}
	
	private void rutaMaximaRecursiva(Graph<String> mapa , Vertex<String> inicio , Vertex<String> fin , int maxTiempo ,
			int tiempoAct, boolean [] marcas , List<String> caminoRetorno , List<String> caminoAct , Maximo maxZonas) {
		
		//Lo primero que hago es marcar el vertice actual como visitado
		marcas[inicio.getPosition()] = true;
		//Agrego el vertice al camino actual
		caminoAct.add(inicio.getData());
		
		//Si llegue al final
		if(inicio.equals(fin)) {
			//Verifico si el camino actual es mejor que el camino maximo que tenia
			if(caminoAct.size() > maxZonas.getMax() && tiempoAct <= maxTiempo) {
				maxZonas.setMax(caminoAct.size());
				caminoRetorno.clear();
				caminoRetorno.addAll(caminoAct);
			}
		}
		//Si no llegue el final
		else {
			//Exploro los vecinos no visitados
			List<Edge<String>> vecinos = mapa.getEdges(inicio);	//Genero la lista de aristas
			
			for(Edge<String> edge:vecinos) {	//Itero sobre los vecinos(adyacentes)
				Vertex<String> vecino = edge.getTarget();
				int tiempoViaje = edge.getWeight();
				int nuevoTiempo = tiempoAct + tiempoViaje;
				
				//Verifico si puedo visitar este vecino(adyacente)
				if(!marcas[vecino.getPosition()] && nuevoTiempo <= maxTiempo) {
					rutaMaximaRecursiva(mapa,vecino,fin,maxTiempo,nuevoTiempo,marcas,caminoRetorno,caminoAct,maxZonas);
				}
			}
		}
		
		
		//Lo ultimo que hago es desmarcar el vertice actual y remover el ultimo que agrege en la lista
		marcas[inicio.getPosition()] = false;	//Bactracking
		caminoAct.remove(caminoAct.size()-1);				//BackTracking

	}
	
	
	public static void main(String[] args) {
		 Graph<String> mapaMarte = new AdjListGraph<>();
	        
	        Vertex<String> rover = mapaMarte.createVertex("rover");
	        Vertex<String> zonaB = mapaMarte.createVertex("zona B");
	        Vertex<String> zonaD = mapaMarte.createVertex("zona D");
	        Vertex<String> zonaF = mapaMarte.createVertex("zona F");
	        Vertex<String> zonaG = mapaMarte.createVertex("zona G");
	        Vertex<String> base = mapaMarte.createVertex("base");
	        
	        // Conectar las zonas (grafo no dirigido)
	        mapaMarte.connect(rover, zonaB, 10);
	        mapaMarte.connect(zonaB, rover, 10);
	        mapaMarte.connect(zonaB, zonaD, 5);
	        mapaMarte.connect(zonaD, zonaB, 5);
	        mapaMarte.connect(zonaD, zonaF, 3);
	        mapaMarte.connect(zonaF, zonaD, 3);
	        mapaMarte.connect(zonaF, zonaG, 7);
	        mapaMarte.connect(zonaG, zonaF, 7);
	        mapaMarte.connect(zonaG, base, 15);
	        mapaMarte.connect(base, zonaG, 15);
	        
	        ParcialGrafos p = new ParcialGrafos();
	        List<String> caminoCumple = p.rutaExploracionMaxima(mapaMarte, "rover", "base", 70);
	        
	        System.out.println("Ruta óptima: " + caminoCumple);
	        System.out.println("Zonas visitadas: " + caminoCumple.size());
	        
	        // Prueba adicional con tiempo insuficiente
	        List<String> caminoCorto = p.rutaExploracionMaxima(mapaMarte, "rover", "base", 20);
	        System.out.println("\nCon tiempo limitado (20): " + caminoCorto);
	}

}
/* Ejercicio 4
 Se quiere realizar un paseo en bicicleta por lugares emblemáticos de Oslo. Para esto se cuenta con un grafo de
 bicisendas. Partiendo desde el “Ayuntamiento” hasta un lugar destino en menos de X minutos, sin pasar por un
 conjunto de lugares que están restringidos.
 Escriba una clase llamada VisitaOslo e implemente su método:
 paseoEnBici(Graph<String> lugares, String destino,  int maxTiempo, List<String> lugaresRestringidos) :
 List<String>
 3
UNLP. Facultad de Informática.
 Algoritmos y Estructuras de Datos
 Cursada 2024
 En este ejemplo, para llegar desde Ayuntamiento a Museo Vikingo, sin pasar por: {“Akker Brigge”, “Palacio
 Real”} y en no más de 120 minutos, el camino marcado en negrita cumple las condiciones. 
Notas:
 ● El “Ayuntamiento” debe ser buscado antes de comenzar el recorrido para encontrar un camino.
 ● De no existir camino posible, se debe retornar una lista vacía.
 ● Debe retornar el primer camino que encuentre que cumple las restricciones.
 ● Ejemplos de posibles caminos a retornar, sin pasar por  “Akker Brigge” y “Palacio Real” en no más de 
120 min (maxTiempo)
 ● Ayuntamiento, El Tigre, Museo Munch, Parque Botánico, Galería Nacional, Parque Vigeland, 
FolkMuseum, Museo Fram, Museo del Barco Polar, Museo Vikingo. El recorrido se hace en 91 
minutos.
 ● Ayuntamiento, Parque Botánico, Galería Nacional, Parque Vigeland, FolkMuseum, Museo 
Fram, Museo del Barco Polar, Museo Vikingo. El recorrido se hace en 70 minutos.*/

import java.util.*;
import Grafos.*;
import adjList.*;

public class VisitaOslo {
	
	
	public List<String> paseoEnBici(Graph<String> lugares , String destino , int maxTiempo , 
			List<String> lugaresRestringidos){
		List<String> retorno = new LinkedList<>();
		if(lugares != null && !lugares.isEmpty()) {
			Vertex<String> inicio = lugares.search("Ayuntamiento");
			Vertex<String> fin = lugares.search(destino);
			if(inicio != null && fin != null) {
				boolean [] visitados = new boolean[lugares.getSize()];
				ignorarRestringidos(lugares,lugaresRestringidos,visitados);
				paseoEnBiciRec(lugares,inicio,fin,maxTiempo,visitados,retorno);
			}
		}
		return retorno;
	}
	
	private void ignorarRestringidos(Graph<String> lugares , List<String> lugaresRestringidos , boolean [] visitados) {
		for(String lugar : lugaresRestringidos) {
			Vertex<String> v = lugares.search(lugar);
			if (v != null) {
				visitados[v.getPosition()] = true;
			}
		}
	}
	
	
	private boolean paseoEnBiciRec(Graph<String> lugares , Vertex<String> inicio, Vertex<String> fin,
			int maxTiempo , boolean[] visitados , List<String> lista) {
		boolean encontre = false;
		visitados[inicio.getPosition()] = true;
		lista.add(inicio.getData());
		if(inicio == fin) {
			return true;
		}else {
			List<Edge<String>> vecinos = lugares.getEdges(inicio);
			Iterator<Edge<String>> iterador = vecinos.iterator();
			while(iterador.hasNext() && !encontre) {
				Edge<String> vecino = iterador.next();
				int posVecino = vecino.getTarget().getPosition();
				int pesoVecino = vecino.getWeight();
				if(!visitados[posVecino] && maxTiempo - pesoVecino >=0 ) {
					encontre = paseoEnBiciRec(lugares,vecino.getTarget(),fin,maxTiempo - pesoVecino,visitados,lista);
				}
			}
		}
		
		//BackTracking
		if(!encontre) {
			visitados[inicio.getPosition()] = false;
			lista.removeLast();
		}
		
		return encontre;
	}

	public static void main(String[] args) {
        Graph<String> grafo = new AdjListGraph<>();

        // Crear vértices
        Vertex<String> ayuntamiento = grafo.createVertex("Ayuntamiento");
        Vertex<String> akkerBrigge = grafo.createVertex("Akker Brigge");
        Vertex<String> parqueBotanico = grafo.createVertex("Parque Botánico");
        Vertex<String> museoMunch = grafo.createVertex("Museo Munch");
        Vertex<String> elTigre = grafo.createVertex("El Tigre");
        Vertex<String> galeriaNacional = grafo.createVertex("Galería Nacional");
        Vertex<String> parqueVigeland = grafo.createVertex("Parque Vigeland");
        Vertex<String> folkMuseum = grafo.createVertex("FolkMuseum");
        Vertex<String> museoFram = grafo.createVertex("Museo Fram");
        Vertex<String> museoBarcoPolar = grafo.createVertex("Museo del Barco Polar");
        Vertex<String> museoVikingo = grafo.createVertex("Museo Vikingo");
        Vertex<String> museoOpera = grafo.createVertex("La Opera");
        Vertex<String> fortaleza = grafo.createVertex("Fortaleza Akershus");
        Vertex<String> palacioReal = grafo.createVertex("Palacio Real");
        Vertex<String> holmenkollen = grafo.createVertex("Holmenkollen");
        Vertex<String> parqueNoruego = grafo.createVertex("Parque Noruego");

        // Conectar aristas con pesos (tiempos en minutos)
        grafo.connect(ayuntamiento, parqueBotanico, 15);
        grafo.connect(parqueBotanico, museoMunch, 1);
        grafo.connect(museoMunch, elTigre, 1);
        grafo.connect(elTigre, ayuntamiento, 10);
        grafo.connect(ayuntamiento, akkerBrigge, 5);
        grafo.connect(akkerBrigge, museoFram, 10);
        grafo.connect(museoFram, museoBarcoPolar, 5);
        grafo.connect(museoBarcoPolar, museoVikingo, 5);

        grafo.connect(parqueBotanico, galeriaNacional, 15);
        grafo.connect(galeriaNacional, parqueVigeland, 10);
        grafo.connect(parqueVigeland, folkMuseum, 10);
        grafo.connect(folkMuseum, museoFram, 5);

        grafo.connect(ayuntamiento, galeriaNacional, 10);
        grafo.connect(ayuntamiento, palacioReal, 10);
        grafo.connect(parqueVigeland, holmenkollen, 30);
        grafo.connect(folkMuseum, parqueNoruego, 10);

        grafo.connect(ayuntamiento, museoOpera, 5);
        grafo.connect(museoOpera, fortaleza, 10);
        grafo.connect(fortaleza, museoVikingo, 50);

        // Instanciar VisitaOslo
        VisitaOslo visita = new VisitaOslo();

        // Lista de lugares restringidos
        List<String> restringidos = new ArrayList<>();
        restringidos.add("Akker Brigge");
        restringidos.add("Palacio Real");
        
        // Ejecutar prueba
        List<String> camino = visita.paseoEnBici(grafo, "Museo Vikingo", 120, restringidos);
	    if (!camino.isEmpty()) {
	        System.out.println("\nCamino encontrado:");
	        for (String ciudad : camino) {
	            System.out.print(ciudad + " -> ");
	        }
	        System.out.println("FIN");
	    } else {
	        System.out.println("No se encontró un camino.");
	    }
	}
        
}

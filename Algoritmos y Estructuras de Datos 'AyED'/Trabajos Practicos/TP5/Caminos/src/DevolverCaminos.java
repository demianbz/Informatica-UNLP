
import java.util.*;
import Grafos.*;
import adjList.AdjListGraph;

public class DevolverCaminos {
	
	private Graph<String> mapaCiudades;
	
	public DevolverCaminos(Graph<String> mapaCiudades) {
		this.mapaCiudades = mapaCiudades;
	}

	
	//Retorna la lista de ciudades que se deben atravesar para ir de ciudad1 a ciudad2 en 
	//caso de que se pueda llegar, si no retorna la lista vacio(Sin tener en cuenta el combustible)
	public List<String> devolverCamino (String ciudad1 , String ciudad2){
		List<String> retorno = new LinkedList<>();
		if(mapaCiudades != null && !mapaCiudades.isEmpty()) {
			Vertex<String> c1 = mapaCiudades.search(ciudad1);
			Vertex<String> c2 = mapaCiudades.search(ciudad2);
		
			if(c1 != null && c2 != null) {
				boolean [] visitados = new boolean[mapaCiudades.getSize()];
				devolverCaminoRec(c1,c2,visitados,retorno);
			}
		}
		return retorno;
	}
	
	private boolean devolverCaminoRec (Vertex<String> inicio , Vertex<String> fin , boolean[] visitados , List<String> lista ){
		visitados[inicio.getPosition()] = true;
		boolean encontre = false;
		lista.add(inicio.getData());
		if(inicio == fin) {
			encontre = true;
		}else {
			List<Edge<String>> aristas = mapaCiudades.getEdges(inicio);
			Iterator<Edge<String>> iterador = aristas.iterator();
			while(!encontre && iterador.hasNext()) {
				Vertex<String> vecino = iterador.next().getTarget();
				int posVecino = vecino.getPosition();
				if (!visitados[posVecino])
					encontre = devolverCaminoRec(vecino,fin,visitados,lista);
			}
		}
		
		if(!encontre) {
			lista.removeLast();		//BackTracking
		}
		
		return encontre;
	}
	
	//Retornar la lista de ciudades que forman un camino desde ciudad1 a ciudad2, sin pasar por las 
	//ciudades que estan contenidas en la lista ciudades pasada por parametro, si no existe camino 
	//retorna la lista vacia. (Sin tener en cuenta el combustible).
	public List<String> devolverCaminoExceptuando(String ciudad1 , String ciudad2 , List<String> ciudades){
		List<String> retorno = new LinkedList<>();
		if(mapaCiudades != null && !mapaCiudades.isEmpty()) {
			Vertex<String> c1 = mapaCiudades.search(ciudad1);
			Vertex<String> c2 = mapaCiudades.search(ciudad2);
			if(c1 != null && c2 != null) {
				boolean [] visitados = new boolean[mapaCiudades.getSize()];
				ignorarCiudades(ciudades,visitados);
				devolverCaminoRec(c1,c2,visitados,retorno);
			}
		}
		return retorno;
	}
	
	//Para ignorar ciudades pongo como ya visitadas las ciudades a ignorar
	private void ignorarCiudades(List<String> ciudades , boolean [] visitados) {
		for (String ciudad : ciudades) {
			Vertex<String> v = mapaCiudades.search(ciudad);
			if (v != null) {
				visitados[v.getPosition()] = true;
			}
		}
	}
	
	//Retorna la lista de ciudades que forman el camino mas corto para llegar de ciudad 1 a ciudad 2.
	//si no existe camino retorna la lista vacio.(Las rutas poseen la distancia)
	public List<String> caminoMasCorto(String ciudad1 , String ciudad2){
		List<String> retorno = new LinkedList<>();
		if(mapaCiudades != null && !mapaCiudades.isEmpty()) {
			Vertex<String> c1 = mapaCiudades.search(ciudad1);
			Vertex<String> c2 = mapaCiudades.search(ciudad2);
			if(c1 != null && c2 != null) {
				boolean [] visitados = new boolean[mapaCiudades.getSize()];
				caminoMasCortoRec(c1,c2,visitados,retorno,new LinkedList<String>(),9999,0);
			}
		}
		return retorno;
	}
	
	
	private int caminoMasCortoRec(Vertex<String> inicio , Vertex<String> fin , boolean [] visitados , 
			List<String> lista , List<String> listaAct , int min , int act) {
		visitados[inicio.getPosition()] = true;
		listaAct.add(inicio.getData());
		if(inicio == fin && act<min) {
			min = act;
			lista.clear();
			lista.addAll(listaAct);
		}else {
			List<Edge<String>> vecinos = mapaCiudades.getEdges(inicio);	//Obtengo la lista de Aristas
			Iterator<Edge<String>> iterador = vecinos.iterator();	//Uso el iterador para iterar sobre los vecinos
			while(iterador.hasNext() && act<min) {
				Edge<String> vecino = iterador.next();	//Agarro un vecino
				int posVecino = vecino.getTarget().getPosition();	//Me guardo la posicion del vecino
				int pesoVecino = vecino.getWeight();	//Me guardo el peso del vecino
				if(!visitados[posVecino]) {
					min = caminoMasCortoRec(vecino.getTarget(),fin,visitados,lista,listaAct,min,act + pesoVecino);
				}
			}
		}
		//BackTracking
		visitados[inicio.getPosition()] = false;
		listaAct.removeLast();	
		
		return min;
	}
	
	//Retorna la lista de ciudades que forman un camino para llegar de ciudad1 a ciudad2.
	//El auto no debe quedarse sin combustible y no puede cargar. Si no existe camino retorna la lista vacia
	public List<String> caminoSinCargarCombustible(String ciudad1 , String ciudad2 , int tanqueAuto){
		List<String> retorno = new LinkedList<>();
		if(mapaCiudades != null && !mapaCiudades.isEmpty()) {
			Vertex<String> c1 = mapaCiudades.search(ciudad1);
			Vertex<String> c2 = mapaCiudades.search(ciudad2);
			if(c1 != null && c2 != null) {
				boolean [] visitados = new boolean[mapaCiudades.getSize()];
				caminoSinCargarRec(c1,c2,visitados,tanqueAuto,retorno);
			}
		}
		return retorno;
	}
	
	private boolean caminoSinCargarRec(Vertex<String> inicio , Vertex<String> fin , boolean[] visitados , 
			int tanqueAuto , List<String> lista) {
		visitados[inicio.getPosition()] = true;
		lista.add(inicio.getData());
		boolean encontre = false;
		if(inicio == fin) {
			encontre = true;
		}else {
			List<Edge<String>> vecinos = mapaCiudades.getEdges(inicio);
			Iterator<Edge<String>> iterador = vecinos.iterator();
			while(iterador.hasNext() && !encontre) {
				Edge<String> vecino = iterador.next();
				int pesoVecino = vecino.getWeight();
				int posVecino = vecino.getTarget().getPosition();
				if(!visitados[posVecino] && pesoVecino <= tanqueAuto) {
					encontre = caminoSinCargarRec(vecino.getTarget(),fin,visitados,tanqueAuto-pesoVecino,lista);
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
	
	//Retorna la lista de ciudades que forman un camino para llegar de ciudad1 a ciudad2 teniendo en 
	//cuenta que el auto debe cargar la menor cantidad de veces. El auto no se debe quedar sin 
	//combustible en el medio de laruta, ademas puede completar su tanque al llegar a cualquier ciudad.
	//Si no existe camino retorna la lista vacia.
	public List<String> caminoConMenorCargaDeCombustible(String ciudad1 , String ciudad2 , int tanqueAuto){
		List<String> retorno = new LinkedList<>();
		if(mapaCiudades != null && !mapaCiudades.isEmpty()) {
			Vertex<String> c1 = mapaCiudades.search(ciudad1);
			Vertex<String> c2 = mapaCiudades.search(ciudad2);
			if(c1 != null && c2 != null) {
				boolean [] visitados = new boolean[mapaCiudades.getSize()];
				caminoConMenorCargaRec(c1,c2,visitados,tanqueAuto,retorno, new LinkedList<String>(),0,9999,tanqueAuto);
			}
		}
		return retorno;
	}
	
	
	private int caminoConMenorCargaRec(Vertex<String> inicio , Vertex<String> fin , boolean [] visitados, 
			int tanqueAuto , List<String> lista , List<String> listaAct , int recargas , int recargasMin , int tanqueActual) {
		visitados[inicio.getPosition()] = true;
		listaAct.add(inicio.getData());
		if(inicio == fin && recargas < recargasMin) {
			recargasMin = recargas;
			lista.clear();
			lista.addAll(listaAct);
		}else {
			List<Edge<String>> vecinos = mapaCiudades.getEdges(inicio);
			Iterator<Edge<String>> iterator = vecinos.iterator();
			while(iterator.hasNext() && recargas < recargasMin) {
				Edge<String> vecino = iterator.next();
				int posVecino = vecino.getTarget().getPosition();
				int distancia = vecino.getWeight();
				if(!visitados[posVecino]) {
					if(tanqueActual >= distancia) {	//Si el tanque Act me alcanza
						recargasMin = caminoConMenorCargaRec(vecino.getTarget(),fin,visitados,tanqueAuto
								,lista,listaAct,recargas,recargasMin,tanqueActual - distancia);
					}else if(tanqueAuto >= distancia) {	//Si recargando me alcanza
						recargasMin = caminoConMenorCargaRec(vecino.getTarget(),fin,visitados,tanqueAuto
								,lista,listaAct,recargas + 1,recargasMin,tanqueAuto - distancia);
					}
				}
			}
		}
		
		//BackTracking
		visitados[inicio.getPosition()] = false;
		listaAct.removeLast();
		
		return recargasMin;
	}
	

	private void caminoConMenorCargaPorNiveles(Vertex<String> inicio , Vertex<String> fin , boolean [] visitados, 
			int tanqueAuto , List<String> lista , List<String> listaAct) {
		
		Queue<Auto> cola = new Queue<>();
		List<String> caminoInicial = new LinkedList<>();
		caminoInicial.add(inicio.getData());
		Auto estadoAuto = new Auto(inicio.getData(),tanqueAuto,0,caminoInicial);
	
		int [] minCargas = new int[] {Integer.MAX_VALUE};
		List<String> mejorCamino = new LinkedList<>();
		
		cola.enqueue(estadoAuto);
		while(!cola.isEmpty()) {
			Auto actual = cola.dequeue();
			
			if(actual.getCiudad().equals(fin.getData())) {//Si llegue al destino verifico si es mejor y si es lo pongo
				if(actual.getCargas() < minCargas[0]) {
					minCargas[0] = actual.getCargas();
					mejorCamino.clear();
					mejorCamino.addAll(actual.getCamino());
				}
				
			}else {	//Si no llegue al destino busco el vertice correspondiente a la ciudad actual
				Vertex<String> ciudadActual = mapaCiudades.search(actual.getCiudad());
				
				for(Edge<String> vecino : mapaCiudades.getEdges(ciudadActual)) {	//Para cada vecino
					String ciudadVecino = vecino.getTarget().getData();	//Nombre vecino
					int distancia = vecino.getWeight();	//Distancia hasta ese vecino
					
					if(distancia <= actual.getCombustible()) {	//Si el auto tiene suficiente comb para llegar
						List<String> nuevoCamino = new LinkedList<>(actual.getCamino());
						nuevoCamino.add(ciudadVecino);
						//Creo el nuevo estado con esta ciudad en la que estoy y la agrego al camino
						//Le paso la ciudadAct, el combustible que le queda , la mismas cargas , el camino actualizado
						Auto nuevoEstado = new Auto(ciudadVecino,actual.getCombustible()-distancia,actual.getCargas(),nuevoCamino);
						cola.enqueue(nuevoEstado);//Lo agrego a la cola
						
					}else {	//Si no alcanza el comb, pero si llego cargando
						if(distancia <= tanqueAuto) {
							//Hago lo mismo pero recargo el tanque y le sumo una carga al total de cargas
							List<String> nuevoCamino = new LinkedList<>(actual.getCamino());
							nuevoCamino.add(ciudadVecino);
							Auto nuevoEstado = new Auto(ciudadVecino,tanqueAuto - distancia,actual.getCargas()+1,nuevoCamino);
							cola.enqueue(nuevoEstado);	//Encolo ese nuevo estado
						}

					}
				}
				
			}
		}
		lista.clear();
		lista.addAll(mejorCamino);
	}
	
	
	public static void imprimirCamino(List<String> camino) {
	    if (!camino.isEmpty()) {
	        for (String ciudad : camino) {
	            System.out.print(ciudad + " -> ");
	        }
	        System.out.println("FIN");
	    } else {
	        System.out.println("No se encontró un camino.");
	    }
	}
	

	public static void main(String[] args) {
		Graph<String> mapaCiudades = new AdjListGraph<>();
		
		// Crear vértices (ciudades)
		Vertex<String> buenosAires = mapaCiudades.createVertex("Buenos Aires");
	    Vertex<String> rosario = mapaCiudades.createVertex("Rosario");
		Vertex<String> cordoba = mapaCiudades.createVertex("Córdoba");
	    Vertex<String> mendoza = mapaCiudades.createVertex("Mendoza");
	    Vertex<String> salta = mapaCiudades.createVertex("Salta");

	    // Conectar las ciudades (grafo no dirigido)
	    mapaCiudades.connect(buenosAires, rosario, 10);
	    mapaCiudades.connect(rosario, buenosAires, 10);

	    mapaCiudades.connect(rosario, cordoba, 8);
	    mapaCiudades.connect(cordoba, rosario, 8);

	    mapaCiudades.connect(cordoba, mendoza, 12);
	    mapaCiudades.connect(mendoza, cordoba, 12);

	    mapaCiudades.connect(mendoza, salta, 15);
	    mapaCiudades.connect(salta, mendoza, 15);
	    
	    // También podés agregar otro camino directo (opcional)
	    mapaCiudades.connect(buenosAires, cordoba, 20);
	    mapaCiudades.connect(cordoba, buenosAires, 20);

	    // Instanciar la clase DevolverCaminos con el grafo
	    DevolverCaminos caminos = new DevolverCaminos(mapaCiudades);


	    // --- Camino normal ---
	    System.out.println("----Camino sin restricciones----");
	    List<String> caminoNormal = caminos.devolverCamino("Buenos Aires", "Salta");
	    imprimirCamino(caminoNormal);

	    // --- Camino exceptuando una ciudad ---
	    System.out.println("\n----Camino ignorando la ciudad 'Córdoba'----");
	    List<String> ciudadesIgnoradas = new ArrayList<>();
	    ciudadesIgnoradas.add("Córdoba");
	    List<String> caminoIgnorando = caminos.devolverCaminoExceptuando("Buenos Aires", "Salta", ciudadesIgnoradas);
	    imprimirCamino(caminoIgnorando);
	    
	    // --- Camino mas corto ---
	    System.out.println("\n----Camino Mas corto de Buenos Aires a Salta----");
	    List<String> caminoMasCorto = caminos.caminoMasCorto("Buenos Aires", "Salta");
	    imprimirCamino(caminoMasCorto);
	    
	    //Tanque suficiente para pasar por Rosario y Córdoba
	    System.out.println("\n----Camino para llegar de Buenos Aires a Salta sin que se acabe el combustible----");
	    int tanque = 46;
	    List<String> camino1 = caminos.caminoSinCargarCombustible("Buenos Aires", "Salta", tanque);
	    System.out.println("Camino con tanque " + tanque + ": " + camino1);

	   
	    // --- Camino con menor cantidad de cargas ---
	    System.out.println("\n----Camino con menor cantidad de cargas de combustible----");

	    int tanqueJusto = 45; // Buenos Aires -> Córdoba (20) -> Mendoza (12) -> Salta (15) = 47, no alcanza sin cargar
	    List<String> caminoMinCargas2 = caminos.caminoConMenorCargaDeCombustible("Buenos Aires", "Salta", tanqueJusto);
	    System.out.println("Tanque: " + tanqueJusto);
	    imprimirCamino(caminoMinCargas2);
	    
	}
	
	
}

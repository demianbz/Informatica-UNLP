package Ejercicio3;

import java.util.*;
import Grafos.*;

public class Mapa {
	private Graph<String> mapaCiudades;
	
	public Mapa(Graph<String> mapaCiudades) {
		this.mapaCiudades = mapaCiudades;
	}

/*Retorna la lista de ciudades que se deben atravesar para ir de ciudad1 a ciudad2
 en caso de que se pueda llegar, si no retorna la lista vacía. (Sin tener en cuenta el combustible).*/ 
	public List<String> devolverCamino (String ciudad1, String ciudad2){
		 List<String> retorno = new LinkedList<>();
		 if(mapaCiudades != null && !mapaCiudades.isEmpty()) {
			 Vertex<String> c1 = mapaCiudades.search(ciudad1);
			 Vertex<String> c2 = mapaCiudades.search(ciudad2);
			 if(c1 != null && c2 != null) {
				 boolean [] marcas = new boolean[mapaCiudades.getSize()];
				 devolverCaminoRec(c1,c2,retorno,marcas);
			 }
		 }
		 return retorno;
	 }
	
	private boolean devolverCaminoRec(Vertex<String> c1 , Vertex<String> c2 , List<String> camino , 
									boolean [] marcas) {
		boolean encontre = false;
		camino.add(c1.getData());
		marcas[c1.getPosition()] = true;
		if(c1 == c2)
				encontre = true;
		else {
			List<Edge<String>> aristas = mapaCiudades.getEdges(c1);
			Iterator<Edge<String>> iterador = aristas.iterator();
			while(iterador.hasNext() && !encontre) {
				Vertex<String> v = iterador.next().getTarget();
				int targetPos = v.getPosition();
				if(!marcas[targetPos])
					encontre = devolverCaminoRec(v,c2,camino,marcas);
			}
		}
		if(!encontre)
			camino.removeLast();	//BackTracking
		
		return encontre;
	}
	
	
	 /*	 Retorna la lista de ciudades que forman un camino desde ciudad1 a ciudad2, sin pasar por las 
	 ciudades que están contenidas en la lista ciudades pasada por parámetro, si no existe camino 
	 retorna la lista vacía. (Sin tener en cuenta el combustible).*/
	 public List<String> devolverCaminoExceptuando (String ciudad1, String ciudad2, List<String> ciudades){
		 List<String> retorno = new LinkedList<>();
		 if(mapaCiudades != null && !mapaCiudades.isEmpty()) {
			 Vertex<String> c1 = mapaCiudades.search(ciudad1);
			 Vertex<String> c2 = mapaCiudades.search(ciudad2);
			 if(c1 != null && c2 != null) {
				 boolean [] marcas = new boolean[mapaCiudades.getSize()];
				 ignorarCiudades(ciudades,marcas);
				 devolverCaminoRec(c1,c2,retorno,marcas);
			 }
		 }
		 return retorno;
	 }

	 //Para ignorar ciudades pongo como ya visitadas las ciudades a ignorar
	 private void ignorarCiudades(List<String> ciudades, boolean[] visitados) {
	        for (String c : ciudades) {
	            Vertex<String> v = mapaCiudades.search(c);//uso el search porque es un grafo de String
	            if(v != null)
	                visitados[v.getPosition()] = true;
	        }
	 }
	 
	 
	 /*	 Retorna la lista de ciudades que forman el camino más corto para llegar de ciudad1 a ciudad2, 
	 si no existe camino retorna la lista vacía. (Las rutas poseen la distancia).*/
	 public List<String> caminoMasCorto(String ciudad1, String ciudad2){
		 List<String> retorno = new LinkedList<>();
		 if(mapaCiudades != null && !mapaCiudades.isEmpty()) {
			 Vertex<String> c1 = mapaCiudades.search(ciudad1);
			 Vertex<String> c2 = mapaCiudades.search(ciudad2);
			 if(c1 != null && c2 != null) {
				 boolean [] visitados = new boolean [mapaCiudades.getSize()];
				 caminoMasCortoRec(c1,c2,retorno,visitados,new LinkedList<>() , 9999 ,0);
			 }
		 }
		 return retorno;
	 }
	 
	 public int caminoMasCortoRec(Vertex<String> c1, Vertex<String> c2, List<String> caminoMin, 
			 					   boolean[] visitados , List<String> caminoAct, int min, int act) {
		 caminoAct.add(c1.getData());
		 visitados[c1.getPosition()] = true;
		 if(c1 == c2 && act <min) {
			 min = act;
			 caminoMin.clear();
			 caminoMin.addAll(caminoAct);
		 }else {
			 List<Edge<String>> edges = mapaCiudades.getEdges(c1);
			 Iterator<Edge<String>> iterador = edges.iterator();
			 while(iterador.hasNext() && act < min) {
				 Edge<String> aux = iterador.next();
				 int targetPos = aux.getTarget().getPosition();
				 int nuevoAct = act + aux.getWeight();
				 if(!visitados[targetPos] && nuevoAct < min)
					 min = caminoMasCortoRec(aux.getTarget(),c2,caminoMin,visitados,caminoAct,min,nuevoAct);
			 }
		 }
		 visitados[c1.getPosition()] = false;
		 caminoAct.removeLast();	//BackTracking
		 return min;
	 }

	 /*	 Retorna la lista de ciudades que forman un camino para llegar de ciudad1 a ciudad2. El auto no 
	 debe quedarse sin combustible y no puede cargar. Si no existe camino retorna la lista vacía.*/
	 public List<String> caminoSinCargarCombustible(String ciudad1, String ciudad2, int tanqueAuto){
		 
	 }

	 /*	 Retorna la lista de ciudades que forman un camino para llegar de ciudad1 a ciudad2 teniendo en cuenta
	 que el auto debe cargar la menor cantidad de veces. El auto no se debe quedar sin combustible en
	 medio de una ruta, además puede completar su tanque al llegar a cualquier ciudad. Si no existe camino
	 retorna la lista vacía.*/
	 public List<String> caminoConMenorCargaDeCombustible (String ciudad1, String ciudad2, int tanqueAuto){
		 
	 }
	 
	 
	 
	 public static void main(String[] args) {
	    	
	 }

	
}

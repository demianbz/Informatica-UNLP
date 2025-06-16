package Ejercicio2;

import Queue.*;
import Grafos.Edge;
import Grafos.Graph;
import Grafos.Vertex;
import adjList.AdjListGraph;

import java.util.LinkedList;
import java.util.List;

public class Recorridos<T> {

	//Retorna una lista con los datos de los vértices, con el recorrido en profundidad del grafo recibido como parámetro.
	public List<T> dfs (Graph<T> grafo){//
		List<T> retorno = new LinkedList<T>();
		boolean [] marcas = new boolean[grafo.getSize()];	//arreglo de marcas
		for(int i=0 ; i<grafo.getSize() ; i++) {
			if(!marcas[i])
				dfsRec(i,grafo,marcas,retorno);
		}
		
		return retorno;
	}

	private void dfsRec(int i , Graph<T> grafo, boolean[] marcas , List<T> lista ) {
		Vertex<T> v = grafo.getVertex(i);
		marcas[i] = true;
		lista.add(v.getData());
		for(Edge<T> e:grafo.getEdges(v)) {	//me da las aristas salientes del vertice "v"
			int targetPos = e.getTarget().getPosition();	//me da la pos del vertice desitno
			if(!marcas[targetPos]) //si el vertice siguiente no fue visitado llamo a la recursion
				dfsRec(targetPos,grafo,marcas,lista);
		}
	}
	
	
	public List<T> bfs (Graph<T> grafo){
		List<T> retorno = new LinkedList<T>();
		boolean [] marcas = new boolean[grafo.getSize()];
		for(int i=0 ; i<grafo.getSize() ; i++) {
			if(!marcas[i])
				bfsMod(i,grafo,marcas,retorno);
		}
		return retorno;
	}
	
	private void bfsMod(int i , Graph<T> grafo , boolean[] marcas , List<T> lista) {
		Queue<Vertex<T>> cola = new Queue<>();
		cola.enqueue(grafo.getVertex(i));
		marcas[i] = true;
		
		while(!cola.isEmpty()) {
			Vertex<T> av = cola.dequeue();
			lista.add(av.getData());
			for(Edge<T> e: grafo.getEdges(av)) {
				int targetPos = e.getTarget().getPosition();
				if(!marcas[targetPos]) {
					marcas[targetPos] = true;
					cola.enqueue(e.getTarget());
				}
			}
		}
	}
	
	
    public static void main(String[] args) {
    	 //Crear un grafo con la lista de adyacencias
        Graph<Integer> grafo = new AdjListGraph<>();

        //Crear vértices
        Vertex<Integer> v0 = grafo.createVertex(0);
        Vertex<Integer> v1 = grafo.createVertex(1);
        Vertex<Integer> v2 = grafo.createVertex(2);
        Vertex<Integer> v3 = grafo.createVertex(3);

        //Crear conexiones (edges)(aristas)
        grafo.connect(v0, v1);
        grafo.connect(v0, v2);
        grafo.connect(v1, v3);
        grafo.connect(v2, v3);
        
        //Imprimo adyacencias
        grafo.printAdjacencies();
        System.out.println();
        
        Recorridos<Integer> r = new Recorridos<>();
        System.out.println("Recorrido DFS: "+ r.dfs(grafo));
    }
}
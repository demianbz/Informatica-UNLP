/*Un poderoso e inteligente virus de computadora infecta cualquier computadora
 en 1 minuto, logrando infectar toda la red de una empresa con cientos de
 computadoras. Dado un grafo que representa las conexiones entre las
 computadoras de la empresa, y una computadora ya infectada, escriba un
 programa en Java que permita determinar el tiempo que demora el virus en
 infectar el resto de las computadoras. Asuma que todas las computadoras
 pueden ser infectadas, no todas las computadoras tienen conexión directa entre
 sí, y un mismo virus puede infectar un grupo de computadoras al mismo tiempo
 sin importar la cantidad.*/

import Grafos.*;
import adjList.AdjListGraph;

import java.util.*;

public class Virus {

	public static int calcularTiempoInfeccion(Graph<String> g, Vertex<String> inicial) {
		int tiempo = 0;
		boolean visitados [] = new boolean[g.getSize()];	//Vector de marcas
		Queue<Vertex<String>> cola = new Queue<Vertex<String>>();	//La cola
		visitados[inicial.getPosition()] = true;	//Pongo el origen como visitado
		cola.enqueue(inicial);	//Encolo el origen
		cola.enqueue(null);		//Encolo null por el primer nivel, null es para separar los niveles
		System.out.println("Minuto 0: Se infecta " + inicial.getData());
		while(!cola.isEmpty()) {	//Mientas la cola no se vacie
			Vertex<String> v = cola.dequeue();	//Desencolo el actual
			if(v != null) {	//Si no es null
				List<Edge<String>> adyacentes = g.getEdges(v);	//Le pido los adyacentes
				for(Edge<String> edge:adyacentes) {				//Para cada uno
					Vertex<String> w = edge.getTarget();		//Pido el adyacente
					if(!visitados[w.getPosition()]) {			//Si no fue visitado
						visitados[w.getPosition()] = true;		//Lo marco como visitado
						cola.enqueue(w);						//Y lo encolo
						 System.out.println("    → " + w.getData() + " se infecta (desde " + v.getData() + ")");
					}
				}
			}else {
				if(!cola.isEmpty()) {	
					tiempo++;				//Aumento el tiempo 
					System.out.println("-----Minuto " + tiempo + "-----");
					cola.enqueue(null);		//Encolo null como marcador final del siguiente minuto
				}
			}
		}
		
		return tiempo;
	}
	
	public static void main(String[] args) {
		Graph<String> grafo = new AdjListGraph<>();

        //Vértices
        Vertex<String> A = grafo.createVertex("A");
        Vertex<String> B = grafo.createVertex("B");
        Vertex<String> C = grafo.createVertex("C");
        Vertex<String> D = grafo.createVertex("D");
        Vertex<String> E = grafo.createVertex("E");

        //Conexiones (aristas)
        grafo.connect(A, B);
        grafo.connect(A, C);
        grafo.connect(C, D);
        grafo.connect(C, E);

        //Tiempo de infección desde A
        int tiempo = calcularTiempoInfeccion(grafo, A);
        System.out.println();
        System.out.println("Tiempo total de infección: " + tiempo + " minutos");
	}

}

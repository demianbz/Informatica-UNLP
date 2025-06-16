package Grafos;

import java.util.List;

public interface Graph<T> {

	/**
	 * Crea un vértice con el dato recibido y lo retorna.
	 * 
	 * @param data Dato que contendrá el nuevo vértice
	 */
	public Vertex<T> createVertex(T data);
	
	/**
	 * Elimina el vértice del Grafo.
	 * En caso que el vértice esté relacionado con otros, estas relaciones también se eliminan.
	 * 
	 * @param vertex Vértice a eliminar
	 */
	public void removeVertex(Vertex<T> vertex);
	
	/**
	 * Busca y retorna el primer vértice cuyo dato es igual al parámetro recibido.
	 * Retorna null si no existe tal.
	 * 
	 * @param data Contenido del vértice
	 * @return Vertice o null si no existe tal
	 */
	public Vertex<T> search(T data);
	
	/**
	 * Conecta el vértice origen con el vértice destino.
	 * Verifica que ambos vértices existan, caso contrario no realiza ninguna conexión.
	 * 
	 * @param origin vértice origen
	 * @param destination vértice destino
	 */
	public void connect(Vertex<T> origin, Vertex<T> destination);
	
	/**
	 * Conecta el vertice origen con el destino con peso.
	 * Verifica que ambos vertices existan, caso contrario no realiza ninguna conexion
	 * 
	 * @param origin vértice origen
	 * @param destination vértice destino
	 * @param weight peso de la conexión
	 */
	public void connect(Vertex<T> origin, Vertex<T> destination, int weight);
	
	/**
	 * Desconecta el vértice origen con el destino.
	 * Verifica que ambos vértices existan, caso contrario no realiza ninguna desconexión
	 * En caso de existir la conexión destino-->origen, esta permanecerá sin cambios. 
	 * 
	 * @param origin vértice origen
	 * @param destination vértice destino
	 */
	public void disconnect(Vertex<T> origin, Vertex<T> destination);
	
	/**
	 * @param origin vértice origen
	 * @param destination vértice destino
	 * @return si existe una arista entre el vértice origen y el destino
	 */
	public boolean existsEdge(Vertex<T> origin, Vertex<T> destination);
	
	/**
	 * @param origin vértice origen
	 * @param destination vértice destino
	 * @return peso entre dos vértices || 0 en caso de no existir la arista
	 */
	public int weight(Vertex<T> origin, Vertex<T> destination);

	/**
	 * @return si el grafo no contiene datos (sin vértices creados)
	 */
	public boolean isEmpty();
	
	/**
	 * @return lista de vértices
	 */
	public List<Vertex<T>> getVertices();
		
	/**
	 * @param v vértice recibido
	 * @return lista de adyacencias al vértice recibido
	 */
	public List<Edge<T>> getEdges(Vertex<T> v);
	
	/**
	 * @param position posición recibida
	 * @return vértice en position
	 */
	public Vertex<T> getVertex(int position);
	
	/**
	 * @return cantidad de vértices del grafo
	 */
	public int getSize();

	public void printAdjacencies();
}
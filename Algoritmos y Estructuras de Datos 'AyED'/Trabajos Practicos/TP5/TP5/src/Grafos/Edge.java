package Grafos;

public interface Edge<T> {
	
	/**
	 * @return vértice destino de la arista
	 */
	public Vertex<T> getTarget();
	
	/**
	 * @return peso de la arista
	 */
	public int getWeight();

}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package primercaminosumaminima;

import java.util.*;

public class Queue<T> extends Sequence{
    List<T> data;
    
    public Queue(){
        //Constructor de la Clase
        this.data = new LinkedList<T>(); 
    }
    
    public void enqueue(T dato){
        //Agrega un elemento al final de la cola
        data.add(dato);
    }
    
    public T dequeue(){
        //Elimina el elemento del frente de la cola y lo retorna. Si la cola está vacía se produce un error
        return data.remove(0);
    }
    
    public T head(){
        //Retorna el elemento del frente de la cola. Si la cola está vacía se produce un error. 
        return data.get(0);
    }
    
    
    
    @Override
    public int size() {
        // Retorna la cantidad de elementos de la cola.
        return data.size();
    }

    @Override
    public boolean isEmpty() {
        //Retorna verdadero si la cola no tiene elementos y falso en caso contrario 
        return data.size() == 0;
    }

    
    @Override
    public String toString() {
        String str = "[";
	for(T d: data)
            str = str + d +", ";
	str = str.substring(0, str.length()-2)+"]";
	return str;
    }
}
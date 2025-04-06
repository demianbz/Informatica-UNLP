/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp1ejercicio8;

/**
 *
 * @author DEMIA
 */
public class DoubleEndedQueue<T> extends Queue<T> {
    
    public void enqueueFirst(T data){
        //Permite encolar al inicio.
        super.data.add(0, data); //Accedo a la variable protegida data del padre por medio de super y agrego data en la pos 0, o sea primero
    }
    
}

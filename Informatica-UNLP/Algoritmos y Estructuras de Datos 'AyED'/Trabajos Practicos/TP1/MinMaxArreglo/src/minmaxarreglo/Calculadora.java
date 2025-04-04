/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minmaxarreglo;

/**
 *
 * @author DEMIA
 */
public class Calculadora {
    
    public static Datos maxmin(int[] Datos){
        int max = 0 , min = 99;
        for(int i=0 ; i<Datos.length ; i++){
            if(Datos[i] > max)
                max = Datos[i];
            if(Datos[i] < min)
                min = Datos[i];
    }
        Datos objeto = new Datos();
        objeto.setMax(max);
        objeto.setMin(min);
        
        return objeto;
    }
    
}

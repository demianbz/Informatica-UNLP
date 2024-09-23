/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectpruebas;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author DEMIA
 */
public class ProyectPruebas {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("Ingrese su Nombre");
        String nombre = Lector.leerString();
        System.out.println("Ingrese su Sueldo");
        double sueldo = Lector.leerDouble();
        
        System.out.println(nombre + " Cobra " + sueldo + " Pesos");
        
        GeneradorAleatorio.iniciar();
        
        sueldo = GeneradorAleatorio.generarDouble(500);
        System.out.println("Sueldo Aleatorio");
        System.out.println(nombre + " Cobra " + sueldo + " Pesos");
       
        
        }
    }
    


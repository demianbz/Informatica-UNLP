/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio1p2;

    import PaqueteLectura.Lector;
    //import ejercicio1p2.Persona;

public class Ejercicio1P2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
                Persona per = new Persona();
        
        System.out.print("Ingrese su Nombre: ");
        String nom = Lector.leerString();
        per.setNombre(nom);
        
        System.out.print("Ingrese su DNI: ");
        int dni = Lector.leerInt();    
        per.setDNI(dni);
        
        System.out.print("Ingrese su Edad: ");
        int edad = Lector.leerInt();      
        per.setEdad(edad);
 
        System.out.print(per.toString());
        
        System.out.println();
        
        
        
    }
    
}

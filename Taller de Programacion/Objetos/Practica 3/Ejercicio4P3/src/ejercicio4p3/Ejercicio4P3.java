/* 4-A- Un hotel posee N habitaciones. De cada habitación conoce costo por noche, si está
ocupada y, en caso de estarlo, guarda el cliente que la reservó (nombre, DNI y edad).
(i) Genere las clases necesarias. Para cada una provea métodos getters/setters adecuados.
(ii) Implemente los constructores necesarios para iniciar: los clientes a partir de nombre,
DNI, edad; el hotel para N habitaciones, cada una desocupada y con costo aleatorio e/ 2000
y 8000.
(iii) Implemente en las clases que corresponda todos los métodos necesarios para:
- Ingresar un cliente C en la habitación número X. Asuma que X es válido (es decir, está
en el rango 1..N) y que la habitación está libre.
- Aumentar el precio de todas las habitaciones en un monto recibido.
- Obtener la representación String del hotel, siguiendo el formato:
{Habitación 1: costo, libre u ocupada, información del cliente si está ocupada}
…
{Habitación N: costo, libre u ocupada, información del cliente si está ocupada}
B- Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones,
muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.
NOTAS: Reúse la clase Persona. Para cada método solicitado piense a qué clase debe
delegar la responsabilidad de la operación */
 
package ejercicio4p3;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio4P3 {

    public static void main(String[] args) {
        
        System.out.print("Ingrese el numero de Habitaciones: ");
        int N = Lector.leerInt();
        Hotel H = new Hotel(N);
        
        int i;
        
        //Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones
        for (i=0 ; i<N ; i++){
            System.out.println("----Habitacion "+ (i+1) +"----");
            
            System.out.print("Ingrese su Nombre: ");
            String nombre = GeneradorAleatorio.generarString(5);
            System.out.println(nombre);
            System.out.print("Ingrese su DNI: ");
            int dni = GeneradorAleatorio.generarInt(400)+500;
            System.out.println(dni);
            System.out.print("Ingrese su Edad: ");
            int edad = GeneradorAleatorio.generarInt(70)+18;
            System.out.println(edad);
            
            Persona Cliente = new Persona(nombre,dni,edad);
            
            H.ingresarCliente(i,Cliente);
            
            
        }
        
        
        //Mostrar el Hotel {Habitación N: costo, libre u ocupada, información del cliente si está ocupada}
        System.out.println(H.toString());
        
        //Aumentar Precio
        H.aumentarPrecio(300);
        
        //Volver a Mostrar el Hotel
        System.out.println(H.toString());
        
        
        /*System.out.print("Ingrese su Nombre: ");
        String nombre = Lector.leerString();
        System.out.print("Ingrese su DNI: ");
        int dni = Lector.leerInt();
        System.out.print("Ingrese su Edad: ");
        int edad = Lector.leerInt();
        
        System.out.println("Ingrese la habitacion en la que quiere estar: ");
        int X = Lector.leerInt();
        
        Persona C = new Persona(nombre,dni,edad);
        
        H.ingresarCliente(X, C);
        
        System.out.print("Ingrese el monto para aumentar: ");
        int monto = Lector.leerInt();
        H.aumentarPrecio(monto);*/
        
        
        
        
    }
    
}

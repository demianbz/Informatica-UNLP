/* 4-A- Un hotel posee N habitaciones. De cada habitaciÃ³n conoce costo por noche, si estÃ¡
ocupada y, en caso de estarlo, guarda el cliente que la reservÃ³ (nombre, DNI y edad).
(i) Genere las clases necesarias. Para cada una provea mÃ©todos getters/setters adecuados.
(ii) Implemente los constructores necesarios para iniciar: los clientes a partir de nombre,
DNI, edad; el hotel para N habitaciones, cada una desocupada y con costo aleatorio e/ 2000
y 8000.
(iii) Implemente en las clases que corresponda todos los mÃ©todos necesarios para:
- Ingresar un cliente C en la habitaciÃ³n nÃºmero X. Asuma que X es vÃ¡lido (es decir, estÃ¡
en el rango 1..N) y que la habitaciÃ³n estÃ¡ libre.
- Aumentar el precio de todas las habitaciones en un monto recibido.
- Obtener la representaciÃ³n String del hotel, siguiendo el formato:
{HabitaciÃ³n 1: costo, libre u ocupada, informaciÃ³n del cliente si estÃ¡ ocupada}
â€¦
{HabitaciÃ³n N: costo, libre u ocupada, informaciÃ³n del cliente si estÃ¡ ocupada}
B- Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones,
muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.
NOTAS: ReÃºse la clase Persona. Para cada mÃ©todo solicitado piense a quÃ© clase debe
delegar la responsabilidad de la operaciÃ³n */
 
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
        
        
        //Mostrar el Hotel {HabitaciÃ³n N: costo, libre u ocupada, informaciÃ³n del cliente si estÃ¡ ocupada}
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

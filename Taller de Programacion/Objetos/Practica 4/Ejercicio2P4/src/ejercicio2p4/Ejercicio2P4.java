/* 2- Queremos representar a los empleados de un club: jugadores y entrenadores.
▪ Cualquier empleado se caracteriza por su nombre, sueldo básico y antigüedad.
▪ Los jugadores son empleados que se caracterizan por el número de partidos jugados y
el número de goles anotados.
▪ Los entrenadores son empleados que se caracterizan por la cantidad de campeonatos
ganados.
A- Implemente la jerarquía de clases declarando atributos, métodos para
obtener/modificar su valor y constructores que reciban los datos necesarios.
B- Cualquier empleado debe responder al mensaje calcularEfectividad. La efectividad
del entrenador es el promedio de campeonatos ganados por año de antigüedad, mientras
que la del jugador es el promedio de goles por partido.
C- Cualquier empleado debe responder al mensaje calcularSueldoACobrar. El sueldo a
cobrar es el sueldo básico más un 10% del básico por cada año de antigüedad y además:
▪ Para los jugadores: si el promedio de goles por partido es superior a 0,5 se adiciona un
plus de otro sueldo básico.
▪ Para los entrenadores: se adiciona un plus por campeonatos ganados (5000$ si ha
ganado entre 1 y 4 campeonatos; $30.000 si ha ganado entre 5 y 10 campeonatos;
50.000$ si ha ganado más de 10 campeonatos).
D- Cualquier empleado debe responder al mensaje toString, que devuelve un String que
lo representa, compuesto por nombre, sueldo a cobrar y efectividad.
F- Realizar un programa que instancie un jugador y un entrenador. Informe la
representación String de cada uno.
NOTA: para cada método a implementar piense en que clase/s debe definir el método.
 */

package ejercicio2p4;
import PaqueteLectura.Lector;

public class Ejercicio2P4 {

    public static void main(String[] args) {

        System.out.print("Ingrese el Nombre del Jugador: ");
        String nombre = Lector.leerString();
        System.out.print("Ingrese el Sueldo Basico del Jugador: ");
        double sueldo = Lector.leerDouble();
        System.out.print("Ingrese la Antiguedad del Jugador: ");
        int antiguedad = Lector.leerInt();
        System.out.print("Ingrese el Numero de Partidos del Jugador: ");
        int partidos = Lector.leerInt();
        System.out.print("Ingrese el Numero de Goles del Jugador: ");
        int goles = Lector.leerInt();
        
        Jugador jugador1 = new Jugador(nombre,sueldo,antiguedad,partidos,goles);
        System.out.println(jugador1.toString());
        
        System.out.print("Ingrese el Nombre del Entrenador: ");
        nombre = Lector.leerString();
        System.out.print("Ingrese el Sueldo Basico del Entrenador: ");
        sueldo = Lector.leerDouble();
        System.out.print("Ingrese la Antiguedad del Entrenador: ");
        antiguedad = Lector.leerInt();
        System.out.print("Ingrese la cantidad Campeonatos Ganados: ");
        int campeonatos = Lector.leerInt();
        
        Entrenador entrenador1 = new Entrenador(nombre,sueldo,antiguedad,campeonatos);
        System.out.println(entrenador1.toString());
        

    }
    
}

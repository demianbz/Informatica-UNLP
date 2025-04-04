/*2- Escriba un programa que lea las alturas de los 15 jugadores de un equipo de
básquet y las almacene en un vector. Luego informe:
- la altura promedio
- la cantidad de jugadores con altura por encima del promedio */
package ejercicio2;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ejercicio2 {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        //Paso 3: Crear el vector para 15 double 		
		int dimF=15;
        double [] jugadores = new double [dimF]; //de 0 a 14
		
        //Paso 4: Declarar indice y variables auxiliares a usar
		int i,cant;
		double num,suma,prom;
		
		suma=0;
		cant=0;
		
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i=0 ; i<dimF ; i++){
			System.out.println("Ingrese La altura del jugador "+ i);
			num = Lector.leerDouble();
			jugadores[i]=num;
			suma=suma+num;
			}	
		
		//Extra (Imprimir Vector)
		/*for (i=0 ; i<dimF ; i++)
			System.out.println("Jugador: "+ i +" Altura: "+ jugadores[i]);*/
		
        //Paso 7: Calcular el promedio de alturas, informarlo
        prom=suma/dimF;
		System.out.println("El Promedio de alturas es: "+ prom);
		
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
		for (i=0 ; i<dimF ; i++){
			if(jugadores[i]>prom)
				cant=cant+1;
		}
        //Paso 9: Informar la cantidad.
		System.out.println("La cantidad de alturas que estan por encima de el Promediio son: "+ cant);
		
	}
}

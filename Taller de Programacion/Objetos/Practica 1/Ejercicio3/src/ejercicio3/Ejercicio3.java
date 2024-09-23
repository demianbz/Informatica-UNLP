/*3- Escriba un programa que defina una matriz de enteros de tamaño 5x5. Inicialice
la matriz con números aleatorios entre 0 y 30.
Luego realice las siguientes operaciones:
- Mostrar el contenido de la matriz en consola.
- Calcular e informar la suma de los elementos de la fila 1
- Generar un vector de 5 posiciones donde cada posición j contiene la suma
de los elementos de la columna j de la matriz. Luego, imprima el vector.
- Leer un valor entero e indicar si se encuentra o no en la matriz. En caso de
encontrarse indique su ubicación (fila y columna) en caso contrario
imprima “No se encontró el elemento”. */
package ejercicio3;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ejercicio3 {

    public static void main(String[] args) {
	//Paso 2. iniciar el generador aleatorio     
        GeneradorAleatorio.iniciar();
		
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
	int [][] tabla = new int[5][5]; // de 0 a 4 filas (i=5) y de 0 a 4 columnas (j=5)
		
	int i,j;
		
	for (i=0 ; i<5 ; i++)
		for(j=0 ; j<5 ; j++)
			tabla[i][j]=GeneradorAleatorio.generarInt(10); // del 0 al 21
		
        //Paso 4. mostrar el contenido de la matriz en consola
	for(i=0 ; i<5 ; i++){
		System.out.println("");	
		for(j=0 ; j<5 ; j++)
			System.out.print(tabla[i][j] +"|");
		}
		
	System.out.println("");
		
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int fila=1 , suma=0;
        for (j=0 ; j<5 ; j++)
            suma=suma+tabla[fila][j];
        System.out.println("La suma de los elementos de la fila 1 es:"+ suma);
        
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        int [] sumaj = new int[5];
        
        int suma2=0 , columna=0;
        
        
        for(j=0 ; j<5 ; j++){
            for (i=0 ; i<5 ; i++){
                suma2=suma2+tabla[i][columna];
            }
        columna=columna+1;
        sumaj[j]=suma2;
        suma2=0;
        }
        
        for (j=0 ; j<5 ; j++)
            System.out.println("Suma de los elementos de la columna "+ j +" :"+sumaj[j]);
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        int num;
        boolean ok=false;
        
        System.out.print("Ingrese un numero a buscar (entre 0 y 9): ");
        num = Lector.leerInt();
        System.out.println();
                
        for(i=0 ; i<5 ; i++){
		for(j=0 ; j<5 ; j++)
			if(num == tabla[i][j]){
                            System.out.println("El valor se encontro en la Fila "+ i +" Columa "+ j);
                            ok=true;
                        }
		}
        if(ok==false)
            System.out.println("No se encontro el elemento");
        
    }
}
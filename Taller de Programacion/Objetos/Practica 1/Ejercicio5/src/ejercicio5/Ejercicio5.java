/* 5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
(con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
de la comida (2) Precio (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
para cada uno de los aspectos y almacene la información en una estructura. Luego
imprima la calificación promedio obtenida por cada aspecto.  */
package ejercicio5;

    import PaqueteLectura.Lector;
    import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author DEMIA
 */
public class Ejercicio5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        int [][] restaurante = new int [5][4];  //5 clientes y 4 aspectos
        
        int i,j;
        
        //Clientes
        GeneradorAleatorio.iniciar();
        for (i=0 ; i<5 ; i++){
            System.out.println("-----Cliente "+ (i+1) +"-----");
            //Calificacion de Aspectos
            for(j=0 ; j<4 ; j++){
                int calificacion = GeneradorAleatorio.generarInt(10)+1;
                System.out.println("Califique el Aspecto "+ j +" entre 1 y 10: "+ calificacion);
              //int calificacion = Lector.leerInt();
                restaurante[i][j]=calificacion;
                
            }
            
        }
        
        //Imprimo para corroborar
        
        for (i=0 ; i<5 ; i++){
            System.out.println();
            System.out.println("Cliente "+ (i+1));
            for (j=0 ; j<4 ; j++){
                System.out.print(restaurante[i][j] +"|");
            }
        }
        System.out.println();
        System.out.println();
        
        //Calculo el Promedio de cada Aspecto
        
        int aspecto=0;
        double promedio=0 , suma=0;
        
        for (j=0 ; j<4 ;j++){
            for(i=0 ; i<5 ;i++){
                suma=suma+restaurante[i][aspecto];
            }
            promedio=suma/5;
            System.out.println("Calificacion Promedio del Aspecto "+ aspecto +": "+ promedio);
            aspecto=aspecto+1;
            suma=0;
            
        }
        
        
    }
    
}

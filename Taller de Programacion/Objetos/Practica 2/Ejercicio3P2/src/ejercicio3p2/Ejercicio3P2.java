/*3- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:
b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar
Strings use el método equals.
 */

package ejercicio3p2;

    import PaqueteLectura.Lector;
   // import PaqueteLectura.GeneradorAleatorio;


/**
 *
 * @author DEMIA
 */


public class Ejercicio3P2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Persona[][] matriz = new Persona[5][8];
        
        int dimF=40 , dimL=0 , dimTot=1; //dimL = dia ( a lo sumo 5 ) t = turno
        int i;
        
        int dni,edad;
        String nom;
        
            System.out.println("------Dia "+ (dimL+1) + "------");       
        for (i=0 ; i<8 ; i++){
            System.out.println("Turno "+ (i+1));
            System.out.print("Ingrese su Nombre: ");
            nom = Lector.leerString();
            System.out.print("Ingrese su DNI: ");
            dni = Lector.leerInt();
            System.out.print("Ingrese su edad: ");
            edad = Lector.leerInt();
            matriz[dimL][i] = new Persona(nom,dni,edad);
        }
        String nomz = "ZZZ";
        String nombre = matriz[dimL][0].getNombre();
        dimL++;
        
        while((dimTot <= dimF) && (!nombre.equals(nomz))){
            System.out.println("------Dia "+ (dimL+1) + "------");       
            i=0;
            while (!nombre.equals(nomz) && (i<8)){
                System.out.println("Turno "+ i);
                System.out.print("Ingrese su Nombre: ");
                nom = Lector.leerString();
                if(!nom.equals(nomz)){
                System.out.print("Ingrese su DNI: ");
                dni = Lector.leerInt();
                System.out.print("Ingrese su edad: ");
                edad = Lector.leerInt();
                matriz[dimL][i] = new Persona(nom,dni,edad);
                i++;
                }
                nombre = matriz[dimL][i].getNombre();
            }
            dimL++;
            dimTot++;
        }
        
           
        
        int j;
        
        for (i=0 ; i<=dimL ; i++){
            System.out.println("---------Dia "+ (i+1) +"---------");
            for (j=0 ; j<8 ; j++){
                System.out.print("Turno "+ (j+1));
                System.out.println(" Nombre: "+ matriz[i][j].getNombre());
            }
        }
      
        System.out.println();
        System.out.println();
    }
    
}


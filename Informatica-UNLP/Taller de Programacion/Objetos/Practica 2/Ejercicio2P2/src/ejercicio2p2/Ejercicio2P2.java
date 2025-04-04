/*
2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
obtener edad 0. Luego de almacenar la información:
- Informe la cantidad de personas mayores de 65 años.
- Muestre la representación de la persona con menor DNI.
 */
package ejercicio2p2;

    //import PaqueteLectura.Lector;
    import PaqueteLectura.GeneradorAleatorio;
    import PaqueteLectura.Lector;


/**
 *
 * @author DEMIA
 */
public class Ejercicio2P2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        int dimF=15 , dimL=0;
        
        
        Persona [] vector = new Persona[dimF];
        
        int edad=0 , dni=0;
        String nom=" ";
        
        System.out.println("----Persona "+ dimL +" ----");
        
        System.out.print("Ingrese su Edad: ");
      //edad=Lector.leerInt();
        edad = GeneradorAleatorio.generarInt(100)+1;
        System.out.println(edad);
        
        while ((dimL<dimF) && (edad!=0)){
            
            System.out.print("Ingrese su Nombre: ");
          //nom = Lector.leerString();
            nom = GeneradorAleatorio.generarString(10);
            System.out.println(nom);
            
            System.out.print("Ingrese su DNI: ");
          //dni = Lector.leerInt();
            dni = GeneradorAleatorio.generarInt(1000);
            System.out.println(dni);
        
            vector[dimL] = new Persona(nom,dni,edad);
            dimL++; 
            
            
        System.out.println("----Persona "+ dimL +" ----");

            
            System.out.print("Ingrese su Edad: ");
            //edad=Lector.leerInt();
            edad = GeneradorAleatorio.generarInt(100)+1;
            System.out.println(edad);
        
        }
        
        int i , cant=0 , min=1001;
        
        Persona personaMinima = new Persona();
        
        for (i=0 ; i<dimL ; i++){
            
            if(vector[i].getEdad()>65)
                cant++;
            
            if(vector[i].getDNI()<min){
                min=vector[i].getDNI();
                personaMinima = vector[i];
            }
            
         }   
         
         
        System.out.println();
        
        //- Informe la cantidad de personas mayores de 65 años.
        
        System.out.println("La cantidad de personas mayores a 65 años son: "+ cant);
        
        
        //- Muestre la representación de la persona con menor DNI.    
        
        System.out.println("Persona con menor DNI:");
        System.out.println(personaMinima.toString());
        
        System.out.println();
       

    }
    
}

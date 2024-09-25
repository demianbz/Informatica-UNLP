/*
4- Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:
a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
y el día en que se quiere presentar al casting. La persona debe ser inscripta en ese día, en el
siguiente turno disponible. En caso de no existir un turno en ese día, informe la situación.
La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos de
casting.
Una vez finalizada la inscripción:
b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la
persona a entrevistar en cada turno asignado.

 */
package ejercicio4p2;

    import PaqueteLectura.Lector;

public class Ejercicio4P2 {

    public static void main(String[] args) {
        
        Persona [][] matriz = new Persona [5][8];
        
        int [] vecDias = new int [5];
        
        int dni , edad , dia;
        String nom;
        
        int dimlD = 0, dimlT = 0; //dimlD = dimL Dia (filas) y dimlT =dimL Turnos (columnas)        
       
        int v;
        
        //Inicializo el vector
        for (v=0 ; v<5 ;v++){
            vecDias[v] = 0;
        }
        
        System.out.println("------Dia " + (dimlD + 1) + "------");
        System.out.print("Ingrese su Nombre: ");
	nom = Lector.leerString();
	dimlT = 0;
        
        while (!nom.equals("ZZZ") && (dimlD < 5)){  //Mientras no llegue al nombre de corte y mientras no complete el ultimo dia
            System.out.println("Turno "+ dimlT);       
            System.out.println("Ingrese el dia en el que quiere ser atendido");
            dia = Lector.leerInt();
            
            if(vecDias[dia] == 8){
                System.out.println("El dia tiene los turnos completos");
            } else {
                vecDias[dia]++;
                System.out.print("Ingrese Su edad: ");
                edad = Lector.leerInt();
                System.out.print("Ingrese su DNI: ");
                dni = Lector.leerInt();                
                matriz [dimlD][dimlT] = new Persona(nom,dni,edad); 
                
                System.out.print("Ingrese el Nombre: ");
                nom = Lector.leerString();
                dimlT++;            
                
                if(dimlT == 8){     //Si ya llene los 8 turnos
                    dimlT=0;    //Reinicio los turnos
                    dimlD++;    //Cambio de dia
                    System.out.println("------Dia " + (dimlD + 1) + "------");                
                }   
            }        
        }
     
        int i,j;
        
        for (i=0 ; i<dimlD ; i++){
            System.out.println("La Cantidad de inscriptos al casting el dia "+ (i+1) + " son: "+ vecDias[i]);
            for (j=0 ; j<8 ; j++){
                System.out.print("''Turno "+ (j) +"''");
                System.out.println("Nombre: "+ matriz[i][j].getNombre());
            }
        }
    
        int k;
        
            System.out.println("La Cantidad de inscriptos al casting el dia "+ (dimlD+1) + " son: "+ vecDias[dimlD]);        
        for (k=0 ; k<dimlT ; k++){  //for para el dia incompleto y para no imprimir null, porque salgo del for anterior con el ultimo dia
            System.out.println("''Turno "+ (k) + "''");
            System.out.println("Nombre: "+ matriz[dimlD][k].getNombre());
            
        }  
        
    }
}

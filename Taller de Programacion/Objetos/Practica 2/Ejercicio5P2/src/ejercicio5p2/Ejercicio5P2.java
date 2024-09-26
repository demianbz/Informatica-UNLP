/* 5- Se dispone de la clase Partido (en la carpeta tema2). Un objeto partido representa un
encuentro entre dos equipos (local y visitante). Un objeto partido puede crearse sin
valores iniciales o enviando en el mensaje de creación el nombre del equipo local, el
nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). Un objeto
partido sabe responder a los siguientes mensajes:

    getLocal() retorna el nombre (String) del equipo local
    getVisitante() retorna el nombre (String) del equipo visitante
    getGolesLocal() retorna la cantidad de goles (int) del equipo local
    getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
    setLocal(X) modifica el nombre del equipo local al “String” X
    setVisitante(X) modifica el nombre del equipo visitante al “String” X
    setGolesLocal(X) modifica la cantidad de goles del equipo local al “int” X
    setGolesVisitante(X) modifica la cantidad de goles del equipo visitante al “int” X
    hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
    getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna
    un String vacío).
    hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate

Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:

- Para cada partido, armar e informar una representación String del estilo:
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
- Calcular e informar la cantidad de partidos que ganó River.
- Calcular e informar el total de goles que realizó Boca jugando de local */

package ejercicio5p2;
    //import PaqueteLectura.Lector;
    import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author DEMIA
 */

public class Ejercicio5P2 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        String [] equipos = {"River","Boca","Independiente","Racing","Estudiantes","Gimnasia","Huracan","San Lorenzo","Rosario","Newells","ZZZ"};
        
        
        Partido [] vector = new Partido [20];
        
        //el nombre del equipo local, el nombre del visitante, la cantidad de goles del local y del visitante (en ese orden).
        
        String nomLoc , nomVis ; 
        int cantLoc , cantVis ;
        
        int dimL = 0;
        
        System.out.println("-----Partido "+ (dimL+1) +"-----");
        System.out.print("Ingrese el nombre del equipo Visitante: ");
        nomVis = equipos[GeneradorAleatorio.generarInt(11)];
        System.out.println(nomVis);
        while(!nomVis.equals("ZZZ") && (dimL<20)){
            
            System.out.print("Ingrese el nombre del equipo Local: ");
            nomLoc = equipos[GeneradorAleatorio.generarInt(11)];
            System.out.println(nomLoc);
            System.out.print("Ingrese la cantidad de goles del Local: ");
            cantLoc = GeneradorAleatorio.generarInt(7);
            System.out.println(cantLoc);
            System.out.print("Ingrese la cantidad de goles del Visitante: ");
            cantVis = GeneradorAleatorio.generarInt(7);
            System.out.println(cantVis);
            
            vector[dimL] = new Partido(nomLoc,nomVis,cantLoc,cantVis);
            
            dimL++;

            System.out.println("-----Partido "+ (dimL+1) +"-----");
            System.out.print("Ingrese el nombre del equipo Visitante: ");
            nomVis = equipos[GeneradorAleatorio.generarInt(11)];
            System.out.println(nomVis);
            
        }
        System.out.println("");
       // {EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
        int i;
        
        for(i=0 ; i<dimL ; i++){
            
            System.out.println(vector[i].getLocal() +" "+ vector[i].getGolesLocal() +"-"+ vector[i].getGolesVisitante() +" "+ vector[i].getVisitante());
            
        }
            
        int cantRiver=0 , cantBoca=0;
        
        
        for(i=0 ; i<dimL ; i++){
            
            if(vector[i].getLocal().equals("River")){
                if(vector[i].getGanador().equals("River"))
                    cantRiver++;
            } else {
                if(vector[i].getVisitante().equals("River")){
                    if(vector[i].getGanador().equals("River"))
                        cantRiver++;
                }
            }
            
            if(vector[i].getLocal().equals("Boca")){
                cantBoca=cantBoca+vector[i].getGolesLocal();
            }
            
        }
        
        System.out.println("");
        System.out.println("La cantidad de Partidos que gano River fueron: "+ cantRiver);
        System.out.println("");
        System.out.println("La cantidad de Goles que metio Boca de Local fueron: "+ cantBoca);
        System.out.println("");
        
        
    }
    
}

package parcial3;
import PaqueteLectura.GeneradorAleatorio;

public class Parcial3 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        String [] vectorNom = {"Demian","Camilo","Kamil","Leo","Dante","Lautaro"};
        String [] vectorEquipo = {"River","Boca","Independiente","Racing","Huracan","San Lorenzo"};
        Torneo torneo1 = new Torneo(4,4,"Liga Profesional Argentina");
        
        for(int i=0 ; i<4 ; i++){
            Goleador unGoleador = new Goleador(vectorNom[GeneradorAleatorio.generarInt(6)],vectorEquipo[GeneradorAleatorio.generarInt(6)],GeneradorAleatorio.generarInt(5));
            torneo1.agregarGoleador(i, unGoleador);
        }
        
        Goleador unGoleador = new Goleador(vectorNom[GeneradorAleatorio.generarInt(6)],vectorEquipo[GeneradorAleatorio.generarInt(6)],GeneradorAleatorio.generarInt(5));
        torneo1.agregarGoleador(3, unGoleador);
        unGoleador = new Goleador(vectorNom[GeneradorAleatorio.generarInt(6)],vectorEquipo[GeneradorAleatorio.generarInt(6)],GeneradorAleatorio.generarInt(5));
        torneo1.agregarGoleador(3, unGoleador);
        unGoleador = new Goleador(vectorNom[GeneradorAleatorio.generarInt(6)],vectorEquipo[GeneradorAleatorio.generarInt(6)],GeneradorAleatorio.generarInt(5));
        torneo1.agregarGoleador(2, unGoleador);
        unGoleador = new Goleador(vectorNom[GeneradorAleatorio.generarInt(6)],vectorEquipo[GeneradorAleatorio.generarInt(6)],GeneradorAleatorio.generarInt(5));
        torneo1.agregarGoleador(1, unGoleador);
        
        System.out.println(torneo1.toString());
        
        System.out.println("Cantidad de Goles Registrados en el Torneo: "+ torneo1.obtenerCantidadGoles());
        
        System.out.println("El goleador que efectuo menos goles en la Fecha 4: "+ torneo1.obtenerPeorGoleador(4-1).toString());
        
    }
    
}

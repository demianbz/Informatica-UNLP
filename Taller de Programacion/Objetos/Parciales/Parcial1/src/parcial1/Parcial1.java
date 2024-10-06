package parcial1;
import PaqueteLectura.GeneradorAleatorio;

public class Parcial1 {

    public static void main(String[] args) {
        Estacion estacion1 = new Estacion("La Plata 1 y 69",78.5,3);
        String [] VectorPagos = {"Debito","Credito","Efectivo"};
        
        for(int i=0 ; i<6 ; i++){
            Surtidor surtidor = new Surtidor(3);
            for(int j=0 ; j<6 ; j++)
                estacion1.generarVenta(j, GeneradorAleatorio.generarInt(600) , GeneradorAleatorio.generarInt(10) , VectorPagos[GeneradorAleatorio.generarInt(3)]);
        }
        
        System.out.println(estacion1.toString());
        
        estacion1.ponerFueraServicio(10);
        System.out.println(estacion1.toString());
        
        System.out.print("Venta con mayor monto abonado en toda la estacion: ");
        System.out.println(estacion1.obtenerVentaMax());
    }
    
}

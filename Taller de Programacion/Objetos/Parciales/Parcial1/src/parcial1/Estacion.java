
package parcial1;

public class Estacion {
    private String direccion;
    private double precioxm3;
    private Surtidor [] surtidor;
    private int maxVentas;
    
    public Estacion (String unaDireccion , double unPrecioxm3 , int maxV){
        direccion = unaDireccion;
        precioxm3 = unPrecioxm3; 
        surtidor = new Surtidor [6];
        maxVentas = maxV;
        for(int i=0 ; i<6 ; i++)    //En cada posicion del vector pongo un surtidor
            surtidor[i] = new Surtidor(maxV);
    }

    
    public void generarVenta (int n , int unDni , int cantm3 , String pago ){
        double monto = cantm3*precioxm3;    //el monto es la cantidad de m3 por el precio por m3
        Venta Vent = new Venta(unDni,cantm3,monto,pago);
        surtidor[n].agregarVenta(Vent);
    }
    
    public void ponerFueraServicio(int X){
        for(int i=0 ; i<6 ; i++){
            surtidor[i].calcular(X);
        }
    }    
    
    public Venta obtenerVentaMax(){
        Venta ventaMax = new Venta(0,0,0,"");
        for(int i=0 ; i<6 ; i++){
            ventaMax = surtidor[i].obtenerMax(ventaMax);
        }
        return ventaMax;
    }
    
    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public double getPrecioxm3() {
        return precioxm3;
    }

    public void setPrecioxm3(double precioxm3) {
        this.precioxm3 = precioxm3;
    }
    
    @Override
    public String toString(){
        String aux;
        aux = "Estacion de Servicio: Direccion "+ getDireccion() +" Precio x m3 $"+ getPrecioxm3() +"\n";
        for(int i=0 ; i<6 ; i++){
            aux = aux +"Surtidor "+ (i+1) +":" + surtidor[i].toString() +"\n"; 

        }
        return aux;
    }
    
    
}

package parcial1;

public class Venta {
    private int dni;
    private int cantm3;
    private double monto;
    private String medioDePago; 

    public Venta (int unDni , int unaCantm3 , double unMonto , String unMedioDePago){
        dni = unDni;
        cantm3 = unaCantm3;
        monto = unMonto;
        medioDePago = unMedioDePago;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getCantm3() {
        return cantm3;
    }

    public void setCantm3(int cantm3) {
        this.cantm3 = cantm3;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMedioDePago() {
        return medioDePago;
    }

    public void setMedioDePago(String medioDePago) {
        this.medioDePago = medioDePago;
    }
    
    @Override
    public String toString(){
        String aux;
        aux = "Dni: "+ getDni() +" Cantidad de m3: "+ getCantm3() +" Monto Abonado: $"+getMonto() +" "; 
        return aux;
    }


    
    
}

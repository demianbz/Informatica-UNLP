package parcial1;

public class Surtidor {
    private boolean fueraServicio;
    private Venta [] venta;
    private int cantVenta;
    private int cantVentaMax;
    
    
    public Surtidor (int cantVentas){
        fueraServicio = false;
        cantVentaMax = cantVentas;
        venta = new Venta [cantVentas];
        cantVenta=0;
    }


    
    public void agregarVenta (Venta unaVenta){
        if(cantVenta<cantVentaMax){
            this.venta[cantVenta] = unaVenta;
            cantVenta++;
        }
    }
    
    public void calcular(int X){
        int total=0;
        for(int i=0 ; i<cantVenta ; i++){
            total = total + venta[i].getCantm3();
        }
        if(total<X)
            setFueraServicio(true);
    }
    
    public Venta obtenerMax(Venta ventaMax){
        double montoMax = -1;
        Venta ventaAux = new Venta(0,0,0,"");
        for(int i=0 ; i<cantVenta ; i++){
            if(venta[i].getMonto()>montoMax){
                montoMax = venta[i].getMonto();
                ventaAux = venta[i];
            }
        }
        return ventaAux;
    }

    public boolean isFueraServicio() {
        return fueraServicio;
    }

    public void setFueraServicio(boolean fueraServicio) {
        this.fueraServicio = fueraServicio;
    }
    
    @Override
    public String toString(){
        String aux ;
        if(isFueraServicio() == true)
            aux = "Fuera de Servicio ";
        else
            aux = "En servicio ";
        aux = aux +"Ventas: ";
        for (int i=0 ; i<cantVenta ; i++){
            aux = aux + venta[i].toString() ;
        }
        return aux;
    }




}

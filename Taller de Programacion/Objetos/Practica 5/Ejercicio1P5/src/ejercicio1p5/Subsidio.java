package ejercicio1p5;

public class Subsidio {
    private double monto;
    private boolean otorgado;
    
    public Subsidio (double unMonto){
        monto = unMonto;
        otorgado = false;
        
    }
    

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public boolean isOtorgado() {
        return otorgado;
    }

    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }
    
    
    
    
}

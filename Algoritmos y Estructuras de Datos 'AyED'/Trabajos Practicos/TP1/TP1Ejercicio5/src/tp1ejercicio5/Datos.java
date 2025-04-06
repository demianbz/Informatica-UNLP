package tp1ejercicio5;

public class Datos {
    private int min;
    private int max;
    private double prom;
    
    public Datos(){
        
    }
    
    public Datos (int unMin , int unMax , double unProm){
        min = unMin;
        max = unMax;
        prom = unProm;
    }

    public int getMin() {
        return min;
    }

    public void setMin(int min) {
        this.min = min;
    }

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public double getProm() {
        return prom;
    }

    public void setProm(double prom) {
        this.prom = prom;
    }
    
    @Override
    public String toString(){
        return "Minimo "+ this.getMin() +" Maximo "+ this.getMax() +" Promedio "+ this.getProm();
    }
    
}

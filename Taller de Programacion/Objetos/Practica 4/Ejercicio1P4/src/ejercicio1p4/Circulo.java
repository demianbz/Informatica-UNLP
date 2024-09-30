package ejercicio1p4;

public class Circulo extends Figura{
        private double radio;


    public Circulo(String unColorRelleno, String unColorLinea, double unRadio) {
        super(unColorRelleno, unColorLinea);
        setRadio(unRadio);
    }

        
        
    public double getRadio() {
        return radio;
    }

    public void setRadio(double unRadio) {
        radio = unRadio;
    }

    public double calcularPerimetro (){
        return 2*getRadio()*Math.PI;
    }    
    
    public double calcularArea (){
        return Math.PI*(getRadio()*getRadio());
    }
    
    @Override
    public String toString(){
        String aux;
        aux = super.toString() +" Radio: "+ getRadio();
        return aux;
    }
        
    
}

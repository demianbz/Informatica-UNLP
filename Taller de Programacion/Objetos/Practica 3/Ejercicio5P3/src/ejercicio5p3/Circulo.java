package ejercicio5p3;

public class Circulo {
        private double radio;
        private String relleno;
        private String linea;

        
        
    public double getRadio() {
        return radio;
    }

    public void setRadio(double unRadio) {
        radio = unRadio;
    }

    public String getRelleno() {
        return relleno;
    }

    public void setRelleno(String unRelleno) {
        relleno = unRelleno;
    }

    public String getLinea() {
        return linea;
    }

    public void setLinea(String unaLinea) {
        linea = unaLinea;
    }
        
    public double calcularPerimetro (){
        return 2*radio*Math.PI;
    }    
    
    public double calcularArea (){
        return Math.PI*(radio*radio);
    }
        
    
}

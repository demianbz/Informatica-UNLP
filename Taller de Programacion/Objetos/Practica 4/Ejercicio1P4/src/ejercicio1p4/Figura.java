package ejercicio1p4;

public abstract class Figura {
    
    private String colorRelleno;
    private String colorLinea;
    
    public Figura (String unColorRelleno , String unColorLinea){
        setColorRelleno(unColorRelleno);
        setColorLinea(unColorLinea);
    }
    

    public String toString (){
        String aux;
        aux = "Area: "+ this.calcularArea() +
                " CR: "+ getColorRelleno() +
                " CL: "+ getColorLinea();
        return aux;
    }
    
    public void setColorRelleno (String unColor){
        colorRelleno = unColor;
    }
    
    public String getColorRelleno (){
        return colorRelleno;
    }
    
    public void setColorLinea (String unColor){
        colorLinea = unColor;
    }
    
    public String getColorLinea (){
        return colorLinea;
    }
    
    public abstract double calcularArea();
    public abstract double calcularPerimetro();
    
    public void despintar(){
        this.setColorLinea("Negro");
        this.setColorRelleno("Blanco");
    }
}

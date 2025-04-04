package ejercicio1p4;

public class Triangulo extends Figura {
    private double lado1;
    private double lado2;
    private double lado3;
    
 
    public Triangulo(String unColorRelleno, String unColorLinea, double unLado1 , double unLado2 , double unLado3){
       super(unColorRelleno,unColorLinea);
       setLado1(unLado1);
       setLado2(unLado2);
       setLado3(unLado3);       
    }
    
    
    public double getLado1() {
        return lado1;
    }
    
    public double getLado2() {
        return lado2;
    }
    
    public double getLado3() {
        return lado3;
    }
    
    
    public void setLado1(double unLado1){
        lado1 = unLado1;
    }
    
    public void setLado2(double unLado2){
        lado2 = unLado2;
    }
    
    public void setLado3(double unLado3){
        lado3 = unLado3;
    }
    
    public double calcularPerimetro(){
        return getLado1()+getLado2()+getLado3();
    }
    
    public double calcularArea(){
        double aux , s , raiz;
        s = (getLado1() + getLado2() + getLado3()) / 2 ;
        raiz = s * (s-getLado1()) * (s-getLado2()) * (s-getLado3());
        aux = Math.sqrt(raiz);
        return aux;
    }
    
    @Override
    public String toString(){
        String aux;
        aux = super.toString() + " Lado1: "+ getLado1() + " Lado2: "+ getLado2() + " Lado3: "+ getLado3();
        return aux;
        
    }

    
}

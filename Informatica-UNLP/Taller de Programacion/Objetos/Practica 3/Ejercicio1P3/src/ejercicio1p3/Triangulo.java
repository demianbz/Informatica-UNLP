/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio1p3;

/**
 *
 * @author DEMIA
 */
public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String relleno;
    private String linea;
    
    public Triangulo(){
        
    }
    
    public Triangulo(double unLado1 , double unLado2 , double unLado3){
        lado1 = unLado1;
        lado2 = unLado2;
        lado3 = unLado3;

    }
    
    
    public Triangulo(double unLado1 , double unLado2 , double unLado3 , String unRelleno , String unaLinea){
        lado1 = unLado1;
        lado2 = unLado2;
        lado3 = unLado3;
        relleno = unRelleno; 
        linea = unaLinea;
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
    
    public String getRelleno() {
        return relleno;
    }
    
    public String getLinea() {
        return linea;
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
    
    public void setRelleno(String unRelleno){
        relleno = unRelleno;
    }
    
    public void setLinea(String unaLinea){
        linea = unaLinea;
    }

    public double calcularPerimetro(double unLado1 , double unLado2 , double unLado3){
        double aux;
        aux = unLado1 + unLado2 + unLado3;
        return aux;
    }
    
    public double calcularArea(double unLado1 , double unLado2 , double unLado3){
        double aux , s , raiz;
        s = (unLado1 + unLado2 + unLado3) / 2 ;
        raiz = s * (s-unLado1) * (s-unLado2) * (s-unLado3);
        aux = Math.sqrt(raiz);
        return aux;
    }


    
}

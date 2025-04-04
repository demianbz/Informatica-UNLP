/*
Clase Libro a la cual se agregaron constructores. 
 */
package ejercicio3p3;

/**
 *
 * @author vsanz
 */
public class Libro {
   private String titulo;
   private String primerAutor; 
   private String editorial;
   private int añoEdicion;
   private int ISBN; 
   private double precio; 
     
    
    public Libro(  String unTitulo,  String unaEditorial, 
    int unAñoEdicion,  String unPrimerAutor, int unISBN, double unPrecio){
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= unAñoEdicion;
         primerAutor = unPrimerAutor;
         ISBN =  unISBN;
         precio = unPrecio;
    }
    
    public Libro(  String unTitulo, String unPrimerAutor, int unAñoEdicion , int unISBN){
         titulo = unTitulo;
         añoEdicion = unAñoEdicion; 
         primerAutor = unPrimerAutor;
         ISBN =  unISBN;
    }
    
    public Libro(){
   
    }
        
    public String getTitulo(){
        return titulo;
    }
  
    public String getEditorial(){
        return editorial;
    }
    public int getAñoEdicion(){
        return añoEdicion;
    }
  
    public String getPrimerAutor(){
        return primerAutor;
    } 
    public int getISBN(){
        return ISBN;
    } 
    public double getPrecio(){
        return precio;
    }
   
    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
   
    public void setEditorial(String unaEditorial){
         editorial = unaEditorial;
    }
    public void setAñoEdicion(int unAño){
         añoEdicion = unAño;
    }
   
    public void setPrimerAutor(String unPrimerAutor){
         primerAutor=unPrimerAutor;
    } 
    public void setISBN(int unISBN){
         ISBN=unISBN;
    } 
    public void setPrecio(double unPrecio){
         precio=unPrecio;
    }
   
    
   @Override
    public String toString(){
        String aux;
        aux= titulo + " por " + primerAutor + " - " + añoEdicion + " - " + " ISBN: " + ISBN;
       return ( aux);
    }
        
}

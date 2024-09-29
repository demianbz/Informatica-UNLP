package ejercicio3p3;

public class Estante {
    
    private int cantLibros;   
    private Libro [] estante;
    private int max = 20;
   
    //Implemente un constructor que permita iniciar el estante sin libros
    
    public Estante(){
        estante = new Libro [20];
        cantLibros = 0;
    }
    
    //Punto C crear estante de como maximo N libros
    public Estante(int N){
        estante = new Libro [N];
        cantLibros = 0;
        }
    
    
    //(i) devolver la cantidad de libros que almacenados
    
    public int getCantLibros(){
        return cantLibros;
    }
    
    //(ii) devolver si el estante está lleno
    
    public boolean estanteLLeno(){
        boolean aux;
        aux = cantLibros == 20;
        return aux;  
    }
    
    //(iii) agregar un libro al estante 
    
    public void AgregarLibro (Libro unLibro){
        estante[cantLibros] = unLibro;
        cantLibros++;
    }
    
    //(iv) devolver el libro con un título particular que se recibe
    
    public Libro buscarLibro  (String unTitulo){
        int i=0;
        Libro aux = null;   //Si no existe el libro con ese titulo retorna null;
        while (i<cantLibros && !estante[i].getTitulo().equals(unTitulo)){   //recorro hasta encontrar el titulo o hasta llegar al final
            i++;
        }
        
        if(i<cantLibros)
            aux = estante[i];
        
            
        return aux;
    }

    
    
    
}
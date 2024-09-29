/* 3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para:
(i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno
(iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.
B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
busque e informe el autor del libro “Mujercitas”.
C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que
almacenen como máximo N libros? ¿Cómo instanciaría el estante?.
 */
package ejercicio3p3;

    import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio3P3 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        String [] vectorTitulos =  {"Mujercitas","El Principito","Demian","100 años de Soledad","El eternauta","Don quijote de la mancha","Curso de Java","El rey Leon"};
        
        Estante unEstante = new Estante();
        
        for (int i=0 ; i<8 ; i++){
        
            System.out.print("Ingrese el Titulo: ");
            String titulo = vectorTitulos[GeneradorAleatorio.generarInt(8)];
            System.out.println(titulo);
            System.out.print("Ingrese el Autor: ");
            String autor = GeneradorAleatorio.generarString(5);
            System.out.println(autor);
            System.out.print("Ingrese el año de edicion: ");
            int año = GeneradorAleatorio.generarInt(24)+2000;
            System.out.println(año);
            System.out.print("Ingrese el ISBN: ");
            int isbn = GeneradorAleatorio.generarInt(2000)+1000;
            System.out.println(isbn);
            Libro libro = new Libro(titulo,autor,año,isbn);
            
            
            unEstante.AgregarLibro(libro);
        
        }
        
        //busque e informe el autor del libro “Mujercitas”.
        Libro aux;
        aux = unEstante.buscarLibro("Mujercitas");
        
        
        if(aux != null)
            System.out.println("Autor del Libro ''Mujercitas'': "+ aux.getPrimerAutor());
        else
            System.out.println("El libro titulado ''Mujercitas'' no esta en el Estante");
        
        //Punto C uso un nuevo constructor pasandole como parametro el N que seria la dimF
        
        Estante unEstante2 = new Estante(15);   //le paso la dimF por ejemplo 15
        
        
    }
    
}

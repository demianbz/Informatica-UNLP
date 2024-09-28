/* 2-A- Modifique la clase Libro.java (carpeta tema3) para ahora considerar que el primer
autor es un objeto instancia de la clase Autor.
Implemente la clase Autor, sabiendo que se caracterizan por nombre, biografía y origen
y que deben permitir devolver/modificar el valor de sus atributos y devolver una
representación String formada por nombre, biografía y origen.
Luego realice las modificaciones necesarias en la clase Libro.
B- Modifique el programa Demo01Constructores (carpeta tema3) para instanciar los libros
con su autor, considerando las modificaciones realizadas. Luego, a partir de uno de los
libros instanciados, obtenga e imprima la representación del autor de ese libro. */
package ejercicio2p3;

public class Ejercicio2P3 {
    public static void main(String[] args) {
       //Autor a = new Autor();
       
       Autor autor1 = new Autor("Herbert Schildt","Un autor","Suecia");
       
       Libro libro1= new  Libro( "Java: A Beginner's Guide",  "Mcgraw-Hill" , 2014, autor1 , "978-0071809252" , 21.72);
       
       Autor autor2 = new Autor("John Horton","Un Autor 2","Suiza");
       
       Libro libro2= new Libro("Learning Java by Building Android Games",  "CreateSpace Independent Publishing", autor2 , "978-1512108347");
       
       System.out.println("Autor 1");
       System.out.println(libro1.getAutor().toString());
       
       System.out.println("Autor 2");
       System.out.println(libro2.getAutor().toString());
    }
}

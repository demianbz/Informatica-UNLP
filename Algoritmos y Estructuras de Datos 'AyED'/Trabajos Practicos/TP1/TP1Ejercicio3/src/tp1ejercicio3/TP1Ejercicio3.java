/*
3. Creación de instancias mediante el uso del operador new 
a. Cree una clase llamada Estudiante con los atributos especificados abajo y sus 
correspondientes métodos getters y setters (haga uso de las facilidades que brinda 
eclipse) 
● nombre 
● apellido 
● comision 
● email 
● direccion 
b. Cree una clase llamada Profesor con los atributos especificados abajo y sus 
correspondientes métodos getters y setters (haga uso de las facilidades que brinda 
eclipse) 
● nombre 
● apellido 
● email 
● catedra 
● facultad 
c. Agregue un método de instancia llamado tusDatos() en la clase Estudiante y en la 
clase Profesor, que retorne un String con los datos de los atributos de las mismas. 
Para acceder a los valores de los atributos utilice los getters previamente 
definidos. 
d. Escriba una clase llamada Test con el método main, el cual cree un arreglo con 2 
objetos Estudiante, otro arreglo con 3 objetos Profesor, y luego recorra ambos 
arreglos imprimiendo los valores obtenidos mediante el método tusDatos(). Recuerde 
asignar los valores de los atributos de los objetos Estudiante y Profesor invocando los 
respectivos métodos setters. 
e. Agregue dos breakpoints, uno en la línea donde itera sobre los estudiantes y otro en la 
línea donde itera sobre los profesores 
f. 
Ejecute la clase Test en modo debug y avance paso a paso visualizando si el 
estudiante o el profesor recuperado es lo esperado.
 */
package tp1ejercicio3;

public class TP1Ejercicio3 {

    public static void main(String[] args) {
        Estudiante [] est = new Estudiante[2];
        Profesor [] pro = new Profesor[3];
        
        //Estudiantes
        est[0] = new Estudiante("Juan","Lopez",4,"JP@gmail.com","La Plata");
        est[1] = new Estudiante("Pepe","Perez",3,"PP@gmail.com","City Bell");        
        
        //Profesores
        pro[0] = new Profesor("Gonza","Ramirez",4,"GR@gmail.com","UNLP");
        pro[1] = new Profesor("Camilo","Reyes",2,"CR@gmail.com","UNLP");       
        pro[2] = new Profesor("Esteban","Borra",1,"EB@gmail.com","UNLP");            
        
        
        System.out.println("Estudiantes");        
        for(int i=0 ; i<2 ; i++)
            System.out.println(est[i].tusDatos());
        
        System.out.println("");
        
        System.out.println("Profesores");
        for(int j=0 ; j<3 ; j++)
            System.out.println(pro[j].tusDatos());
    }
    
}

/*
7. Uso de las estructuras de listas provistas por la API de Java. Para resolver este punto cree el 
paquete tp1.ejercicio7 
a. Escriba una clase llamada TestArrayList cuyo método main recibe una secuencia de 
números, los agrega a una lista de tipo ArrayList, y luego de haber agregado todos los 
números a la lista, imprime el contenido de la misma iterando sobre cada elemento. 
b. Si en lugar de usar un ArrayList en el inciso anterior hubiera usado un LinkedList ¿Qué 
diferencia encuentra respecto de la implementación? Justifique 
    La diferencia esta en el acceso, en la ArrayList el acceso es directo mientras que en la LinkedList el acceso
    es mas ineficiente ya que se debe recorrer de forma secuncial.
c. ¿Existen otras alternativas para recorrer los elementos de la lista del punto 7a.? 
    Si, el for each.
d. Escriba un método que realice las siguientes acciones: 
    ■ cree una lista que contenga 3 estudiantes 
    ■ genere una nueva lista que sea una copia de la lista del inciso i 
    ■ imprima el contenido de la lista original y el contenido de la nueva lista 
    ■ modifique algún dato de los estudiantes 
    ■ vuelva a imprimir el contenido de la lista original y el contenido de la nueva lista. 
¿Qué conclusiones obtiene a partir de lo realizado? 
Cuando modifico un dato de los estudiantes se modifica en todas las listas, porque se copian las direcciones a los objetos
y lo que se modifico fue el objeto (Estudiante)
    ■ ¿Cuántas formas de copiar una lista existen? ¿Qué diferencias existen entre ellas? 
    Otra forma de copiar una lista es con el metodo addAll()
e. A la lista del punto 7d, agregue un nuevo estudiante. Antes de agregar, verifique que el 
estudiante no estaba incluido en la lista.
f. 
Escriba un método que devuelva verdadero o falso si la secuencia almacenada en la 
lista es o no capicúa: 
public boolean esCapicua(ArrayList<Integer> lista) 
Ejemplo:    
● El método devuelve verdadero si la secuencia ingresada es: 2 5 2 
● El método devuelve falso si la secuencia ingresada es: 4 5 6 3 4 
g. Considere que se aplica la siguiente función de forma recursiva. A partir de un número 
n positivo se obtiene una sucesión que termina en 1: 
Por ejemplo, para n= 6, se obtiene la siguiente sucesión:  
f(6) = 6/2 = 3 
f(3) = 3*3 + 1 = 10 
f(10) = 10/2 = 5 
…. 
Es decir, la sucesión 6, 3, 10, 5, 16, 8, 4, 2, 1. Para cualquier n con el que se arranque 
siempre se llegará al 1. 
■ Escriba un programa recursivo que, a partir de un número n, devuelva una lista 
con cada miembro de la sucesión.  
public class EjercicioSucesion { 
public List<Integer> calcularSucesion (int n) { 
//código 
} 
} 
h. Implemente un método recursivo que invierta el orden de los elementos en un ArrayList. 
    public void invertirArrayList(ArrayList<Integer> lista) 
i.Implemente un método recursivo que calcule la suma de los elementos en un  LinkedList.  
    public int sumarLinkedList(LinkedList<Integer> lista)  
j.Implemente el método “combinarOrdenado” que reciba 2 listas de números ordenados 
y devuelva una nueva lista también ordenada conteniendo los elementos de las 2 listas.  
    public ArrayList<Integer> combinarOrdenado(ArrayList<Integer> lista1,  ArrayList<Integer> lista2);
 */
package tp1ejercicio7;

import java.util.*;


public class TP1Ejercicio7 {
    
    public static void incisoD(){
        List<Estudiante> listEst = new ArrayList<>();
        Estudiante est1 = new Estudiante("Juan","Lopez",4,"JP@gmail.com","La Plata");
        Estudiante est2 = new Estudiante("Pepe","Perez",3,"PP@gmail.com","City Bell");
        Estudiante est3 = new Estudiante("Pablo","Sanchez",2,"PS@gmail.com","Caba");
        listEst.add(est1);
        listEst.add(est2);
        listEst.add(est3);
        
        
        //List<Estudiante> listEst2 = listEst;  //esto no es una copia es asignar una referencia, por lo que apuntan a la misma lista en memoria
        
        List<Estudiante> listEstCopia = new ArrayList<>(listEst);   //Creo la copia con el constructor de la lista
                                                                    //De esta forma creo una copia independiente de la original
        System.out.println("Lista Original");
        for(Estudiante est: listEst)
            System.out.println(est.toString());
        
        System.out.println("Lista Copia");
        for(Estudiante est: listEstCopia)
            System.out.println(est.toString());
        
        est1.setNombre("CAMBIO"); 
        System.out.println("");
        
        System.out.println("Lista Original despues del cambio");
        for(Estudiante est: listEst)
            System.out.println(est.toString());
        
        System.out.println("Lista Copia despues del cambio");
        for(Estudiante est: listEstCopia)
            System.out.println(est.toString());
        
        //Otra forma de copiar una lista es con el metodo addAll()
        //Lo que hace es crear una nueva LinkedList y agrega todos los elementos del original usando este metodo.
        //List <Estudiante> listEstCopia = new ArrayList <Estudiante>();
        //lisEstCopia.addAll(lisEst);
        
        System.out.println("");
        System.out.println("----Inciso E----");
        
        Estudiante est4 = new Estudiante("Danilo","Gomez",1,"DG@gmail.com","La Plata");
        if(!listEst.contains(est4)){    //Si la lista no contiene este estudiante entonces agrego
            listEst.add(est4); 
            System.out.println("Se pudo agregar");
        }else
            System.out.println("No se pudo agregar");
        
    }
    
    
    public static boolean esCapicua (ArrayList<Integer> listNum){
        boolean es = true;
        if(!listNum.isEmpty()) {    //si la lista no esta vacia
            int pri = 0;            //la lista arranca de 0
            int ult = listNum.size() - 1;   //hasta n-1
            while((pri < ult) && es) {  //mientras no me pase y sigan siendo iguales
                if (listNum.get(pri).equals(listNum.get(ult))) {    //voy preguntando el primero con el ultimo, aver si son iguales
                    pri = pri +1;
                    ult = ult -1;
                }
                else es = false;
            }
        }
        return es;
    }
    
    

    public static void main(String[] args) {
        ArrayList<Integer> listNum = new ArrayList<>();
        
        if(args.length>0){
            for(int i=0 ; i<args.length ; i++)
                listNum.add(Integer.parseInt(args[i]));         
        }
        System.out.println("----Inciso A----");
        System.out.println(listNum);
        
        System.out.println("");
        
        System.out.println("----Inciso C (For Each)----");
        for(int num:listNum)
            System.out.print(num +" ");
        System.out.println("");
        
        System.out.println("");
        System.out.println("----Inciso D----");
        TP1Ejercicio7.incisoD();
        System.out.println("");
       
        
        System.out.println("----Inciso F----");
        boolean capicua = TP1Ejercicio7.esCapicua(listNum);
        if(capicua)
            System.out.println("La secuencia es capicua");
        else
            System.out.println("La secuencia no es capicua");

        
    }
    
}

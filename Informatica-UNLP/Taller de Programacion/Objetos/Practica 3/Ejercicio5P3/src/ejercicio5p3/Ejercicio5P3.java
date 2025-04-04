/* 5-A- Definir una clase para representar círculos. Los círculos se caracterizan por su radio
(double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
B- Realizar un programa que instancie un círculo, le cargue información leída de teclado e
informe en consola el perímetro y el área.
NOTA: la constante PI es Math.P */

package ejercicio5p3;

    import PaqueteLectura.Lector;

public class Ejercicio5P3 {

    public static void main(String[] args) {
        Circulo circulo1 = new Circulo();
        
        System.out.print("Ingrese el radio del Circulo: ");
        double radio = Lector.leerDouble();
        circulo1.setRadio(radio);
        
        System.out.println("Perimetro: "+ circulo1.calcularPerimetro() +" Area: "+ circulo1.calcularArea());
    }
    
}

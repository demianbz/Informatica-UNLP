/* 1-A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área.

NOTA: Calcular el área con la fórmula Á𝑟𝑒𝑎 = 𝑠(𝑠 − 𝑎)(𝑠 − 𝑏)(𝑠 − 𝑐) , donde a, b y c
son los lados y 𝑠 = . La función raíz cuadrada es Math.sqrt(#) */
package ejercicio1p3;

    import PaqueteLectura.Lector;

/**
 *
 * @author DEMIA
 */
public class Ejercicio1P3 {
    public static void main(String[] args) {
           
        System.out.print("Ingrese el Lado 1: ");
        double lado1 = Lector.leerDouble();
        System.out.print("Ingrese el Lado 2: ");
        double lado2 = Lector.leerDouble();
        System.out.print("Ingrese el Lado 3: ");
        double lado3 = Lector.leerDouble();
        
        Triangulo tri = new Triangulo(lado1,lado2,lado3);
        
        System.out.println("Perimetro del Triangulo: "+ tri.calcularPerimetro(lado1, lado2, lado3));
        System.out.println("Area del Triangulo: "+ tri.calcularArea(lado1, lado2, lado3));
        

    }
    
}

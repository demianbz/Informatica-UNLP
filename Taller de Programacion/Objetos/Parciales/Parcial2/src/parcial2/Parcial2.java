/*
Queremos representar compras realizadas en un comercio. De una compra se conoce fecha(dia mes año) y los productos comprados (a lo sumo N). 
Asi mismo, el comercio permite hacer compras al por mayor que tienen ademas los datos del consumidor final (CUIL y nombre). Los productos se 
carecterizan por tener codigo, descripcion, precio unitario y cantidad de unidades.

1-Genere las clases necesarias. Provea constructores para iniciar los objetos de su modelo a partir de la informacion necesaria. En particular
las compras deben iniciar con un numero, una fecha y sin productos (con capacidad de guardar a lo sumo N productos); y ademas para las compras
al por mayor , con el consumidor final.

2- Implemente los metodos necesarios en las clases que corresponda para :

A- Agregar un producto a la compra. Tener en cuenta que en las compras al por mayor el producto se agrega solo si supera las 6 unidades
B- Obtener el precio final de la compra. Tener en cuenta que: el precio final es la suma de los precios finales de los productos agregados
(El precio final de un producto es precio_unitario*cantidad_unidades). Las compras al por mayor descuentan el 21% (correspondiente al IVA) al 
precio final de la compra.
C- Obtener un resumen de compra, que concatene: numero, fecha (dia/mes/año), el codigo, descripcion y precio final de cada producto agregado
y el precio final de la compra.
D- Saber si la compra es abonable en cuotas. Esto es posible cuando su precio final supera los 100.000$.

3- Realice un programa que instancie una compra y una compra al por mayor, con los datos necesarios y para un maximo de 10 productos. Cargue
algunos productos a cada compra. Al finalizar, muestre el resumen de cada compra e imprima si son abonables en cuotas.
 */
package parcial2;
import PaqueteLectura.GeneradorAleatorio;

public class Parcial2 {

    public static void main(String[] args) {
        Fecha fecha1 = new Fecha(8,10,2024);    
        Compra compra1 = new Compra(1,10,fecha1);

        ConsumidorFinal consumidor = new ConsumidorFinal(4578,"Demian");
        Fecha fecha2 = new Fecha(10,10,2024);
        CompraxMayor compra2 = new CompraxMayor(2,10,fecha2,consumidor);

        String [] vectorDesc ={"Leche","Harina","Huevo","Queso","Verdura","Fruta","Manteca"}; 

        for(int i=0 ; i<3 ; i++){
            Producto prod = new Producto(GeneradorAleatorio.generarInt(400),vectorDesc[GeneradorAleatorio.generarInt(7)],GeneradorAleatorio.generarDouble(1000),GeneradorAleatorio.generarInt(6));
            compra1.agregarProducto(prod);
            Producto prod2 = new Producto(GeneradorAleatorio.generarInt(400),vectorDesc[GeneradorAleatorio.generarInt(7)],GeneradorAleatorio.generarDouble(1000),GeneradorAleatorio.generarInt(6)+7);
            compra2.agregarProducto(prod2);
        }
        System.out.println("--------Compra 1--------");
        System.out.println(compra1.obtenerResumen());
        System.out.println(compra1.abonableEnCuotas(compra1.obtenerPrecioFinal()));
        
        System.out.println("");
        
        System.out.println("--------Compra 2--------");    
        System.out.println(compra2.obtenerResumen());
        System.out.println(compra2.abonableEnCuotas(compra2.obtenerPrecioFinal()));
    }
    
}

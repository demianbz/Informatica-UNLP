package parcial2;

public class Compra {
    private Fecha fecha;
    private Producto [] vecProd;
    private int cantProd;
    private int maxProd;
    private int numero;
    
    public Compra (int unNumero ,int N , Fecha unaFecha){
        fecha = unaFecha;
        maxProd = N;
        vecProd = new Producto [N];
        cantProd = 0;
        numero = unNumero;
        for (int i=0 ; i<N ; i++)
            vecProd[i] = null;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }
    
    public void agregarProducto (Producto unProducto){
        if(cantProd < maxProd){       
            this.vecProd[this.cantProd] = unProducto;
            this.cantProd++;
        }
    }

    public double obtenerPrecioFinal (){
        double precioFinal = 0.0;
        for(int i=0 ; i<this.cantProd ; i++)
            precioFinal = precioFinal + vecProd[i].precioFinal();
        return precioFinal;
    }
    
    public String abonableEnCuotas (double unPrecioFinal){
        String aux;
        if(unPrecioFinal>100000)
            aux = "La compra es abonable en cuotas";
        else
            aux = "La compra no es abonable en cuotas";
        return aux;
    }
    
    public Fecha getUnaFecha() {
        return fecha;
    }

    public void setUnaFecha(Fecha unaFecha) {
        this.fecha = unaFecha;
    }
    
    public String obtenerResumen(){
        String aux;
        aux = "Numero de Compra "+ getNumero() + fecha.toString() +"\n";
        for(int i=0 ; i<this.cantProd ; i++){
            aux = aux + vecProd[i];
        }
        aux = aux +"Precio Final de la compra: $"+ obtenerPrecioFinal() ;
        return aux;
    }
    
    
}

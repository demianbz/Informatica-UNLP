package parcial2;

public class CompraxMayor extends Compra {
    private ConsumidorFinal consumidor;

    public CompraxMayor(int unNumero , int N , Fecha unaFecha , ConsumidorFinal unConsumidor) {
        super(unNumero, N, unaFecha);
        setConsumidor(unConsumidor);
    }
    
    @Override
    public void agregarProducto(Producto unProducto){
        if(unProducto.getCantUn()>6)
            super.agregarProducto(unProducto);
    }
    
    @Override
    public double obtenerPrecioFinal(){
        return super.obtenerPrecioFinal() * 0.79;
    }

    public ConsumidorFinal getConsumidor() {
        return consumidor;
    }

    public void setConsumidor(ConsumidorFinal unConsumidor) {
        this.consumidor = unConsumidor;
    }
    
}

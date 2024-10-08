package parcial2;

public class Producto {
    private int codigo;
    private String descripcion;
    private double precio;
    private int cantUn;

    public Producto (int unCodigo , String unaDescripcion , double unPrecio , int cant){
        codigo = unCodigo;
        descripcion = unaDescripcion;
        precio = unPrecio;
        cantUn = cant;
    }
    
    public double precioFinal(){
        return this.precio * this.cantUn;
    }
    
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getCantUn() {
        return cantUn;
    }

    public void setCantUn(int cantUn) {
        this.cantUn = cantUn;
    }
    
    @Override
    public String toString(){
        String aux;
        aux = "Codigo del Producto: "+ getCodigo() +" Descripcion: "+ getDescripcion() + " Precio Final: $"+ precioFinal() +"\n";
        return aux;
    }
    
    
}

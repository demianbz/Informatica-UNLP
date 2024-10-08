package parcial2;

public class Fecha {
    private int dia;
    private int mes;
    private int anio;
    
    public Fecha (int unDia , int unMes , int unAnio){
        dia = unDia;
        mes = unMes;
        anio = unAnio;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int unAnio) {
        this.anio = unAnio;
    }
    
    @Override
    public String toString(){
        String aux;
        aux = " Fecha: ("+ getDia() +"/"+ getMes() +"/"+ getAnio()  +")";
        return aux;
    }
    
}

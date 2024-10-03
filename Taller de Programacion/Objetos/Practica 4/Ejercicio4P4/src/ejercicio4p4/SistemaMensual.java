
package ejercicio4p4;

public class SistemaMensual extends Sistema{
    
    public String [] meses = {"Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"};
    
    public SistemaMensual(int CantidadAnios, int elAnio, Estacion unaEstacion) {
        super(CantidadAnios, elAnio, unaEstacion);
    }
    
    public String retornarPromMensual (){ // (el promedio del mes M se calcula con los datos de todos los años en ese mes).
        String aux = " ";
        double cant = 0 , promedio=0;
        for (int j=0 ; j<12 ; j++){
            cant=0;
            aux = "-"+ meses[j] +": ";
            for(int i=0 ; i<getCantAnios() ; i++ ){
                cant = cant + obtenerTemp(i+getAnioInicial(),j+1);
            }
            promedio = (cant/getCantAnios());
            aux = aux + promedio +" °C";
        }
        return aux;
    }
    
    public String toString(){
        String aux;
        aux = super.toString() + retornarPromMensual();
        return aux;
    }
    
}

package ejercicio4p4;

public class SistemaAnual extends Sistema{
    
    public SistemaAnual(int CantidadAnios , int elAnio , Estacion unaEstacion){
        super(CantidadAnios,elAnio,unaEstacion);
    }
    
    public String retornarPromAnual (){ //el promedio del año X se calcula con los datos mensuales de ese año
        String aux = " ";
        double cant = 0, promedio =0;
        for(int i=0 ; i<getCantAnios() ; i++){
            cant=0;
            aux = "-Anio "+ (i + getAnioInicial()) +": ";
            for(int j=0 ; j<12 ; j++){
                cant = cant + obtenerTemp(i+getAnioInicial(),j+1);
            }
            promedio = (cant/12);
            aux = aux + promedio +" °C \n";
        }
        return aux;
    }
    
    public String toString(){
        String aux;
        aux = super.toString() + retornarPromAnual();
        return aux;
    }
    
}

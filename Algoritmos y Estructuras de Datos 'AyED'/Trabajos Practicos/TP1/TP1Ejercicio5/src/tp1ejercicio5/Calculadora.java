
package tp1ejercicio5;

public class Calculadora {
    
    private static Datos D = new Datos();
    
    
    public static Datos IncisoA (int [] v){
        int max=0 ; int min=999 ; double total=0;
        for(int i=0 ; i<v.length ; i++){
            if(v[i]<min){
                min=v[i];
            }
            if(v[i]>max){
                max=v[i];
            }
            total = total + v[i];
        }
        Datos A = new Datos(min,max,total/v.length);
        return A;
    }

    public static void IncisoB (int [] v , Datos B){
        int max=0 ; int min=999 ; double total=0;
        for(int i=0 ; i<v.length ; i++){
            if(v[i]<min){
                min=v[i];
            }
            if(v[i]>max){
                max=v[i];
            }
            total = total + v[i];
        }
        B.setMax(max);
        B.setMin(min);
        B.setProm(total/v.length);
    }
    
        public static void IncisoC (int [] v){
        int max=0 ; int min=999 ; double total=0;
        for(int i=0 ; i<v.length ; i++){
            if(v[i]<min){
                min=v[i];
            }
            if(v[i]>max){
                max=v[i];
            }
            total = total + v[i];
        }
        D.setMax(max);
        D.setMin(min);
        D.setProm(total/v.length);
    }
    
    public static Datos obtenerD(){
        return D;
    }


        
}

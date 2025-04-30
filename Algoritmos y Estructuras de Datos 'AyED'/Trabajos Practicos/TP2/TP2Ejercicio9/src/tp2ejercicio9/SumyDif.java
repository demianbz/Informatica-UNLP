
package tp2ejercicio9;

public class SumyDif {
    private int sum;
    private int dif;
    
    public SumyDif (int s , int d){
        sum = s;
        dif = d;
    }

    public int getSum() {
        return sum;
    }

    public void setSum(int sum) {
        this.sum = sum;
    }

    public int getDif() {
        return dif;
    }

    public void setDif(int dif) {
        this.dif = dif;
    }
    

    @Override
    public String toString(){
        return "Suma: "+ this.getSum() +"  Diferencia: "+ this.getDif();
    }
}

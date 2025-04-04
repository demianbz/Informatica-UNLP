/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package estructurasdecontrol;

/**
 *
 * @author DEMIA
 */
public class EstructurasDeControl {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int i;
        for(i=1 ; i<=10 ; i++) //For i=1 to 10 writeln(i)
            System.out.println(i);
            
        System.out.println("--------");
        
        for(i=10 ; i>0 ; i--)   //for i:=1 dowto 10 writeln(i)
             System.out.println(i);
           
       i=10;
       while (i>0){
           if(i % 2 == 0)
               System.out.println(i+" Es Par");
           else
               System.out.println(i+" No es Par");
           i--;
       }
    }
    
}

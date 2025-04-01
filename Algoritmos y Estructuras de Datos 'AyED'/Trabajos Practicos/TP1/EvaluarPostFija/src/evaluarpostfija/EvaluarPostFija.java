/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package evaluarpostfija;

import java.util.Stack;

/**
 *
 * @author DEMIA
 */
public class EvaluarPostFija {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String expresion = "34+2*";  //Equivalente a "(3+4) *2"
        System.out.println("Resultado 'PostFija': "+ EvaluarPostFija.evaluarExpresionPostFija(expresion));    
    }
    
    public static int evaluarExpresionPostFija(String expresion){
        Stack<Integer> stack = new Stack<>();   //Creo una Pila
        for(int i = 0  ; i< expresion.length() ; i++){
            char valor = expresion.charAt(i);
            if(esNumero(valor)){     //Si es un operando (numero)
                stack.push(Character.getNumericValue(valor));   //Convierto a numero y lo apilo, porque esta como caracter
        }else{   //Es operador   
            int b = stack.pop();
            int a= stack.pop();
            switch(valor){
                case '+': stack.push(a+b); break;
                case '-': stack.push(a-b); break;
                case '*': stack.push(a*b); break;
                case '/': stack.push(a/b); break;
            }
        }
        }
        return stack.pop();
    }
    
    public static boolean esNumero(Character car){
        return car >= '0' && car <= '9';
    }
    
}

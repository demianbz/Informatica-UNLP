/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp1ejercicio7;

import java.util.*;

public class EjercicioSucesion {
    public static List<Integer> calcularSucesion(int n) {
        List<Integer> lista = new LinkedList<>();
        calcularSucesionRec(lista, n);
        return lista;
    }
    
    private static void calcularSucesionRec(List<Integer> lista, int n) {
        lista.add(n);
        if(n>1)
            if(n%2 == 0) calcularSucesionRec(lista, n/2);   //si el numero es par n = n/2
            else calcularSucesionRec(lista, 3*n+1);         //si es impar n = 3xn+1
    }
    
    
    public static void main(String[] args) {
        System.out.println("Ingrese un numero positivo");
        Scanner Scan = new Scanner(System.in);
        int n = Scan.nextInt();
        Scan.close();
        
        List<Integer> lista = calcularSucesion(n);
        System.out.println("Lista con cada miembro de la sucesion");
        for(int e: lista) 
            System.out.println(e);
    }
    
    
}

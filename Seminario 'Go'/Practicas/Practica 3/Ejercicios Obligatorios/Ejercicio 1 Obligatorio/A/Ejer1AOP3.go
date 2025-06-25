/*
1) Realice un programa que acepte un número entero positivo N como
entrada desde la línea de comandos y calcule todos los números
primos menores o iguales a N.
a) Realice el programa con una única goroutine que muestre en
pantalla la lista de números primos encontrados.
b) Realice el programa utilizando más de una goroutine para dividir
el trabajo de comprobación de primos entre múltiples goroutines
en paralelo
i) Cada goroutine debe recibir un rango de números a
comprobar y devolver una lista de los números primos
encontrados
ii) El programa principal debe recibir el número N y dividir el
trabajo en goroutines, asignando a cada una un rango de
números a comprobar
iii) Una vez que todas las goroutines hayan finalizado, el
programa principal debe recopilar los resultados y mostrar
en pantalla la lista de números primos encontrados.
c) Realice la ejecución con N igual a 1.000, 100.000 y 1.000.000
tanto del programa a) como del b). Para cada caso calcule el
speed-up con la siguiente fórmula:
S(p) =  T(1) / T(p)
donde, S(p) es el speed-up, T(1) es el tiempo que tarda la
ejecución con una única goroutine y T(p) es el tiempo de
ejecución con p goroutines.
*/
package main

import (
	"fmt"
	"os"
	"strconv"
	//"sync"
)

func esPrimo(N int) bool {
	for i := 2; i*i <= N; /*√n*/ i++ {
		if N%i == 0 {
			return false
		}
	}
	return true
}

func main() {
	entrada := os.Args[1]           //	Leo el numero desde la terminal
	N, err := strconv.Atoi(entrada) //Convierto el numero a entero
	if err != nil {
		fmt.Println("La entrada no es valida")
	} else {
		fmt.Println("El numero ingresado es:", N)
	}

	primos := []int{}
	for i := 2; i <= N; i++ {
		if esPrimo(i) {
			primos = append(primos, i)
		}
	}

	fmt.Println("----Numeros primos hasta", N, "----")
	fmt.Println(primos)
}

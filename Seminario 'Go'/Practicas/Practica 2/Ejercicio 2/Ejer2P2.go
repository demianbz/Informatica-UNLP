/*
2. Implementar la función factorial de dos formas, una iterativa y otra
recursiva. Escribir un programa y compilar de forma que utilice una u
otra y la evalúe de 0 a 9. La función factorial se define como:
Sub-objetivo: Recursión vs. iteración. Usar funciones.
*/
package main

import "fmt"

func factorialIterativo(num int) int {
	var factorial = 1
	for num > 0 {
		factorial = factorial * num
		num--
	}
	return factorial
}

func factorialRecursivo(num int) int {
	if num == 0 {
		return 1
	} else {
		return num * factorialRecursivo(num-1)
	}
}

func main() {
	var num int
	fmt.Print("Ingrese un numero:")
	fmt.Scanln(&num)
	//var factorial = factorialIterativo(num)
	fmt.Println("-----Factorial de", num, "Iterativo-----")
	fmt.Printf("!%d=", num)
	fmt.Println(factorialIterativo(num))
	fmt.Println()
	fmt.Println("-----Factorial de", num, "Recursivo-----")
	fmt.Printf("!%d=", num)
	fmt.Println(factorialRecursivo(num))
	fmt.Println()
}

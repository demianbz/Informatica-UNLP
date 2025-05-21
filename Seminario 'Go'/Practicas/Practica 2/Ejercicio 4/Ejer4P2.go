/*
Se debe leer tres sucesiones, de N (constante), números enteros cada una:
x₁ . . . xₙ, y₁ . . . yₙ, z₁ . . . zₙ, almacenarlas en sus respectivos arreglos y calcular luego:

Para la productoria, la sumatoria y el máximo-mínimo usar funciones.
La función maxmin retorna el máximo y el mínimo de la serie y luego ambos son multiplicados por el resto de la
ecuación.
Sub-objetivo: Resaltar el tipado fuerte de Go y usar casting.Operaciones con Integer y Float.
Arreglos.Funciones que retornan más de un valor.
*/
package main

import (
	"fmt"
)

const N = 5

func sumatoria(x [N]int) float64 {
	var resultado float64
	for i := 0; i < N; i++ {
		if x[i] != 0 {
			resultado += 1 / float64(x[i])
		}
	}
	return resultado
}

func productoria(x [N]int) int {
	resultado := 1
	for i := 0; i < N; i++ {
		resultado *= x[i] * x[i] * x[i]
	}
	return resultado
}

func maxmin(x [N]int) (int, int) {
	max := 0
	min := 999
	for i := 0; i < N; i++ {
		if x[i] > max {
			max = x[i]
		}
		if x[i] < min {
			min = x[i]
		}
	}
	return max, min
}

func main() {
	x := [N]int{4, 6, 8, 10, 12}   //sucesion x
	y := [N]int{7, 11, 13, 14, 15} //sucesion y
	z := [N]int{1, 2, 5, 1, 3}     //sucesion z

	var resultado float64

	resultSumatoria := sumatoria(x)
	fmt.Print("-Sumatoria: ", resultSumatoria)

	resultProductoria := productoria(z)
	fmt.Print("    -Productoria: ", resultProductoria)

	max, min := maxmin(y)
	resultMaxMin := max + min
	fmt.Println("    -MaxMin:", max, min)

	resultado = ((resultSumatoria - float64(resultProductoria)) * float64(resultMaxMin))
	fmt.Println("-----Resultado-----")
	fmt.Println("(Sumatoria - Productoria) x  maxmin =", resultado)
}

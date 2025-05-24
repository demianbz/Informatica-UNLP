/*
6. Escribir un programa que implemente dos funciones sobre slices. La primera
recibe dos slices de enteros y retorna un tercer slice del tamaño del mínimo
entre los dos sumando elemento a elemento. La segunda recibe un slice de
enteros y calcula el promedio de sus elementos. Por ejemplo, las definiciones
de las funciones pueden ser las siguientes:
func Sum(a , b []int) []int
func Avg(a []int) int
a. Re-implemente la función Avg para que retorne un float.
Sub-objetivo: Slices, funciones y parámetros.
*/
package main

import "fmt"

func Sum(a, b []int) []int { //recibe dos slices de enteros y retorna un tercer slice del tamaño del mínimo entre los dos sumando elemento a elemento
	var longitud int
	if len(a) < len(b) {
		longitud = len(a)
	} else {
		longitud = len(b)
	}
	c := make([]int, longitud)
	for i := 0; i < longitud; i++ {
		c[i] = a[i] + b[i]
	}
	return c
}

func Avg(a []int) int { //recibe un slice de enteros y calcula el promedio entero de sus elementos
	var promedio int
	for i := 0; i < len(a); i++ {
		promedio += a[i]
	}

	return promedio / len(a)
}

func AvgFloat(a []int) float64 { //recibe un slice de enteros y calcula el promedio float de sus elementos
	var promedio float64
	for i := 0; i < len(a); i++ {
		promedio += float64(a[i])
	}

	return promedio / float64(len(a))
}

func main() {
	a := []int{2, 4, 6, 8, 10}
	b := make([]int, 6)
	for i := 0; i < len(b); i++ { //len = dimL
		b[i] = 2*i + 1
	}
	fmt.Println("Slice a:", a)
	fmt.Println("Slice b:", b)
	c := Sum(a, b)
	fmt.Println("----Nuevo slice con la suma de a + b----")
	fmt.Println("Slice c:", c)
	fmt.Println("----Promedio entero del Slice c----")
	fmt.Println(Avg(c))
	fmt.Println("----Promedio del Slice a----")
	fmt.Println(AvgFloat(a))
}

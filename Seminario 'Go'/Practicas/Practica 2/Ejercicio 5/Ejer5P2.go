/*
5. Escribir un programa que defina el tipo vector de flotantes de tamaño fijo,
constante, con las operaciones:
func Initialize(v Vector ,f float64)
func Sum(v1 , v2 Vector) Vector
func SumInPlace(v1 , v2 Vector)
SumInPlace, a diferencia de la anterior, guarda el resultado de la suma en el
primer vector. Investigar formas que existen para encapsular y separar el código.
Sub-objetivo: Arreglos, funciones y parámetros por referencia.
*/
package main

import "fmt"

const C = 5

type Vector [C]float64

func Initialize(v *Vector, f float64) { //Para que una funcion pueda modificar un valor fuera de ella hay que pasar un puntero por referencia con "*"
	for i := 0; i < C; i++ {
		v[i] = f
	}
}

func Sum(v1, v2 Vector) Vector {
	var nuevoVector Vector
	for i := 0; i < C; i++ {
		nuevoVector[i] = v1[i] + v2[i]
	}
	return nuevoVector
}

func SumInPlace(v1 *Vector, v2 Vector) {
	for i := 0; i < C; i++ {
		v1[i] = v1[i] + v2[i]
	}
}

func main() {
	var v Vector
	Initialize(&v, 0.0) //Tengo que pasarle la direccion de v(&v) , porque la funcion espera la direccion (*x)
	fmt.Println("-----Vector Inicializado-----")
	fmt.Println(v)
	fmt.Println("-----Suma de dos vectores-----")
	var v1, v2 Vector
	Initialize(&v1, 2.0)
	Initialize(&v2, 3.0)
	fmt.Print("v1:", v1)
	fmt.Print("  +  v2:", v2)
	fmt.Print(" = ")
	v3 := Sum(v1, v2)
	fmt.Print("v3:", v3)
	fmt.Println()
	fmt.Println("-----Vector sumado en la funcion-----")
	SumInPlace(&v3, v1)
	fmt.Println("v4:", v3)
}

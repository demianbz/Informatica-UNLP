/*
1) Realice un programa que haga dos usos con distintos tipos del
siguiente tipo genérico:

type Map[K comparable, V any] map[K]V

Objetivo: tipos genéricos
*/
package main

import "fmt"

type Map[K comparable, V any] map[K]V

func main() {

	//Primer Uso
	nombres := make(Map[int, string])
	nombres[1] = "Juan"
	nombres[2] = "Pepe"
	nombres[3] = "Camilo"

	fmt.Println("---Map de Nombres---")
	fmt.Println(nombres)

	//Segundo Uso
	alumnos := Map[string, []string]{
		"FOD":  {"Lola", "Alan", "Rodri"},
		"CADP": {"Jose", "Pablo"},
	}

	alumnos["Mate 3"] = []string{"Joaco", "Pipo"}

	fmt.Println("---Map de Alumnos por Materia---")
	fmt.Println(alumnos)
}

/*1. Las temperaturas de los pacientes de un hospital se dividen en 3
grupos: alta (mayor de 37.5), normal (entre 36 y 37.5) y baja (menor de
36). Se deben leer 10 temperaturas de pacientes e informar el
porcentaje de pacientes de cada grupo. Luego se debe imprimir el
promedio entero entre la temperatura máxima y la temperatura mínima.
Resolver cargando primero todos los valores usando un arreglo y
almacenar los datos en variables escalares como acumuladores y
contadores. Probar generar archivos de entrada con los valores y
ejecutar, por ejemplo, de la siguiente forma:
go run p2-1.go < input2-1.txt
a) Volver a resolver pero usando un arreglo o un Map de tres
posiciones donde se acumulan los valores de cada grupo.
b) Modificar la solución para incluir grupo de valores incorrectos, como
pueden ser los mayores a 50◦ y los menores a 20◦.
c) Escribir una función que pasa de grados Celsius a Fahrenheit
utilizando nuevos tipos y aplicarla al arreglo de los valores leídos. La
conversión se realiza de acuerdo a la siguiente ecuación:
F=(C×9/5)+32
Sub-objetivo: Ver el tipado fuerte, usar casting. Operaciones y E/S con
float. Arreglos. Maps. Constantes. Definición de nuevos tipos.*/

package main

import "fmt"

func main() {
	v := [10]float64{40.5, 35, 36.5, 37.5, 35, 34.5, 35.5, 41, 34, 37}
	var cantA, cantN, cantB float64
	max := 0.0
	min := 100.0
	for i := 0; i < 10; i++ {
		switch {
		case (v[i] > 37.5):
			cantA++
		case (v[i] <= 37.5 && v[i] >= 36):
			cantN++
		case (v[i] < 36):
			cantB++
		}
		if v[i] > max {
			max = v[i]
		}
		if v[i] < min {
			min = v[i]
		}
	}
	fmt.Println("Porcentaje de temperaturas ALTAS:", (cantA/10)*100, "%") //Idem cant * 10
	fmt.Println("Porcentaje de temperaturas NORMALES:", (cantN/10)*100, "%")
	fmt.Println("Porcentaje de temperaturas BAJAS:", (cantB/10)*100, "%")

	promEnt := int((max + min) / 2)
	fmt.Println("Promedio entero entre la temp Max y Temp Min:", promEnt)
}

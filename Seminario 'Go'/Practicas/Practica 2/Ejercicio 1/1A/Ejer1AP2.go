/*
a) Volver a resolver pero usando un arreglo o un Map de tres
posiciones donde se acumulan los valores de cada grupo.
*/

package main

import "fmt"

func main() {
	v := [10]float64{40.5, 35, 36.5, 37.5, 35, 34.5, 35.5, 19, 34, 37}
	fmt.Println("---Arreglo de Temperaturas---")
	fmt.Println(v)
	fmt.Println()
	v2 := [3]float64{}
	vCont := [3]float64{}
	max := 0.0
	min := 100.0
	for i := 0; i < 10; i++ {
		switch {
		case (v[i] > 37.5):
			v2[0] += v[i]
			vCont[0]++
		case (v[i] <= 37.5 && v[i] >= 36):
			v2[1] += v[i]
			vCont[1]++
		case (v[i] < 36):
			v2[2] += v[i]
			vCont[2]++
		}
		if v[i] > max {
			max = v[i]
		}
		if v[i] < min {
			min = v[i]
		}
	}
	fmt.Println("Promedio de temp del grupo con temp ALTA:", (v2[0] / vCont[0]), "°C")
	fmt.Println("Promedio de temp del grupo con temp NORMAL:", (v2[1] / vCont[1]), "°C")
	fmt.Println("Promedio de temp del grupo con temp BAJA :", (v2[2] / vCont[2]), "°C")

	promEnt := int((max + min) / 2)
	fmt.Println("Promedio entero entre la temp Max y Temp Min:", promEnt)
}

/*
b) Modificar la solución para incluir grupo de valores incorrectos, como
pueden ser los mayores a 50◦ y los menores a 20◦.
*/

package main

import "fmt"

func main() {
	v := [10]float64{40.5, 35, 36.5, 37.5, 35, 34.5, 35.5, 19, 34, 37}
	fmt.Println("---Arreglo de Temperaturas---")
	fmt.Println(v)
	v2 := [3]float64{}
	vCont := [3]float64{}
	for i := 0; i < 10; i++ {
		switch {
		case (v[i] < 20 || v[i] > 50):
			fmt.Println("El valor en la posicion", i, "del arreglo es incorrecto")
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

	}
	fmt.Println()
	fmt.Println("Promedio de temp del grupo con temp ALTA:", (v2[0] / vCont[0]), "°C")
	fmt.Println("Promedio de temp del grupo con temp NORMAL:", (v2[1] / vCont[1]), "°C")
	fmt.Println("Promedio de temp del grupo con temp BAJA:", (v2[2] / vCont[2]), "°C")
	fmt.Println()

}

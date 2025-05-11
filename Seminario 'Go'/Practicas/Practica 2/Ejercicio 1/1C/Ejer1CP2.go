/*
c) Escribir una función que pasa de grados Celsius a Fahrenheit
utilizando nuevos tipos y aplicarla al arreglo de los valores leídos. La
conversión se realiza de acuerdo a la siguiente ecuación:
F=(C×9/5)+32
*/

package main

import "fmt"

type Celsius float64
type Fahrenheit float64

func convertirCtoF(C Celsius) Fahrenheit {
	return Fahrenheit(C*9/5 + 32)
}

func main() {
	v := [10]Celsius{40.5, 35, 36.5, 37.5, 35, 34.5, 35.5, 19, 34, 37}
	fmt.Println("---Arreglo de Temperaturas---")
	fmt.Println(v)
	v2 := [3]Celsius{}
	vCont := [3]Celsius{}
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
	promA := v2[0] / vCont[0]
	promN := v2[1] / vCont[1]
	promB := v2[2] / vCont[2]
	fmt.Println("----Arreglo en grados Celsius----")
	fmt.Println("Promedio de temp del grupo con temp ALTA:", promA, "°C")
	fmt.Println("Promedio de temp del grupo con temp NORMAL:", promN, "°C")
	fmt.Println("Promedio de temp del grupo con temp BAJA:", promB, "°C")
	fmt.Println()
	fmt.Println("----Arreglo en grados Fahrenheit----")
	/*for i:=0 ; i<3 ; i++{
	    fmt.Println(convertirCtoF(v2[i]))
	}*/
	fmt.Println("Promedio de temp del grupo con temp ALTA: ", convertirCtoF(promA), "°F")
	fmt.Println("Promedio de temp del grupo con temp NORMAL:", convertirCtoF(promN), "°F")
	fmt.Println("Promedio de temp del grupo con temp BAJA:", convertirCtoF(promB), "°F")

}

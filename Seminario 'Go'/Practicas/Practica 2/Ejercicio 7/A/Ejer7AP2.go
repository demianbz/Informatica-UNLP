/*
a. Modificar el programa anterior para que cuente de forma separada
mayúsculas de minúsculas.
*/
package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	fmt.Print("Ingrese una secuencia de caracteres que termine con CR: ")
	reader := bufio.NewReader(os.Stdin)   //leer entrada del usuario de manera más controlada y eficiente. porque el fmt.scanln tiene errores
	entrada, _ := reader.ReadString('\n') // lee hasta Enter

	var cantMay, cantMin, cantNum, cantEsp int

	var longitud int
	for i := 0; i < len(entrada)-1; i++ {
		if entrada[i] == 'C' && entrada[i+1] == 'R' { //me fijo en que posicion esta CR
			longitud = i //me guardo la posicion de CR para despues recorrer hasta ahi
		}
	}
	for i := 0; i < longitud; i++ {
		caracter := rune(entrada[i])
		switch {
		case (caracter >= 'A' && caracter <= 'Z'):
			cantMay++
		case (caracter >= 'a' && caracter <= 'z'):
			cantMin++
		case (caracter >= '0' && caracter <= '9'):
			cantNum++
		default:
			cantEsp++
		}
	}

	fmt.Println("Cantidad de Mayusculas de la Secuencia:", cantMay)
	fmt.Println("Cantidad de Minusculas de la Secuencia:", cantMin)
	fmt.Println("Cantidad de Numeros de la Secuencia:", cantNum)
	fmt.Println("Cantidad de Caracteres Especiales de la Secuencia:", cantEsp)
}

/*
b. Modificar para que, además, cuente de forma separada las ocurrencias
de cada dígito decimal. Utilice la estructura de datos Map.
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

	var cantMay, cantMin, cantEsp int

	var longitud int
	for i := 0; i < len(entrada)-1; i++ {
		if entrada[i] == 'C' && entrada[i+1] == 'R' { //me fijo en que posicion esta CR
			longitud = i //me guardo la posicion de CR para despues recorrer hasta ahi
		}
	}
	digitos := make(map[rune]int)
	for i := 0; i < longitud; i++ {
		caracter := rune(entrada[i])
		switch {
		case (caracter >= 'A' && caracter <= 'Z'):
			cantMay++
		case (caracter >= 'a' && caracter <= 'z'):
			cantMin++
		case (caracter >= '0' && caracter <= '9'):
			digitos[caracter]++
		default:
			cantEsp++
		}
	}

	fmt.Println("Cantidad de Mayusculas de la Secuencia:", cantMay)
	fmt.Println("Cantidad de Minusculas de la Secuencia:", cantMin)
	fmt.Println("Cantidad de Caracteres Especiales de la Secuencia:", cantEsp)
	fmt.Println("---Ocurrencias de cada dígito:---")
	for i := '0'; i <= '9'; i++ {
		fmt.Println("Dígito:", string(i), " Cant:", digitos[i])
	}
}

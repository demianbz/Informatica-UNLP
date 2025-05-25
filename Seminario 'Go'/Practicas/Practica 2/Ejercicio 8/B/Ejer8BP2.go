/*
b. Re-implemente la función considerando que v puede ser negativo, y se
empleará el mismo símbolo (-) para su representación en base-b.
*/
package main

import "fmt"

func Convert(v int, b int) string { //Convierte el entero v, en un string en su representación en base b.
	if b < 2 || b > 36 {
		return "Base inválida"
	} else {
		digitos := "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ" //símbolos posibles para todas las bases
		retorno := ""

		if v == 0 { //Si el número a convertir es cero, devolvemos "0" directamente, porque cualquier base representa el 0 igual.
			return "0"
		}

		// Verifico si es negativo
		negativo := false
		if v < 0 {
			negativo = true
			v = -v // trabajo con el valor absoluto
		}

		for v > 0 {
			resto := v % b                             // obtengo el dígito actual en la base (resto de dividir v por b)
			retorno = string(digitos[resto]) + retorno //// convierto el resto en su carácter correspondiente y lo agrego al inicio del string resultado porque estoy recorriendo de atras para adelante
			v = v / b                                  //reduzco v dividiéndolo entre la base para seguir con el siguiente dígito
		}

		// Si era negativo, agrego el signo menos
		if negativo {
			retorno = "-" + retorno
		}

		return retorno
	}
}

func main() {
	fmt.Println(Convert(23, 2))
	fmt.Println(Convert(-23, 2))
	fmt.Println(Convert(255, 16))
	fmt.Println(Convert(-10, 10))
}

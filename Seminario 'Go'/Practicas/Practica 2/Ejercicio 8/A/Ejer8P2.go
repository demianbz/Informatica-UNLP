/*
8. Escriba un programa que implemente la función:
func Convert ( v int , b int ) string
a. La función debe convertir el entero v, en un string en su representación en base b. El string será el valor de retorno.

	Por ejemplo si se invoca:

s = Convert ( 23 , 2 )
En s se almacenaría el valor “10111”.
La base debe ser mayor que 1 y menor que 37 dado que irıa de base-2 hasta base-36, que usarıa los dígitos:
“0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ”
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

		for v > 0 {
			resto := v % b                             // obtengo el dígito actual en la base (resto de dividir v por b)
			retorno = string(digitos[resto]) + retorno //// convierto el resto en su carácter correspondiente y lo agrego al inicio del string resultado porque estoy recorriendo de atras para adelante
			v = v / b                                  //reduzco v dividiéndolo entre la base para seguir con el siguiente dígito
		}

		return retorno
	}
}

func main() {
	fmt.Println(Convert(23, 2))
	fmt.Println(Convert(255, 16))
}

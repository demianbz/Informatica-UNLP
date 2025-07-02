/*
2. Realice un programa que reciba una frase e imprima en pantalla la
misma frase con cada una de las palabras invertidas siempre que su
ubicación sea impar en la frase comenzando a contar las palabras
desde 1, por ejemplo, si la frase ingresada es:
Qué lindo día es hoy.
El programa imprimirá:
éuQ lindo aíd es yoh.
*/
package main

import (
	"bufio" //Sirven para leer la entrada del usuario mejor, porque si usaba el scanln me daba errores
	"fmt"
	"os"      //Sirven para leer la entrada del usuario mejor, porque si usaba el scanln me daba errores
	"strings" //Yo lo use para trabajar los string como cadenas por ejemplo para dividir la frase en palabras y despues unirla
)

func invertirLetras(palabraOriginal string) string {
	var resultado string
	runaPalabras := []rune(palabraOriginal)
	//uso runas para evitar errores con los caracteres especiales como acentos o la letra ñ
	//Los strings estan compuestos por bytes, pero los caracteres especiales ocupan mas de un byte, esto en las runas no pasa

	for i := len(runaPalabras) - 1; i >= 0; i-- { //Recorro de atras hacia adelante para lograr lo de invertir, recordado que los indices empiezan en 0
		resultado += (string(runaPalabras[i]))
	}
	return resultado
}

func verificarSigno(palabraOriginal string) (string, string) {
	palabra, signo := palabraOriginal, ""
	ult := palabraOriginal[len(palabraOriginal)-1] //me da el último carácter (como byte)
	if strings.ContainsRune(".,!:;?¿", rune(ult)) {
		palabra = palabraOriginal[:len(palabraOriginal)-1] //me da la subcadena sin el último carácter
		signo = string(ult)                                //hago el casteo a string
	}
	return palabra, signo
}

func main() {
	var frase string
	fmt.Print("Ingrese una frase: ")
	reader := bufio.NewReader(os.Stdin)
	frase, _ = reader.ReadString('\n')
	frase = strings.TrimSpace(frase)

	// Uso strings.Fields para dividir la frase en palabras
	palabra := strings.Fields(frase)

	for i := 0; i < len(palabra); i++ {
		pal, signo := verificarSigno(palabra[i]) //verifico si hay algun signo, si es asi lo guardo en signo
		if (i % 2) == 0 {                        //tengo que ver las que son par porque el indice empieza en cero entonces(0 , 2 , 4 que serian en mi frase (1,3,5))
			palabra[i] = invertirLetras(pal) + signo //si es impar la invierto
		} else {
			palabra[i] = palabra[i] + signo //sino la dejo igual
		}

	}
	//En esta implementacion solo tengo en cuenta si el signo va a el final

	// Uno las palabras nuevamente en una frase
	fraseModificada := strings.Join(palabra, " ")
	//une todas las palabras en el slice palabras en una única cadena, insertando un espacio " " entre cada palabra
	fmt.Println("Frase modificada:", fraseModificada)
}

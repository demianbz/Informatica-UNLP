/*
3. Realice un programa que reciba una palabra como argumento y lee de
la entrada una frase. Luego, el programa debe imprimir la frase que
leyó con cada una de las ocurrencias de la palabra con las mayúsculas
y minúsculas invertidas. Por ejemplo, si la frase es:
“Parece peqUEño, pero no es tan pequeÑo el PEQUEÑO”
y la palabra es “PEQUEÑO” entonces el programa imprimirá:
“Parece PEQueÑO, pero no es tan PEQUEñO el pequeño”
Tenga en cuenta que la palabra a buscar puede ser ingresada con
mayúsculas y minúsculas mezcladas.
*/
package main

import (
	"bufio" //Sirven para leer la entrada del usuario mejor, porque si usaba el scanln me daba errores
	"fmt"
	"os"      //Sirven para leer la entrada del usuario mejor, porque si usaba el scanln me daba errores
	"strings" //Yo lo use para trabajar los string como cadenas por ejemplo para dividir la frase en palabras y despues unirla
	"unicode" //sirve para trabajar correctamente con caracteres Unicode, es decir, letras y símbolos de todos los idiomas
)

func invertirLetras(palabraOriginal string) string {
	var resultado string
	runaPalabras := []rune(palabraOriginal)

	//uso runas para evitar errores con los caracteres especiales como acentos o la letra ñ, yo en mi solucion anterior solo usaba los string pero el string por ejemplo en el acento de la é de miercoles ocupa mas de un byte por ser un caracter especial, esto en las runas no pasa

	for i := 0; i < len(runaPalabras); i++ {
		//if(runaOriginal[i]>= 'A' && runaOriginal[i]<= 'Z')no tengo en cuenta el caso "É", para eso tengo que usar el unicode
		if unicode.IsUpper(runaPalabras[i]) {
			resultado += strings.ToLower(string(runaPalabras[i]))
		} else {
			resultado += strings.ToUpper(string(runaPalabras[i]))
		}
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

	var palabraCambio string
	fmt.Print("Ingrese una palabra de la frase:")
	fmt.Scanln(&palabraCambio)

	// Uso strings.Fields para dividir la frase en palabras
	palabra := strings.Fields(frase)

	for i := 0; i < len(palabra); i++ {
		pal, signo := verificarSigno(palabra[i]) //verifico si hay algun signo, si es asi lo guardo en signo
		if strings.EqualFold(pal, palabraCambio) {
			palabra[i] = invertirLetras(pal) + signo
		}
	}
	//En esta implementacion solo tengo en cuenta si el signo va a el final

	// Uno las palabras nuevamente en una frase
	fraseModificada := strings.Join(palabra, " ")
	//une todas las palabras en el slice palabras en una única cadena, insertando un espacio " " entre cada palabra
	fmt.Println("Frase modificada:", fraseModificada)

}

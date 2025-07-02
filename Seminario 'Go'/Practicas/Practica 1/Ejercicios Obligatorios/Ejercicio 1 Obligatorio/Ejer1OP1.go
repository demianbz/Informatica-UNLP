/*
1. Realice las modificaciones necesarias al ejercicio anterior para que en lugar de reemplazar la palabra “jueves”
por “martes” ahora se reemplace “miércoles” por “automóvil”. Piense qué impacto tuvieron esas modificaciones en el
programa que había realizado.
La diferencia en un principio solo era cambiar la palabra jueves por miercoles y martes por automovil,
pero yo en mi ejercicio anterior no tenia en cuenta los caracteres especiales como acentos y ñ, en este
caso si lo tengo en cuenta usando las runas
*/
package main

import (
	"bufio" //Sirven para leer la entrada del usuario mejor, porque si usaba el scanln me daba errores
	"fmt"
	"os"      //Sirven para leer la entrada del usuario mejor, porque si usaba el scanln me daba errores
	"strings" //Yo lo use para trabajar los string como cadenas por ejemplo para dividir la frase en palabras y despues unirla
	"unicode" //Sirve para trabajar correctamente con caracteres Unicode, es decir, letras y símbolos de todos los idiomas
)

func cambiarAutomovil(palabraOriginal, automovil string) string {
	var resultado string
	runaOriginal := []rune(palabraOriginal)
	runaAutomovil := []rune(automovil)

	//uso runas para evitar errores con los caracteres especiales como acentos o la letra ñ, yo en mi solucion anterior solo usaba los string pero el string por ejemplo en el acento de la é de miercoles ocupa mas de un byte por ser un caracter especial, esto en las runas no pasa
	var longitud int

	if len(runaOriginal) > len(runaAutomovil) {
		longitud = len(runaAutomovil)
	} else {
		longitud = len(runaOriginal)
	}

	for i := 0; i < longitud; i++ {
		//if(runaOriginal[i]>= 'A' && runaOriginal[i]<= 'Z')no tengo en cuenta el caso É, para eso tengo que usar el unicode
		if unicode.IsUpper(runaOriginal[i]) {
			resultado += strings.ToUpper(string(runaAutomovil[i])) //tengo que hacer el casteo porque aux se me guardo como byte y espera un string
		} else {
			resultado += strings.ToLower(string(runaAutomovil[i]))
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
	//fmt.Println(frase)

	// Uso strings.Fields para dividir la frase en palabras
	palabra := strings.Fields(frase)

	for i := 0; i < len(palabra); i++ {
		pal, signo := verificarSigno(palabra[i]) //verifico si hay algun signo, si es asi lo guardo en signo
		if strings.EqualFold(pal, "miércoles") {
			palabra[i] = cambiarAutomovil(pal, "automovil") + signo
		}
	}

	// Uno las palabras nuevamente en una frase
	fraseModificada := strings.Join(palabra, " ")
	//Une todas las palabras en el slice palabras en una única cadena, insertando un espacio " " entre cada palabra
	fmt.Println("Frase modificada:", fraseModificada)
}

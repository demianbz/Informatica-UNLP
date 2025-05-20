/*
3. Declare el tipo de datos punto cardinal como un enumerativo. Realizar un
programa que lea un punto cardinal del cual viene el viento (N, S, E, O, NO,
SE, NE, SO) e imprima hacia cuál se dirige. Encapsule la funcionalidad en una
función.
a. Resolver usando un switch/case.
b. Resolver usando el orden en que fueron definidos, notar que el contrario
es hacia adelante o atrás por su índice par o impar.
c. Resolver con un Map que tiene como índice el tipo punto cardinal y cada
elemento es el punto cardinal contrario al índice.
d. ¿Cómo se declaran los tipos enumerativos definidos por el usuario en
otros lenguajes que conoce?
e. Definir la función que implementa la interfaz Stringer para usar con
fmt.Println  sobre un punto Cardinal.
f. ¿Qué sucede con las funciones anteriores cuando reciben un valor fuera
de rango?
Sub-objetivo: Declarar tipos enumerativos definidos por el usuario. Usar
el operador iota. Uso de Maps. Realizar E/S de tipos enumerativos. Funciones
sobre tipos enumerativos.
*/
package main

import "fmt"

type Cardinal int

const (
	N = iota
	S
	E
	O
	NO
	SE
	NE
	SO
)

func incisoA(p Cardinal) {
	switch p {
	case N:
		fmt.Println("El viento se dirige hacia el", mapaCardinal[S])
	case S:
		fmt.Println("El viento se dirige hacia el", mapaCardinal[N])
	case E:
		fmt.Println("El viento se dirige hacia el", mapaCardinal[O])
	case O:
		fmt.Println("El viento se dirige hacia el", mapaCardinal[E])
	case NO:
		fmt.Println("El viento se dirige hacia el", mapaCardinal[SE])
	case SE:
		fmt.Println("El viento se dirige hacia el", mapaCardinal[NO])
	case NE:
		fmt.Println("El viento se dirige hacia el", mapaCardinal[SO])
	case SO:
		fmt.Println("El viento se dirige hacia el", mapaCardinal[NE])
	}
}

var mapaCardinal = map[Cardinal]string{
	N:  "Norte",
	S:  "Sur",
	E:  "Este",
	O:  "Oeste",
	NE: "Noreste",
	SE: "Sureste",
	NO: "Noroeste",
	SO: "Suroeste",
}

var textoACardinal = map[string]Cardinal{
	"N":  N,
	"S":  S,
	"E":  E,
	"O":  O,
	"NO": NO,
	"SE": SE,
	"NE": NE,
	"SO": SO,
}

func main() {
	var punCar string
	fmt.Print(" Ingrese el punto cardinal(N, S, E, O, NO, SE, NE, SO) de donde viene el viento: ")
	fmt.Scanln(&punCar)
	punto := textoACardinal[punCar]
	//fmt.Println(mapaCardinal[punto])
	incisoA(punto)
}

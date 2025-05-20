/*
b. Resolver usando el orden en que fueron definidos, notar que el contrario
es hacia adelante o atrás por su índice par o impar.
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

func incisoB(p Cardinal) {
	if p%2 == 0 {
		fmt.Println("El viento se dirige hacia el", mapaCardinal[p+1])
	} else {
		fmt.Println("El viento se dirige hacia el", mapaCardinal[p-1])
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
	incisoB(punto)
}

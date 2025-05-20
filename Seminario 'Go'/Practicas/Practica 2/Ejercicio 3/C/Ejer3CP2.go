/*
c. Resolver con un Map que tiene como índice el tipo punto cardinal y cada
elemento es el punto cardinal contrario al índice.
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

func incisoC(p Cardinal) {
	fmt.Println("El viento se dirige hacia el", mapaCardinal[p])
}

var mapaCardinal = map[Cardinal]string{
	N:  "Sur",
	S:  "Norte",
	E:  "Oeste",
	O:  "Este",
	NE: "Sureste",
	SE: "Noreste",
	NO: "Suroeste",
	SO: "Noroeste",
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
	fmt.Print("Ingrese el punto cardinal(N, S, E, O, NO, SE, NE, SO) de donde viene el viento: ")
	fmt.Scanln(&punCar)
	punto := textoACardinal[punCar]
	//fmt.Println(mapaCardinal[punto])
	incisoC(punto)
}

/*
3) Implemente una serie de funciones para manejar slices de enteros que  estadísticamente tienen muchas rachas
de números repetidos. Utilice una  estructura (que con el objetivo de ahorrar memoria) tenga en cada elemento el
número entero y la cantidad de ocurrencias. Implemente:
-func New(s slice) OptimumSlice		-func IsEmpty(o OptimumSlice) bool  	-func Len(o OptimumSlice) int
-func FrontElement(o OptimumSlice) int 		-func LastElement(o OptimumSlice) int
-func Insert(o OptimumSlice, element int, position int) int  	-func SliceArray(o OptimumSlice) []int
Por ejemplo, si se invoca Insert con o = que sería la representación del arreglo:
{3,3,3,3,3,1,1,1,1,1,1,1,23,23,23,23,23,23,3,3,3,3,3,3,3,3,7,5,5,5}
y donde X[Y], X es el elemento e Y es la cantidad de ocurrencias consecutivas
element = 9  , position = 6
el resultado sería:
Nota: no se permite realizar el Insert convirtiendo el OptimunSlice a un slice, insertar
y luego volver a convertirlo.
*/
package main

import "fmt"

type Optimum struct {
	numero      int
	ocurrencias int
}

type slice []int

type OptimumSlice struct {
	slices []Optimum
}

func New(s slice) OptimumSlice { //Convierte un slice normal a OptimumSlice
	if len(s) == 0 {
		return OptimumSlice{}
	}
	slices := []Optimum{} //creo un slice vacio del registro Optimum
	act := s[0]           //primer elemento elem actual
	cant := 1             //contador de cantidad de ocurrencias del numero
	for i := 1; i < len(s); i++ {
		if s[i] == act { //si sigo en el actual sumo a mi acnt
			cant++
		} else { //sino cargo lo actual y reinicio los contadores
			slices = append(slices, Optimum{numero: act, ocurrencias: cant})
			act = s[i]
			cant = 1
		}
	}
	//no tengo en cuenta el ultimo numero dentro de ese for y lo tengo que agregar afuera
	slices = append(slices, Optimum{numero: act, ocurrencias: cant})
	return OptimumSlice{slices: slices}
}

func IsEmpty(o OptimumSlice) bool { //Devuelve si está vacío
	return len(o.slices) == 0
}

func Len(o OptimumSlice) int { //Devuelve la cantidad total de elementos
	total := 0
	for i := 0; i < len(o.slices); i++ {
		total += o.slices[i].ocurrencias
	}
	return total
}

func FrontElement(o OptimumSlice) int { //Devuelve el primer elemento
	if IsEmpty(o) {
		return -1
	} else {
		return o.slices[0].numero
	}
}

func LastElement(o OptimumSlice) int { //Devuelve el último elemento
	if IsEmpty(o) {
		return -1
	} else {
		return o.slices[len(o.slices)-1].numero
	}
}

func Insert(o OptimumSlice, element int, position int) OptimumSlice { //Inserta un número en una posición del OptimumSlice	(element: numero a insertar , position: en que indice insertar)
	slices := []Optimum{} // el nuevo slice de Optimum con el resultado final
	posAct := 0           // posición actual
	pude := false         // para saber si ya inserte el elemento
	for i := 0; i < len(o.slices); i++ {
		if pude { //si ya pude osea ya inserte solo copio lo que queda
			slices = append(slices, o.slices[i])
		} else {
			if posAct+o.slices[i].ocurrencias < position { //si todavia no llegue a la posicion que quiero insertar
				slices = append(slices, o.slices[i]) //copio slice Run y aumento la pos
				posAct += o.slices[i].ocurrencias
			} else {
				// insertar en medio
				elemRes := position - posAct //elementos antes de la posición de inserción
				if elemRes > 0 {             //tengo que agregar lo que me falta
					slices = append(slices, Optimum{o.slices[i].numero, elemRes})
				}
				// inserto el nuevo valor
				slices = append(slices, Optimum{element, 1})
				if elemRes < o.slices[i].ocurrencias {
					slices = append(slices, Optimum{o.slices[i].numero, o.slices[i].ocurrencias - elemRes})
				}
				posAct += o.slices[i].ocurrencias
				pude = true
			}
		}
	}

	if !pude { //si termino el for y no inserte, agrego al final porque significa que position estaba al final
		slices = append(slices, Optimum{element, 1})
	}

	return OptimumSlice{slices: slices}
}

func SliceArray(o OptimumSlice) []int { //Devuelve el slice como normal
	result := []int{}
	for i := 0; i < len(o.slices); i++ {
		for j := 0; j < o.slices[i].ocurrencias; j++ {
			result = append(result, o.slices[i].numero)
		}
	}
	return result
}

func main() {
	s := []int{
		3, 3, 3, 3, 3,
		1, 1, 1, 1, 1, 1, 1,
		23, 23, 23, 23, 23, 23,
		3, 3, 3, 3, 3, 3, 3, 3,
		7,
		5, 5, 5,
	}
	o := New(s)
	fmt.Println("-----OptimumSlice Original-----")
	fmt.Println(o)

	o = Insert(o, 9, 6)
	fmt.Println("-----OptimumSlice Despues de Insertar elem 9 , pos 6-----")
	fmt.Println(o)

	fmt.Println("-----OptimumSlice Representado como un slice normal-----")
	fmt.Println(SliceArray(o))
}

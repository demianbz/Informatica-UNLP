package main

import "fmt"

type List[T any] *Nodo[T]

type Nodo[T any] = struct {
	dato T
	sig  List[T]
}

func New[T any]() List[T] { //crea una nueva lista vacía
	return nil
}

func IsEmpty[T any](self List[T]) bool { //verifica si la lista está vacía
	return self == nil
}

func Len[T any](self List[T]) int { //devuelve la longitud de la lista
	long := 0
	for self != nil {
		long++
		self = self.sig
	}
	return long
}

func FrontElement[T any](self List[T]) (T, error) { //devuelve el valor del primer elemento
	var zeroValue T
	if self == nil {
		return zeroValue, fmt.Errorf("la lista esta vacia")
	}
	return self.dato, nil
}

func Next[T any](self List[T]) (List[T], error) { //devuelve la sublista a partir del siguiente nodo
	if self == nil {
		return nil, fmt.Errorf("la lista esta vacia")
	}
	return self.sig, nil
}

func ToString[T any](self List[T]) string { //representa la lista como string
	resultado := "["
	for self != nil {
		resultado += fmt.Sprintf("%v", self.dato) // devuelve un string (a diferencia de fmt.Printf, que lo imprime) , "%d" → es un formato de entero decimal
		if self.sig != nil {
			resultado += ", "
		}
		self = self.sig
	}
	return resultado + "]"
}

func PushFront[T any](self *List[T], elem T) { //inserta un elemento al inicio
	nue := &Nodo[T]{
		dato: elem,
		sig:  *self,
	}
	*self = nue
}

func PushBack[T any](self *List[T], elem T) { //inserta un elemento al final
	nue := &Nodo[T]{
		dato: elem,
		sig:  nil,
	}
	if *self == nil {
		*self = nue
	} else {
		aux := *self
		for aux.sig != nil {
			aux = aux.sig
		}
		//estoy parado a lo ultimo
		aux.sig = nue
	}
}

func RemoveFirst[T comparable](self *List[T], valor T) bool { //elimina el primer nodo cuyo valor coincida con el dato pasado
	if *self == nil {
		return false
	}

	act := *self
	var ant List[T] = nil

	for act != nil {
		if act.dato == valor {
			if ant == nil { //es el primer nodo el que quiero eliminar
				*self = (*self).sig
			} else { //estoy en el medio o en el final
				ant.sig = act.sig //hago el enlace para eliminar
			}
			return true
		}
		//si no encontre el dato sigo buscando
		ant = act
		act = act.sig
	}
	//nunca encontre el valor
	return false
}

func RemoveAll[T comparable](self *List[T], valor T) int { //elimina todos los nodos cuyo dato sea igual al valor dado
	if *self == nil {
		return 0
	}

	cant := 0
	act := *self
	var ant List[T] = nil

	for act != nil {
		if act.dato == valor {
			if ant == nil { //es el primer nodo el que quiero eliminar
				*self = (*self).sig
				act = *self
			} else { //estoy en el medio o en el final
				ant.sig = act.sig //hago el enlace para eliminar
				act = act.sig
			}
			cant++
		} else {
			//si no encontre el dato sigo buscando
			ant = act
			act = act.sig
		}
	}

	//retorno la cantidad de nodos que pude eliminar o 0 en caso de que no elimine niguno
	return cant
}

/*func RemoveFirst(self *List[int] , valor int) bool {
	if *self == nil{//lista vacia
		return false
	}

	act := *self
	var ant List[int] = nil

	for act != nil{
		if(act.dato == valor){
			if(ant == nil){	//es el primer nodo el que quiero eliminar
				*self = (*self).sig
			}else{	//estoy en el medio o en el final
				ant.sig = act.sig //hago el enlace para eliminar
			}
			return true
		}
		//si no encontre el dato sigo buscando
		ant = act
		act = act.sig
	}

	return false	//nunca encontre el valor
}*/

func Iterate[T any](self List[T], f func(T) T) { //aplica una función a cada elemento
	for self != nil {
		self.dato = f(self.dato)
		self = self.sig
	}
}

/*func main() {
	// Crear lista vacía
	lista := New()
	fmt.Println("¿Está vacía?", IsEmpty(lista)) // true

	// Agregar elementos al frente
	PushFront(&lista, 10)
	PushFront(&lista, 20)
	PushFront(&lista, 30)
	fmt.Println("Lista después de PushFront:", ToString(lista)) // [30, 20, 10]

	// Agregar elementos al final
	PushBack(&lista, 40)
	PushBack(&lista, 50)
	fmt.Println("Lista después de PushBack:", ToString(lista)) // [30, 20, 10, 40, 50]

	// Longitud de la lista
	fmt.Println("Longitud:", Len(lista)) // 5

	// Primer elemento
	fmt.Println("Primer elemento:", FrontElement(lista)) // 30

	// Siguiente nodo
	fmt.Println("Sublista desde segundo nodo:", ToString(Next(lista))) // [20, 10, 40, 50]

	// Eliminar elementos
	eliminado := Remove(&lista)
	fmt.Println("Elemento eliminado:", eliminado)            // 30
	fmt.Println("Lista después de Remove:", ToString(lista)) // [20, 10, 40, 50]

	// Aplicar una función: multiplicar por 2
	Iterate(lista, func(x int) int {
		return x * 2
	})
	fmt.Println("Lista después de Iterate (x2):", ToString(lista)) // [40, 20, 80, 100]
}*/

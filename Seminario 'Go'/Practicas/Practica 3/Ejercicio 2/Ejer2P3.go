/*
Definir e implementar las operaciones de lista enlazada de la práctica
anterior usando el siguiente tipo de datos, de una lista genérica:
type List[T any] struct {
head, tail *element[T]
}
type element[T any] struct {
next *element[T]
val  T
}
Objetivo: tipos genéricos
*/
package main

import "fmt"

type List[T any] struct {
	head, tail *element[T]
}

type element[T any] struct {
	next *element[T]
	val  T
}

func New[T any]() *List[T] { //crea una lista vacia(pri y ult == nil)
	return &List[T]{head: nil, tail: nil}
}

//Funcion independiente (No esta asociada a la estructura List[T])
//Forma de llamar a la funcion "lista(IsEmpty)"
func IsEmpty[T any](L List[T]) bool { //si la lista esta vacia retorna true(pri == nil)
	return L.head == nil
}

//Metodo asociado, esta forma de declarar la funcion(L *List[T]) hace que sea un metodo asociado a la estructura List[T]
//Esto permite una forma mas legible de llamar al metodo asociado a la funcion "fmt.Println(lista.IsEmpty())"
func (L *List[T]) IsEmpty() bool { //si la lista esta vacia retorna true(pri == nil)
	return L.head == nil
}

func (L *List[T]) Len() int { //Devuelve la Longitud de la lista
	cant := 0
	act := L.head
	for act != nil {
		cant++
		act = act.next
	}
	return cant
}

func (L *List[T]) FrontElement() (T, error) { //Devuelve el valor del primer elemento
	if L.head == nil {
		var zeroValue T
		return zeroValue, fmt.Errorf("La lista esta vacia")
	}
	return L.head.val, nil
}

func (L *List[T]) Next() *List[T] { //Devuelve la sublista a partir del siguiente nodo
	if L.head == nil || L.head.next == nil {
		return New[T]() //devuelvo la sublista vacia
	}

	newHead := L.head.next
	newTail := newHead

	for newTail.next != nil { //Recorro hasta encontrar el nuevo tail(ult)
		newTail = newTail.next
	}

	return &List[T]{head: newHead, tail: newTail}
}

func (L *List[T]) ToString() string { //Representa la lista como string
	resultado := "["
	act := L.head
	for act != nil {
		resultado += fmt.Sprintf("%v", act.val) //Devuelve una cadena de texto (string) formateada, en vez de imprimirla en pantalla ,%v es el formato generico para imprimir en cualquier tipo
		if act.next != nil {
			resultado += ", "
		}
		act = act.next
	}
	return resultado + "]"
}

func (L *List[T]) PushFront(elemento T) { //inserta un elemento al inicio
	nue := &element[T]{val: elemento, next: L.head} //creo un nuevo nodo
	L.head = nue

	if L.tail == nil { //si la lista estaba vacia
		L.tail = nue //actualizo tambien el ult
	}
}

func (L *List[T]) PushBack(elemento T) { //inserta un elemento al final
	nue := &element[T]{val: elemento, next: nil} //creo un nuevo nodo

	if L.tail != nil {
		L.tail.next = nue
	} else { //La lista estaba vacia
		L.head = nue
	}
	L.tail = nue
}

func RemoveFirst[T comparable](L *List[T], valor T) bool { //elimina el primer nodo cuyo valor coincida con el dato pasado
	if L.head == nil { //Si la lista esta vacia
		return false
	} else {
		act := L.head
		var ant *element[T]

		for act != nil {
			if act.val == valor { //encontre el elemento
				if act == L.head { //es el primero el que tengo que eliminar
					L.head = L.head.next
					if L.head == nil { //la lista quedo vacia
						L.tail = nil
					}
				} else { //es un nodo del medio o el del final
					if act == L.tail { //es el del final
						L.tail = ant
						L.tail.next = nil
					} else { //es uno del medio
						ant.next = act.next
					}
				}
				return true
			} else {
				ant = act
				act = act.next
			}
		}
	}
	return false
}

func RemoveAll[T comparable](L *List[T], valor T) { //elimina todos los nodos cuyo dato sea igual al valor dado
	act := L.head
	var ant *element[T]

	for act != nil {
		if act.val == valor { //encontre el elemento
			if act == L.head { //es el primero el que tengo que eliminar
				L.head = L.head.next
				if L.head == nil { //la lista quedo vacia
					L.tail = nil
				}
				act = L.head //elimino y actualizo mi act para seguir avanzando
			} else { //es un nodo del medio o el del final
				if act == L.tail { //es el del final
					L.tail = ant
					L.tail.next = nil
				} else { //es uno del medio
					ant.next = act.next
				}
				act = ant.next
			}
		} else {
			ant = act
			act = act.next
		}
	}
}

func (L *List[T]) Iterate(f func(T) T) { //aplica una función a cada elemento
	aux := L.head
	for aux != nil {
		aux.val = f(aux.val)
		aux = aux.next
	}
}

func main() {
	// Crear una lista vacía
	lista := New[int]()
	fmt.Println("Lista recién creada:", lista.ToString())
	fmt.Println("¿Está vacía?:", lista.IsEmpty())
	fmt.Println("Longitud:", lista.Len())

	// Insertar elementos al final
	lista.PushBack(1)
	lista.PushBack(2)
	lista.PushBack(3)
	fmt.Println("\nLista después de PushBack(1,2,3):", lista.ToString())

	// Insertar al frente
	lista.PushFront(0)
	fmt.Println("Después de PushFront(0):", lista.ToString())

	// Ver primer elemento
	val, err := lista.FrontElement()
	if err == nil {
		fmt.Println("Primer elemento:", val)
	} else {
		fmt.Println("Error al obtener el primer elemento:", err)
	}

	// Obtener sublista con Next()
	sublista := lista.Next()
	fmt.Println("\nSublista (Next):", sublista.ToString())

	// Aplicar una función a cada elemento
	lista.Iterate(func(x int) int { return x * 10 })
	fmt.Println("Después de Iterate(x*10):", lista.ToString())

	// Probar RemoveFirst
	ok := RemoveFirst(lista, 20)
	fmt.Println("\nRemoveFirst(20) éxito:", ok)
	fmt.Println("Lista después de RemoveFirst(20):", lista.ToString())

	// Probar RemoveAll
	lista.PushBack(30)
	lista.PushBack(30)
	lista.PushBack(30)
	fmt.Println("\nDespués de agregar varios 30s:", lista.ToString())
	RemoveAll(lista, 30)
	fmt.Println("Después de RemoveAll(30):", lista.ToString())

	// Verificar si lista vacía después de borrar todo
	ok = RemoveFirst(lista, 0)
	fmt.Println("\nRemoveFirst(0) éxito:", ok)
	fmt.Println("Lista después de RemoveFirst(0):", lista.ToString())

	ok = RemoveFirst(lista, 10)
	fmt.Println("\nRemoveFirst(10) éxito:", ok)
	fmt.Println("Lista después de RemoveFirst(10):", lista.ToString())

	fmt.Println("\n¿La lista Está vacía?:", lista.IsEmpty())
}

/*
9. Usando memoria dinámica con punteros escribir una programa que implemente
y use una lista enlazada de enteros.
a. Definir el tipo, operaciones para agregar elementos adelante, atrás,
poder iterar, etc. Las operaciones pueden ser:
func New() List
func IsEmpty(self List) bool
func Len(self List) int
func FrontElement(self List) int
func Next(self List) List
func ToString(self List) string
func PushFront(self List, elem int)
func PushBack(self List, elem int)
func Remove(self List) int
func Iterate(self List, f func(int) int)
b. Generar el programa que utiliza las operaciones programadas.
c. Investigar y usar el paquete: ‘container/list’. Ver las diferencias y
similitudes con su implementación. Pensar de qué forma se podría hacer
de tipos genéricos.
d. Ver de mejorar la interfaz de las funciones, por ejemplo usando métodos
y códigos de error.
Sub-objetivo: Uso de memoria dinámica, structs, funciones anónimas.
Estudiar biblioteca estándar ofrecida por el lenguaje. Pensar cómo
encapsular código, orientar al alumno a pensar en packages. Métodos
para mejorar la interfaz y ver la posibilidad de retornar más de un valor
con código de errores en los casos que sea necesario.
*/
package main

import "fmt"

type List *nodo

type nodo = struct {
	dato int
	sig  List
}

func New() List { //crea una nueva lista vacía
	return nil
}

func IsEmpty(self List) bool { //verifica si la lista está vacía
	return self == nil
}

func Len(self List) int { //devuelve la longitud de la lista
	long := 0
	for self != nil {
		long++
		self = self.sig
	}
	return long
}

func FrontElement(self List) int { //devuelve el valor del primer elemento
	if self == nil {
		return -1
	}
	return self.dato
}

func Next(self List) List { //devuelve la sublista a partir del siguiente nodo
	if self == nil {
		return nil
	}
	return self.sig
}

func ToString(self List) string { //representa la lista como string
	resultado := "["
	for self != nil {
		resultado += fmt.Sprintf("%d", self.dato) // devuelve un string (a diferencia de fmt.Printf, que lo imprime) , "%d" → es un formato de entero decimal
		if self.sig != nil {
			resultado += ", "
		}
		self = self.sig
	}
	return resultado + "]"
}

func PushFront(self *List, elem int) { //inserta un elemento al inicio
	nue := &nodo{
		dato: elem,
		sig:  *self,
	}
	*self = nue
}

func PushBack(self *List, elem int) { //inserta un elemento al final
	nue := &nodo{
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

func Remove(self *List) int { //elimina y devuelve el primer elemento
	if *self == nil {
		return -1
	}
	valor := (*self).dato
	*self = (*self).sig
	return valor
}

func Iterate(self List, f func(int) int) { //aplica una función a cada elemento
	for self != nil {
		self.dato = f(self.dato)
		self = self.sig
	}
}

func main() {
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
}

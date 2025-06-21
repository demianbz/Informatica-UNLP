/*
5) Realice un programa que tenga 2 productores y 2 consumidores. Cada
productor y consumidor debe ser una Goroutine. Cada productor
producirá 3 números y cada consumidor consumirá 3 números. Los
productores deben esperar un tiempo aleatorio entre 0 y 1 segundo
para producir un número aleatorio entre 0 y 100. Los consumidores
deben consumirlos inmediatamente e imprimirlos por pantalla indicando
cual es el consumidor que lo consumió.

Objetivo: WaitGroups
*/
package main

import (
	"fmt"
	"math/rand"
	"sync"
	"time"
)

const (
	numCons   = 2
	numProds  = 2
	cantCons  = 3
	cantProds = 3
)

func productor(id int, ch chan int, wg *sync.WaitGroup) { //Id para saber es el productor (1 o 2)
	defer wg.Done() //Defer es para que si o si se ejecute cuando termine el modulo, osea se ejecuta el final aunque este el principio
	for i := 0; i < cantProds; i++ {
		time.Sleep(time.Duration(rand.Intn(1000)) * time.Millisecond) //espera el tiempo para producir
		num := rand.Intn(101)                                         //Genera un numero aleatorio entre 0 y n-1 (0 y 100)
		fmt.Println("El productor", id, "Produjo el numero", num)
		ch <- num //Mando el numero al canal
	}
}

func consumidor(id int, ch chan int, wg *sync.WaitGroup) { //Id para saber que consumidor consumio(1 o 2)
	defer wg.Done() //Defer es para que si o si se ejecute cuando termine el modulo, osea se ejecuta el final aunque este el principio
	for i := 0; i < cantCons; i++ {
		num := <-ch //Recibo el numero del canal
		fmt.Println("El Consumidor", id, "Consumio el numero", num)
	}
}

func main() {
	rand.Seed(time.Now().UnixNano()) //semilla para los randoms (para que los numeros cambien)
	ch := make(chan int)             //canal para la comunicacion entre las goroutines (canal sin buffers)
	var wg sync.WaitGroup            //creo una WaitGroup para asegurarme de que todos terminen y despues termine el main

	// Lanzar productores
	for i := 1; i <= numProds; i++ {
		wg.Add(1)                //Aumento en 1 el contador
		go productor(i, ch, &wg) //Llamo a la Goroutine de los productores
	}

	// Lanzar consumidores
	for i := 1; i <= numCons; i++ {
		wg.Add(1)                 //Aumento en 1 el contador
		go consumidor(i, ch, &wg) //LLamo a la Goroutine de los consumidores
	}

	wg.Wait() //Espero a que todos terminen
	fmt.Println("Todos los productores y consumidores terminaron.")

}

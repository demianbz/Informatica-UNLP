/*
6) Realice un programa que utilice select para recibir valores desde tres
canales diferentes. Cada canal debe recibir una secuencia de números
enteros. El programa debe recibir un valor de cada canal y mostrar el
valor recibido. Debes usar select para determinar cuál canal tiene un
valor disponible y recibir ese valor. El programa debe continuar hasta
haber recibido todos los valores enviados a cada canal. Al final debe
mostrar el total de valores recibidos desde cada canal.
Objetivo: select
*/
package main

import (
	"fmt"
	"math/rand"
	"sync"
)

func enviar(ch chan int, cant int, wg *sync.WaitGroup) {
	defer wg.Done()
	for i := 0; i < cant; i++ {
		num := rand.Intn(1001)
		ch <- num
	}
	close(ch)
}

func main() {
	var wg sync.WaitGroup

	ch1 := make(chan int)
	ch2 := make(chan int)
	ch3 := make(chan int)

	cantCanales := 3
	wg.Add(cantCanales)

	//Mando 5 numeros a cada canal
	go enviar(ch1, 3, &wg)
	go enviar(ch2, 3, &wg)
	go enviar(ch3, 3, &wg)

	var c1, c2, c3 int
	ch1Abierto, ch2Abierto, ch3Abierto := true, true, true

	for ch1Abierto || ch2Abierto || ch3Abierto {
		select {
		case num, ok := <-ch1:
			if ok { //Si el canal sigue abierto
				fmt.Println("Recibido de canal 1:", num)
				c1++
			} else {
				ch1Abierto = false //Canal cerrado
			}
		case num, ok := <-ch2:
			if ok { //Si el canal sigue abierto
				fmt.Println("Recibido de canal 2:", num)
				c2++
			} else {
				ch2Abierto = false //Canal cerrado
			}
		case num, ok := <-ch3:
			if ok { //Si el canal sigue abierto
				fmt.Println("Recibido de canal 3:", num)
				c3++
			} else {
				ch3Abierto = false //Canal cerrado
			}
		}
	}

	wg.Wait()

	fmt.Println("Total recibido de ch1:", c1)
	fmt.Println("Total recibido de ch2:", c2)
	fmt.Println("Total recibido de ch3:", c3)
}

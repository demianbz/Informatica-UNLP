/*
2) Realice un programa que simule la atención de clientes en las cajas de
un supermercado. La atención de cada cliente por parte del cajero se
debe simular con un timer entre 0 y 1 segundo.
a) Realice el programa haciendo esperar a los clientes en un única
cola global y luego enviándolo a la caja para su atención cuando
esta se encuentre disponible
b) Realice el programa haciendo esperar a los clientes en colas
individuales por caja asignando la caja para su atención con un
algoritmo round-robin
c) Realice el programa haciendo esperar a los clientes en colas
individuales por caja asignando la caja para su atención a aquella
que tenga la cola más corta
d) Imprima los tiempos de ejecución de cada uno de los programas
implementados en a), b) y c)
*/
package main

import (
	"fmt"
	"math/rand"
	"sync"
	"time"
)

const (
	cantClientes = 5
	cantCajas    = 3
)

func caja(ch chan int, wg *sync.WaitGroup) { //Esta funcion, mientras el canal este abierto sigue atendiendo clientes
	defer wg.Done()
	for {
		cliente, ok := <-ch //Recibo un cliente del canal y en ok recibo si el canal esta abierto o no
		if !ok {            //Si no esta abierto
			break //Termino La ejecucion, el canal esta cerrado
		} else {
			segundos := rand.Float64()
			duracion := time.Duration(segundos * float64(time.Second))
			time.Sleep(duracion)
			fmt.Println("Cliente", cliente, "Atendido")
		}
	}
}

func main() {
	inicio := time.Now()
	var wg sync.WaitGroup

	ch := make(chan int)

	for i := 0; i < cantCajas; i++ {
		wg.Add(1)
		go caja(ch, &wg)
	}

	for i := 0; i < cantClientes; i++ {
		cliente := i
		ch <- cliente //Mando un cliente al canal

	}

	close(ch)

	wg.Wait()
	duracion := time.Since(inicio)
	fmt.Println("Tiempo total de ejecucion:", duracion)
}

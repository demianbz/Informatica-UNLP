/*
b) Realice el programa haciendo esperar a los clientes en colas
individuales por caja asignando la caja para su atención con un
algoritmo round-robin
*/
package main

import (
	"fmt"
	"math/rand"
	"sync"
	"time"
)

const (
	cantClientes = 6
	cantCajas    = 3
)

func caja(ch chan int, wg *sync.WaitGroup, idCaja int) { //Esta funcion, mientras el canal este abierto sigue atendiendo clientes
	defer wg.Done()
	for {
		cliente, ok := <-ch //Recibo un cliente del canal y en ok recibo si el canal esta abierto o no
		if !ok {            //Si no esta abierto
			break //Termino La ejecucion, el canal esta cerrado
		} else {
			segundos := rand.Float64()
			duracion := time.Duration(segundos * float64(time.Second))
			time.Sleep(duracion)
			fmt.Println("Cliente", cliente, "Atendido por la Caja", idCaja)
		}
	}
}

func main() {
	var wg sync.WaitGroup

	canales := make([]chan int, cantCajas) //creo un canal que es un slice de canales(un canal para cada caja)
	/*for i := 0; i < len(canales); i++ {
		canales[i] = make(chan int)
	}*/

	for i := 0; i < cantCajas; i++ {
		canales[i] = make(chan int) //creo el canal correspondiente a la caja
		wg.Add(1)
		go caja(canales[i], &wg, i)
	}

	for i := 0; i < cantClientes; i++ {
		cliente := i
		canales[cliente%cantCajas] <- cliente //Mando un cliente al canal

	}

	for i := 0; i < len(canales); i++ {
		close(canales[i])
	}
	wg.Wait()
}

/*
7) Realice un programa que envíe datos a dos canales desde dos
goroutines y estos sean recibidos en el programa principal por un
select. Los datos se deben recibir en uno de los canales por el lapso de
5 segundos y por el otro en el lapso de 10 segundos.
Objetivo: timeouts
*/
package main

import (
	"fmt"
	"time"
)

func enviarC5seg(ch chan int) {
	for {
		time.Sleep(5 * time.Second)
		ch <- 5
	}
}

func enviarC10seg(ch chan int) {
	for {
		time.Sleep(10 * time.Second)
		ch <- 10
	}
}

func main() {
	ch5 := make(chan int)
	ch10 := make(chan int)

	go enviarC5seg(ch5)
	go enviarC10seg(ch10)

	timeoutGeneral := time.After(20 * time.Second) // Canal para cortar la ejecución total después de 20 segundos

	for {
		select {
		case msg := <-ch5:
			fmt.Println("Recibido por el canal de 5:", msg)
		case msg := <-ch10:
			fmt.Println("Recibido por el canal de 10:", msg)
		case <-timeoutGeneral:
			fmt.Println("Se acabo el tiempo total(20 seg).Finalizo el programa")
			return
		}
	}

}

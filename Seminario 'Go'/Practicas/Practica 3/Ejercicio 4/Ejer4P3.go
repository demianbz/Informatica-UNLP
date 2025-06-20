/*
¿Cómo podría hacer para garantizar que el siguiente programa
imprima?
PING
PONG
PING
PONG
PING
PONG
PING
PONG
PING
PONG
package main
import (
"fmt"
)
func pxng(m chan string, str string) {
m <- str
}

	func main() {
	   messages := make(chan string)

	   for i := 0; i < 5; i++ {
	       go pxng(messages, "PING")
	       go pxng(messages, "PONG")
	   }
	   for i := 0; i < 10; i++ {
	       fmt.Println(<-messages)
	   }
	}
*/
package main

import (
	"fmt"
	"sync"
)

func ping(pingCh chan struct{}, pongCh chan struct{}, wg *sync.WaitGroup) {
	defer wg.Done() //cuando termine la ejecucion ejecuto el wg.Done que decrementa en 1 el contador
	for i := 0; i < 5; i++ {
		<-pingCh //espero un mensaje para arrancar(espero turno)
		fmt.Println("PING")
		pongCh <- struct{}{} //Le mando el turno a PONG
	}
}

func pong(pongCh chan struct{}, pingCh chan struct{}, wg *sync.WaitGroup) {
	defer wg.Done() //cuando termine la ejecucion ejecuto el wg.Done que decrementa en 1 el contador
	for i := 0; i < 5; i++ {
		<-pongCh //espero el mensaje para arrancar(espero mi turno)
		fmt.Println("PONG")
		if i < 4 { // solo manda si no es la última vez
			pingCh <- struct{}{}
		}
	}
}

func main() {
	pingCh := make(chan struct{})
	pongCh := make(chan struct{})
	var wg sync.WaitGroup

	wg.Add(2) // espera 2 goroutines: ping y pong (pongo el contador en 2)

	go ping(pingCh, pongCh, &wg)
	go pong(pongCh, pingCh, &wg)

	pingCh <- struct{}{} // Inicia el ciclo con PING

	wg.Wait() // Espera a que ambas goroutines terminen(hasta que el contador sea 0)
}

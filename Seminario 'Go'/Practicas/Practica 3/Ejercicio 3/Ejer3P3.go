/*
3) Ejecute el siguiente programa:
package main
import "fmt"
func main() {
fmt.Println("Inicia Goroutine del main")
go hello()
fmt.Println("Termina Goroutine del main")
}
func hello() {
fmt.Println("Inicia Goroutine de hello")
for i := 0; i < 3; i++ {
fmt.Println(i, " Hello world")
}
fmt.Println("Termina Goroutine de hello")
}
a) ¿Cuántas veces se imprime Hello world?
En el primer caso, con el codigo como esta, "Hello World" no se imprime ninguna vez
porque el programa principal termina antes de que la goroutine hello() tenga oportunidad
de ejecutarse completamente.

b) ¿Cuántas Goroutines tiene el programa?
El programa tiene 2 Goroutines , el Goroutine principal que ejecuta el main y la
Goroutine lanzada con go

c) ¿Cómo cambiaría el programa (con la misma cantidad de
Goroutines) para que imprima 3 veces Hello world?
i)Hágalo usando time.Sleep
ii)Hágalo usando Channel Synchronization
*/
package main

import (
	"fmt"
	//Resolucion c)i- "time"
)

func main() {
	termine := make(chan bool) //canal para la sincronizacion
	fmt.Println("Inicia Goroutine del main")
	go hello(termine)
	//Resolucion c)i- time.Sleep(1 * time.Second) //Es para darle tiempo a hello para que se termine de ejecutar
	<-termine //espera el mensaje de la goroutine de que termino
	fmt.Println("Termina Goroutine del main")
}

func hello(termine chan bool) {
	fmt.Println("Inicia Goroutine de hello")
	for i := 0; i < 3; i++ {
		fmt.Println(i, " Hello world")
	}
	fmt.Println("Termina Goroutine de hello")
	termine <- true //le mando mensaje al main de que ya termine, no es necesario mandar true, lo que importa es mandar y recibir mensajes
}

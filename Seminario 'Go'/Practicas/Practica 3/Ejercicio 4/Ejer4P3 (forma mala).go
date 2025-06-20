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

import "fmt"

func pxng(m chan string, str string) {
	m <- str
}

func printPing(ping chan string, str string) {
	fmt.Println(str)
	ping <- str
}

func printPong(pong chan string, str string) {
	fmt.Println(str)
	pong <- str
}

func main() {
	ping := make(chan string)
	pong := make(chan string)

	for i := 0; i < 5; i++ {
		go printPing(ping, "PING")
		<-ping
		go printPong(pong, "PONG")
		<-pong
	}

}

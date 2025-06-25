/*
) Desarrolla un programa que implemente un sistema de planificación
(scheduler) utilizando 5 goroutines (el main y 4 más) . El programa
debe generar una serie de números enteros aleatorios, cada uno con
una prioridad aleatoria entre 0 y 3 (donde 0 es la prioridad más alta y 3
la más baja).
El scheduler debe seguir las siguientes reglas:
a) El scheduler debe procesar los datos en orden de prioridad,
comenzando por los de prioridad 0, luego 1, 2 y 3.
b) Mientras haya datos de prioridad 0, el scheduler debe
procesarlos exclusivamente.
c) Si no hay datos de prioridad 0 y hay goroutines disponibles, el
scheduler puede asignarles datos de menor prioridad para su
procesamiento.
d) Una vez que no haya datos de prioridad 0, el scheduler debe
pasar a procesar los datos de prioridad 1, y así sucesivamente,
utilizando las goroutines disponibles de forma dinámica.
e) El programa principal debe generar los datos numéricos
aleatorios con sus respectivas prioridades aleatorias y distribuir el
trabajo a las goroutines disponibles manteniendo el orden en el
que llegan los datos por prioridad.
f) Con los datos se debe:
i) Prioridad 0: Sumar los dígitos del número y almacenar el
resultado en un archivo llamado "prioridad0.txt" en formato
de par ordenado (0, resultado).
ii) Prioridad 1: Invertir los dígitos del número y almacenar el
resultado en un archivo llamado "prioridad1.txt" en formato
de par ordenado (1, resultado).
iii) Prioridad 2: Multiplicar el número por un valor constante
(por ejemplo, 10) e imprimir el resultado en la consola.
iv) Prioridad 3: Acumular los números y mostrar el valor
acumulado en la consola cada vez que se procesa un dato.

Tip: Puedes utilizar la librería math/rand para generar números
aleatorios.
*/
package main

import (
	"fmt"
	"math/rand"
	"os"
	"sync"
)

type Trabajo struct {
	numero    int
	prioridad int
	wg        *sync.WaitGroup
}

const (
	cantTrabajos     = 10
	cantTrabajadores = 4
)

var (
	mutex     sync.Mutex
	acumulado int
)

func trabajador(trabajosCh <-chan Trabajo, id int, wg *sync.WaitGroup) {
	defer wg.Done()
	for trabajo := range trabajosCh {
		switch trabajo.prioridad {
		case 0:
			prioridad0(trabajo.numero)
		case 1:
			prioridad1(trabajo.numero)
		case 2:
			prioridad2(trabajo.numero)
		case 3:
			prioridad3(trabajo.numero)
		}
		trabajo.wg.Done()
	}
}

func prioridad0(num int) {
	suma := 0
	for num > 0 {
		suma += num % 10
		num = num / 10
	}

	parOrdenado := fmt.Sprintf("(0,%d)\n", suma)

	mutex.Lock()
	defer mutex.Unlock()

	file, err := os.OpenFile("prioridad0.txt", os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		panic(err)
	}
	defer file.Close()

	_, err = file.WriteString(parOrdenado)
	if err != nil {
		panic(err)
	}

}

func prioridad1(num int) {
	invertido := 0
	for num > 0 {
		digito := num % 10
		invertido = invertido*10 + digito
		num = num / 10
	}

	parOrdenado := fmt.Sprintf("(1,%d)\n", invertido)

	mutex.Lock()
	defer mutex.Unlock()

	file, err := os.OpenFile("prioridad1.txt", os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		panic(err)
	}
	defer file.Close()

	_, err = file.WriteString(parOrdenado)
	if err != nil {
		panic(err)
	}

}

func prioridad2(num int) {
	fmt.Println("Prioridad 2:", num, "x 10 = ", num*10)
}

func prioridad3(num int) {
	acumulado += num
	fmt.Println("Prioridad 3: acumulado =", acumulado)
}

func procesarPrioridad(pri int, trabajos []Trabajo, trabajosCh chan<- Trabajo) {
	for _, trabajo := range trabajos {
		trabajosCh <- trabajo // se bloquea si no hay goroutines disponibles
	}
}

func main() {
	var wgMain sync.WaitGroup

	trabajosCh := make(chan Trabajo) //Canal para enviar trabajos a los trabajadores

	for i := 0; i < cantTrabajadores; i++ {
		wgMain.Add(1)
		go trabajador(trabajosCh, i, &wgMain)
	}

	var colaPrioridad [4][]Trabajo
	for i := 0; i < cantTrabajos; i++ {
		num := rand.Intn(900) + 100
		pri := rand.Intn(4)
		trabajo := Trabajo{numero: num, prioridad: pri}
		colaPrioridad[pri] = append(colaPrioridad[pri], trabajo)
	}

	//Scheduler procesar por prioridad, me aseguro que cada grupo se complete antes de seguir
	for pri := 0; pri < 4; pri++ {
		var wg sync.WaitGroup
		trabajos := colaPrioridad[pri]
		for i := 0; i < len(trabajos); i++ {
			t := trabajos[i]
			wg.Add(1)
			trabajosCh <- Trabajo{numero: t.numero, prioridad: t.prioridad, wg: &wg}
		}
		wg.Wait()
	}
	close(trabajosCh)
	wgMain.Wait()
	fmt.Println("Todos los trabajos se terminaron correctamente")
}

/*
b) Realice el programa utilizando más de una goroutine para dividir
el trabajo de comprobación de primos entre múltiples goroutines
en paralelo
i) Cada goroutine debe recibir un rango de números a
comprobar y devolver una lista de los números primos
encontrados
ii) El programa principal debe recibir el número N y dividir el
trabajo en goroutines, asignando a cada una un rango de
números a comprobar
iii) Una vez que todas las goroutines hayan finalizado, el
programa principal debe recopilar los resultados y mostrar
en pantalla la lista de números primos encontrados.
*/
package main

import (
	"fmt"
	"os"
	"strconv"
	"sync"
)

func esPrimo(N int) bool {
	for i := 2; i*i <= N; /*√n*/ i++ {
		if N%i == 0 {
			return false
		}
	}
	return true
}

func goroutinePrimos(inicio int, fin int, ch chan []int, wg *sync.WaitGroup) {
	defer wg.Done()
	retorno := []int{}
	for i := inicio; i <= fin; i++ {
		if esPrimo(i) {
			retorno = append(retorno, i)
		}
	}
	ch <- retorno
}

func main() {
	var wg sync.WaitGroup

	entrada := os.Args[1]           //	Leo el numero desde la terminal
	N, err := strconv.Atoi(entrada) //Convierto el numero a entero
	if err != nil {
		fmt.Println("La entrada no es valida")
	} else {
		fmt.Println("El numero ingresado es:", N)
	}

	primos := []int{}
	ch := make(chan []int)

	cantGoroutines := 4
	total := N - 1                  //porque empiezo desde 2
	base := total / cantGoroutines  //cantidad base por goroutine
	resto := total % cantGoroutines //sobrante a repartir
	inicio := 2

	for i := 0; i < cantGoroutines; i++ {
		wg.Add(1)

		cant := base
		if i < resto {
			cant++
		}
		fin := inicio + cant - 1
		go goroutinePrimos(inicio, fin, ch, &wg)
		inicio = fin + 1
	}

	go func() {
		wg.Wait()
		close(ch)
	}()

	for j := 0; j < cantGoroutines; j++ {
		retorno := <-ch
		for i := 0; i < len(retorno); i++ {
			primos = append(primos, retorno[i])
		}
	}

	fmt.Println("----Numeros primos hasta", N, "----")
	fmt.Println(primos)
}

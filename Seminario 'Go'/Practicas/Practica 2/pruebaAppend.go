package main

import "fmt"

func main() {
	s := []int{1, 2, 3}
	fmt.Println("----Longitud y capacidad despues de crear el slice----")
	fmt.Println(s)
	fmt.Println("-len:", len(s), "  -cap:", cap(s))
	s = append(s, 4, 5)
	fmt.Println("----Longitud y capacidad despues de usar el append----")
	fmt.Println(s)
	fmt.Println("-len:", len(s), "  -cap:", cap(s))
}

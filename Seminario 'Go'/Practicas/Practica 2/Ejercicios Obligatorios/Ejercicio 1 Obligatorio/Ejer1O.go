/*
1) Usando la estructura de datos definida en el ejercicio 9 resolver el siguiente
problema. Se dispone de una lista con la información de los ingresantes a la
Facultad del año anterior. De cada ingresante se conoce: apellido, nombre,
ciudad de origen, fecha de nacimiento (día, mes, año), si presentó el título del
colegio secundario y el código de la carrera en la que se inscribe (APU, LI, LS).
Con esta información de los ingresantes se pide que recorra el listado una
vez para:
a) Informar el nombre y apellido de los ingresantes cuya ciudad origen es
“Bariloche”.
b) Calcular e informar el año en que más ingresantes nacieron.
c) Informar la carrera con la mayor cantidad de inscriptos.
d) Eliminar de la lista aquellos ingresantes que no presentaron el título.
*/
package main

import "fmt"

type codigoCarrera string

const (
	APU codigoCarrera = "APU"
	LI  codigoCarrera = "LI"
	LS  codigoCarrera = "LS"
)

type fecha struct {
	dia  int
	mes  int
	anio int
}

type Ingresante struct {
	apellido   string
	nombre     string
	ciudad     string
	nacimiento fecha
	titulo     bool
	carrera    codigoCarrera
}

type Bariloche struct {
	apellido string
	nombre   string
}

func ImprimirListaIngresantes(lista List[Ingresante]) {
	for i := lista; i != nil; i = i.sig {
		ing := i.dato
		fmt.Printf(
			"%s %s | Ciudad: %s | Nacimiento: %02d/%02d/%04d | Título: %t | Carrera: %s\n",
			ing.nombre, ing.apellido, ing.ciudad,
			ing.nacimiento.dia, ing.nacimiento.mes, ing.nacimiento.anio,
			ing.titulo, ing.carrera,
		)
	}
}

func procesarIngresantes(l *List[Ingresante]) {
	act := *l
	var ant List[Ingresante] = nil
	bariloche := New[Bariloche]()
	contAnios := make(map[int]int)              //clave = los años (ej 2004) , valor = cantidad de ingresantes nacidos en ese año (ej 2)
	contCarreras := make(map[codigoCarrera]int) //lo mismo que el map anterior pero con las carreras ("APU","LS","LI")
	for act != nil {

		//a) Informar el nombre y apellido de los ingresantes cuya ciudad origen es “Bariloche”.
		if act.dato.ciudad == "Bariloche" {
			PushFront(&bariloche, Bariloche{apellido: act.dato.apellido, nombre: act.dato.nombre})
		}

		//b) Calcular e informar el año en que más ingresantes nacieron.
		contAnios[act.dato.nacimiento.anio]++

		//c) Informar la carrera con la mayor cantidad de inscriptos.
		contCarreras[act.dato.carrera]++

		//d) Eliminar de la lista aquellos ingresantes que no presentaron el título.
		if !act.dato.titulo {
			//elimino el nodo actual y sigo
			if ant == nil { //si es el primer nodo el que quiero eliminar
				*l = act.sig
				act = *l
			} else { //sino estoy en el medio o en el final
				(*ant).sig = act.sig
				act = act.sig
			}
		} else {
			ant = act
			act = act.sig
		}
	}

	anioMax := 0
	maxCantidadAnios := 0
	for anio, cantidad := range contAnios {
		if cantidad > maxCantidadAnios {
			maxCantidadAnios = cantidad
			anioMax = anio
		}
	}

	var carreraMax codigoCarrera
	maxCantidadCarrera := 0
	for carrera, cantidad := range contCarreras {
		if cantidad > maxCantidadCarrera {
			maxCantidadCarrera = cantidad
			carreraMax = carrera
		}
	}

	fmt.Println("\nIngresantes de Bariloche:")
	for i := bariloche; i != nil; i = i.sig {
		fmt.Printf("%s %s\n", i.dato.nombre, i.dato.apellido)
	}

	fmt.Println("Año con más ingresantes:", anioMax)

	fmt.Println("Carrera con más inscriptos:", carreraMax)

}

func main() {
	// Creo una nueva lista de Ingresante
	ingresantes := New[Ingresante]()

	// Cargo algunos datos de prueba
	PushBack(&ingresantes, Ingresante{
		apellido:   "González",
		nombre:     "María",
		ciudad:     "Córdoba",
		nacimiento: fecha{dia: 15, mes: 3, anio: 2003},
		titulo:     true,
		carrera:    "LI",
	})

	PushBack(&ingresantes, Ingresante{
		apellido:   "López",
		nombre:     "Juan",
		ciudad:     "Rosario",
		nacimiento: fecha{dia: 10, mes: 7, anio: 2004},
		titulo:     false,
		carrera:    "LS",
	})

	PushBack(&ingresantes, Ingresante{
		apellido:   "Pérez",
		nombre:     "Ana",
		ciudad:     "Mendoza",
		nacimiento: fecha{dia: 28, mes: 11, anio: 2002},
		titulo:     true,
		carrera:    "APU",
	})

	PushBack(&ingresantes, Ingresante{
		apellido:   "Fernandez",
		nombre:     "Rodrigo",
		ciudad:     "Bariloche",
		nacimiento: fecha{dia: 03, mes: 11, anio: 2003},
		titulo:     true,
		carrera:    "APU",
	})

	fmt.Println("\n----Lista de Ingresantes-----")
	ImprimirListaIngresantes(ingresantes)

	procesarIngresantes(&ingresantes)

	fmt.Println("\n----Lista de Ingresantes Despues de eliminar los que no presentaron el titulo-----")
	ImprimirListaIngresantes(ingresantes)
}

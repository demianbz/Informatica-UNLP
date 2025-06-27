/*
8) Cree un programa que maneje una lista de contactos de manera
concurrente. La lista de contactos debe permitir agregar, eliminar y
buscar contactos de manera segura desde múltiples goroutines.
a) Defina una estructura Contact que contenga campos como
Nombre, Apellido, CorreoElectronico, y Telefono.
b) Cree una estructura llamada Agenda que contenga un mapa de
Contact con el correo electrónico como clave.
c) Implemente los siguientes métodos para la estructura Agenda:
i. AgregarContacto(contacto Contact): Agrega un
nuevo contacto a la agenda.
ii. EliminarContacto(correo string): Elimina un
contacto de la agenda dado su correo electrónico.
iii. BuscarContacto(correo string) Contact: Busca y
devuelve un contacto dado su correo electrónico.
d) Asegúrese de que las operaciones de agregar, eliminar y buscar
contactos se realicen de manera concurrente y que la estructura
Agenda sea segura para ser accedida desde múltiples
goroutines.
e) Cree una función main() que cree una agenda, inicie varias
goroutines para agregar, eliminar y buscar contactos de manera
simultánea, y luego imprima el contenido de la agenda después
de un tiempo para verificar que las operaciones se hayan
realizado correctamente.
*/
package main

import (
	"fmt"
	"sync"
)

type Contact struct {
	Nombre            string
	Apellido          string
	CorreoElectronico string
	Telefono          int
}

type Agenda struct {
	contactos map[string]Contact
	mutex     sync.Mutex
}

func (a *Agenda) AgregarContacto(contacto Contact) {
	a.mutex.Lock()         //Bloqueo para la concurrencia segura
	defer a.mutex.Unlock() //Libero al terminar la funcion
	a.contactos[contacto.CorreoElectronico] = contacto
}

func (a *Agenda) EliminarContacto(correo string) {
	a.mutex.Lock()
	defer a.mutex.Unlock()
	delete(a.contactos, correo)
}

func (a *Agenda) BuscarContacto(correo string) (Contact, bool) {
	a.mutex.Lock()
	defer a.mutex.Unlock()
	contacto, ok := a.contactos[correo]
	return contacto, ok
}

func agregar(a *Agenda, contacto Contact, wg *sync.WaitGroup) {
	defer wg.Done()
	a.AgregarContacto(contacto)
}

func eliminar(a *Agenda, correo string, wg *sync.WaitGroup) {
	defer wg.Done()
	a.EliminarContacto(correo)
}

func buscar(a *Agenda, correo string, wg *sync.WaitGroup) {
	defer wg.Done()
	contacto, ok := a.BuscarContacto(correo)
	if ok {
		fmt.Println("Se encontro el contacto", contacto.Nombre)
	} else {
		fmt.Println("No se encontro el contacto con correo", correo)
	}
}

func main() {
	var wg sync.WaitGroup

	agenda := &Agenda{contactos: make(map[string]Contact)}

	contactos := []Contact{
		{"Juan", "Pérez", "juan@email.com", 1234},
		{"Ana", "Gómez", "ana@email.com", 5678},
		{"Luis", "Martínez", "luis@email.com", 4321},
	}

	for _, valor := range contactos {
		wg.Add(1)
		go agregar(agenda, valor, &wg)
	}

	wg.Add(1)
	go eliminar(agenda, "ana@email.com", &wg)

	wg.Add(1)
	go buscar(agenda, "juan@email.com", &wg)

	wg.Wait()
	fmt.Println("-----Agenda-----")
	for _, contacto := range agenda.contactos {
		fmt.Printf("- %s %s (%s): %d\n", contacto.Nombre, contacto.Apellido, contacto.CorreoElectronico, contacto.Telefono)
	}
}

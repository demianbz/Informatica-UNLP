/*
2) Implemente una blockchain para que sea soporte de una cryptomoneda  que
incluya la creación de billeteras para los clientes. Una blockchain, o cadena de
bloques, es un sistema digital distribuído que funciona como un libro de
contabilidad público e inmutable. Almacena información sobre transacciones de
forma segura y descentralizada, sin necesidad de intermediarios. Cada
transacción se agrupa en un bloque, que se enlaza con el bloque anterior,
creando una cadena irrompible.
Utilice structs para representar la transacción (con el monto, el identificador de
quien envía dinero, el identificador de quien recibe ese dinero y la fecha/hora
de la transacción - timestamp -), el bloque (que tienen el hash, el hash previo,
la transacción (data) y la fecha/hora de creación de dicho bloque), la cadena de
bloques y la billetera (con el identificador, nombre y apellido del cliente).
Diagrama de la cadena:
Tip: puede utilizar la librería crypto/sha256 para crear el hash del bloque
anterior.
a) Defina todos los tipos de datos que va a utilizar. ✔
b) Programe funciones para:

		i) Crear una billetera ✔
		ii) Enviar una transacción  ✔
	 	iii) Insertar un bloque en la cadena
		iv) Obtener el saldo de un usuario (recorriendo toda la cadena)
		v) Realizar una función que valide que la cadena sea consistente recorriéndola y verificando que
		el hash almacenado del bloque anterior es válido
		vi) Si utilizó un slice para la estructura de la cadena de bloques cambie la implementación con una lista
		enlazada. Puede reutilizar la implementación del ejercicio 9. ¿Cuál fue el impacto que tuvo en su programa?
		vii) ¿Cómo validar que la transacción solo se pueda hacer si la billetera que va a enviar los fondos
		tiene saldo suficiente?
*/
package main

import (
	"fmt"
	"time"
)

type Transaccion struct {
	monto     float64
	emisor    string
	receptor  string
	timestamp time.Time
}

type Bloque struct {
	hash       string
	hashPrevio string
	data       Transaccion
	timestamp  time.Time
}

type Billetera struct {
	ID       string
	Nombre   string
	Apellido string
}

type blockchain []Bloque

func generarID(nombre, apellido string) string {
	return fmt.Sprintf("%s.%s", nombre, apellido)
}

func crearBilletera(nombre, apellido string) Billetera { //Genera una nueva billetera con un ID simple usando nombre-apellido
	id := generarID(nombre, apellido)
	return Billetera{ID: id, Nombre: nombre, Apellido: apellido}
}

func enviarTransaccion(unMonto float64, emisorID, receptorID string) Transaccion { //Devuelve una transacción con datos del emisor, receptor, monto y tiempo actual
	return Transaccion{monto: unMonto, emisor: emisorID, receptor: receptorID, timestamp: time.Now()}
}

func insertarBloque(bc *blockchain, t Transaccion) { //Inserta un bloque nuevo a la blockchain, usando el hash del bloque anterior para encadenarlo.

}

func main() {

}

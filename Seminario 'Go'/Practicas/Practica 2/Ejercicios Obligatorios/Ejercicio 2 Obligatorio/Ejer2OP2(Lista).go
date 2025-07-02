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
	 	iii) Insertar un bloque en la cadena ✔
		iv) Obtener el saldo de un usuario (recorriendo toda la cadena) ✔
		v) Realizar una función que valide que la cadena sea consistente recorriéndola y verificando que
		el hash almacenado del bloque anterior es válido ✔
		vi) Si utilizó un slice para la estructura de la cadena de bloques cambie la implementación con una lista
		enlazada. Puede reutilizar la implementación del ejercicio 9. ¿Cuál fue el impacto que tuvo en su programa?
		vii) ¿Cómo validar que la transacción solo se pueda hacer si la billetera que va a enviar los fondos
		tiene saldo suficiente?
*/
package main

import (
	"crypto/sha256"
	"encoding/hex"
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

type blockchain List[Block]

func generarHash(b Bloque) string {
	record := fmt.Sprintf("%v%v%v", b.timestamp, b.data, b.hashPrevio)
	h := sha256.New()
	h.Write([]byte(record))
	return hex.EncodeToString(h.Sum(nil))
}

func crearBloque(trans []Transaccion, prevHash string) Bloque {
	b := Bloque{
		timestamp:  time.Now(),
		data:       trans,
		hashPrevio: prevHash,
	}
	b.hash = generarHash(b)
	return b
}

func CalcularBalance(cadena List[Bloque], direccion string) int {
	saldo := 0
	for cadena != nil {
		for _, tx := range cadena.dato.Transacciones {
			if tx.Emisor == direccion {
				saldo -= tx.Monto
			}
			if tx.Receptor == direccion {
				saldo += tx.Monto
			}
		}
		cadena = cadena.sig
	}
	return saldo
}

func AgregarBloque(cadena *List[Bloque], trans []Transaccion) bool {
	for _, tx := range trans {
		if tx.emisor != "" && CalcularBalance(*cadena, tx.emisor) < tx.monto {
			fmt.Println("Transacción rechazada: saldo insuficiente para", tx.emisor)
			return false
		}
	}

	prevHash := ""
	if !IsEmpty(*cadena) {
		ultimo := *cadena
		for ultimo.sig != nil {
			ultimo = ultimo.sig
		}
		prevHash = ultimo.dato.Hash
	}

	nuevoBloque := crearBloque(trans, prevHash)
	PushBack(cadena, nuevoBloque)
	return true
}

func main() {

	blockchain := New[Bloque]()

	// Crear génesis (sin transacciones)
	genesis := crearBloque([]Transaccion{}, "")
	PushBack(&blockchain, genesis)

	// Agregar bloque con transacciones válidas
	tx1 := Transaccion{Emisor: "Alice", Receptor: "Bob", Monto: 50}
	tx2 := Transaccion{Emisor: "Bob", Receptor: "Charlie", Monto: 20}

	// Falla: Alice no tiene fondos
	AgregarBloque(&blockchain, []Transaccion{tx1}) // rechazado

	// Bloque válido: Bob recibe fondos
	tx0 := Transaccion{Emisor: "", Receptor: "Bob", Monto: 100}
	AgregarBloque(&blockchain, []Transaccion{tx0}) // minado OK

	AgregarBloque(&blockchain, []Transaccion{tx1}) // ahora sí OK
	AgregarBloque(&blockchain, []Transaccion{tx2}) // OK

	fmt.Println("Blockchain:")
	fmt.Println(ToString(blockchain))

	fmt.Println("Saldo de Bob:", CalcularBalance(blockchain, "Bob"))
	fmt.Println("Saldo de Alice:", CalcularBalance(blockchain, "Alice"))

}

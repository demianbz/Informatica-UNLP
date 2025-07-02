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
	return fmt.Sprintf("%s.%s", nombre, apellido) //Genero el id("NOMBRE.APELLIDO")
}

func crearBilletera(nombre, apellido string) Billetera { //Genera una nueva billetera con un ID simple usando nombre-apellido
	id := generarID(nombre, apellido)
	return Billetera{ID: id, Nombre: nombre, Apellido: apellido}
}

func enviarTransaccion(unMonto float64, emisorID, receptorID string) Transaccion { //Devuelve una transacción con datos del emisor, receptor, monto y tiempo actual
	return Transaccion{monto: unMonto, emisor: emisorID, receptor: receptorID, timestamp: time.Now()}
}

func insertarBloque(bc *blockchain, t Transaccion) { //Inserta un bloque nuevo a la blockchain, usando el hash del bloque anterior para encadenarlo.
	var hashPrevio string
	if len(*bc) == 0 { //Si la blockchain esta vacia, no tiene hash previo, es el inicio
		hashPrevio = "INICIO"
	} else { //Si no esta vacia busco el hash del ultimo bloque para enlazar el nuevo
		ultimoBloque := (*bc)[len(*bc)-1]
		hashPrevio = ultimoBloque.hash
	}
	//Obtengo la fecha actual del nuevo bloque
	timestamp := time.Now()
	//Concateno los datos importantes del bloque.
	datos := fmt.Sprintf("%s%s%s%f%s%s", hashPrevio, t.emisor, t.receptor, t.monto, t.timestamp.String(), timestamp.String())
	//Hago el hash del string resultante.	El hash es como para que el contenido sea unico, esto hace que no se pueda modificar un bloque sin invalidar toda la cadena que viene despues
	hash := sha256.Sum256([]byte(datos))
	//Lo paso a string hexadecimal para guardarlo
	hashBloque := fmt.Sprintf("%x", hash)

	//Creo el nuevo bloque
	nuevoBloque := Bloque{
		hash:       hashBloque,
		hashPrevio: hashPrevio,
		data:       t,
		timestamp:  timestamp,
	}

	//Agrego el nuevo bloque
	*bc = append(*bc, nuevoBloque)
}

func obtenerSaldo(bc blockchain, idUsuario string) float64 { //Recorro toda la blockchain y calculo el saldo de un usuario pasado como parametro
	saldo := 0.0
	for i := 0; i < len(bc); i++ {
		bloqueAct := bc[i]
		if bloqueAct.data.receptor == idUsuario { //El usario recibio dinero entonces sumo
			saldo += bloqueAct.data.monto
		}
		if bloqueAct.data.emisor == idUsuario { //El usuario envio dinero entonces resto
			saldo -= bloqueAct.data.monto
		}
	}
	return saldo
}

func calcularHashBloque(b Bloque) string {
	datos := fmt.Sprintf("%s%s%s%f%s%s",
		b.hashPrevio,
		b.data.emisor,
		b.data.receptor,
		b.data.monto,
		b.data.timestamp.String(),
		b.timestamp.String(),
	)
	hash := sha256.Sum256([]byte(datos))
	return fmt.Sprintf("%x", hash)
}

func validarBlockChain(bc blockchain) bool {
	if len(bc) == 0 {
		return false
	}

	bloqueInicio := bc[0]

	if bloqueInicio.hashPrevio != "INICIO" {
		return false
	}

	hashCalculo := calcularHashBloque(bloqueInicio)
	if bloqueInicio.hash != hashCalculo {
		return false
	}

	for i := 1; i < len(bc); i++ {
		bloqueAct := bc[i]
		bloqueAnt := bc[i-1]

		hashPrevioCalculo := calcularHashBloque(bloqueAnt)
		if bloqueAct.hashPrevio != hashPrevioCalculo {
			return false
		}

		hashActualCalculo := calcularHashBloque(bloqueAct)
		if bloqueAct.hash != hashActualCalculo {
			return false
		}

	}
	return true
}

func main() {
	var bc blockchain

	// Creo algunas billeteras
	alice := crearBilletera("Alice", "Smith")
	bob := crearBilletera("Bob", "Johnson")
	carol := crearBilletera("Carol", "Garcia")

	// Creo transacciones
	t1 := enviarTransaccion(100, alice.ID, bob.ID)
	t2 := enviarTransaccion(50, bob.ID, carol.ID)
	t3 := enviarTransaccion(25, carol.ID, alice.ID)

	// Inserto los bloques con esas transacciones
	insertarBloque(&bc, t1)
	insertarBloque(&bc, t2)
	insertarBloque(&bc, t3)

	// Muestro el saldo de cada usuario
	fmt.Printf("Saldo de %s: %.2f\n", alice.ID, obtenerSaldo(bc, alice.ID))
	fmt.Printf("Saldo de %s: %.2f\n", bob.ID, obtenerSaldo(bc, bob.ID))
	fmt.Printf("Saldo de %s: %.2f\n", carol.ID, obtenerSaldo(bc, carol.ID))

	// Valido la blockchain (debería ser true)
	fmt.Println("Blockchain válida?", validarBlockChain(bc))

	// Simulo manipulación: cambio monto de segundo bloque
	bc[1].data.monto = 9999

	// Valido la blockchain nuevamente (debería ser false)
	fmt.Println("Blockchain válida después de manipulación?", validarBlockChain(bc))

}

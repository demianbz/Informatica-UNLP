/*3- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:
b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar
Strings use el método equals.
 */
package ejercicio3p2;

import PaqueteLectura.Lector;
// import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author DEMIA
 */
public class Ejercicio3P2 {

	/**
	 * @param args the command line arguments
	 */
	public static void main(String[] args) {

		Persona[][] matriz = new Persona[5][8];

		int dimF = 40, dimTot = 0;

		int dni, edad;
		String nom;

		int dimlD = 0, dimlT = 0; //dimlD = dimL Dia (filas) y dimlT =dimL Turnos (columnas)

		System.out.print("Ingrese su Nombre: ");
		nom = Lector.leerString();
		System.out.println("------Dia " + (dimlD + 1) + "------");
		dimlT = 0;

		while (!nom.equals("ZZZ") && (dimlD < 5)) {
			System.out.println("Turno " + (dimlT));

			System.out.print("Ingrese su DNI: ");
			dni = Lector.leerInt();
			System.out.print("Ingrese su edad: ");
			edad = Lector.leerInt();

			matriz[dimlD][dimlT] = new Persona(nom, dni, edad);
			System.out.print("Ingrese su Nombre: ");
			nom = Lector.leerString();
			dimlT++;
			
			if (dimlT == 8) {
				dimlD++;
				dimlT = 0;
				System.out.println("------Dia " + (dimlD + 1) + "------");
			}
		}

		//dimlD++; //Si no le pongo condicion despues para imprimir es hasta dimL -1, si no puedo usar una condicion
		/*if(!nom.equals("ZZZ")) //Esta seria la otra opcion, si no llege a el corte sumo la dimL, porque sino llego al corte y la sumo igual
			  dimlD++;
		 */
		int i, j;

		for (i = 0; i < dimlD; i++) {     //Este for es para los dias que pueden estar incompletos
			System.out.println("---------Dia " + (i + 1) + "---------");
			for (j = 0; j < 8; j++) {    //Este es para los turnos que estan completos porque si dimlD es > 0 al menos un dia esta completo
				System.out.print("'Turno " + j +"'");
				System.out.println(" Nombre: " + matriz[i][j].getNombre());

			}
		}
		int k;
		System.out.println("---------Dia " + (i+1) + "---------");   //salgo del for de dias con el ultimo dia porque puso < y no <= ej si dimlD es = a 3 salgo en el 2 y queda dimL = 3
		for (k = 0; k < dimlT; k++) {    //Este for es para el dia que quedo incompleto, con turnos incompletos = k
			System.out.print("'Turno " + (k) +"'");
			System.out.println(" Nombre: " + matriz[i][k].getNombre());
		}

		System.out.println();
	}

}

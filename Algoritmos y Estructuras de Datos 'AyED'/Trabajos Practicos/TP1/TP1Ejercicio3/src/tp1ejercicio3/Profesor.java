/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp1ejercicio3;

/**
 *
 * @author DEMIA
 */
public class Profesor {
    private String nombre; 
    private String apellido; 
    private int catedra;     
    private String email;
    private String facultad;
    
    public Profesor (String unNombre , String unApellido , int cat , String unEmail , String unaFacu){
        nombre = unNombre;
        apellido = unApellido;
        catedra = cat;
        email = unEmail;
        facultad = unaFacu;
    }

    public String tusDatos(){
        String retorno;
        retorno = "Nombre "+ this.getNombre() + " Apellido "+ this.getApellido() + " Catedra "+ this.getCatedra()+ " Email "+ this.getEmail() + " Facultad "+ this.getFacultad();
        return retorno;
    }
    
    
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getCatedra() {
        return catedra;
    }

    public void setCatedra(int catedra) {
        this.catedra = catedra;
    }

    public String getFacultad() {
        return facultad;
    }

    public void setFacultad(String facultad) {
        this.facultad = facultad;
    }
    
    
    
    
}

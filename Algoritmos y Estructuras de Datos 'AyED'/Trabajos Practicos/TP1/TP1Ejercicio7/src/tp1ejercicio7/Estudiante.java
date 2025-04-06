/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp1ejercicio7;

/**
 *
 * @author DEMIA
 */
public class Estudiante {
    private String nombre; 
    private String apellido; 
    private int comision; 
    private String email; 
    private String direccion;
    
    
    public Estudiante (String unNombre , String unApellido , int com , String unEmail , String unaDire){
        nombre = unNombre;
        apellido = unApellido;
        comision = com;
        email = unEmail;
        direccion = unaDire;
    }

    public String tusDatos(){
        String retorno;
        retorno = "Nombre "+ this.getNombre() + " Apellido "+ this.getApellido() + " Comision "+ this.getComision() + " Email "+ this.getEmail() + " Direccion "+ this.getDireccion();
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

    public int getComision() {
        return comision;
    }

    public void setComision(int comision) {
        this.comision = comision;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    @Override
    public String toString(){
        return "Nombre "+ this.getNombre() + " Apellido "+ this.getApellido() + " Comision "+ this.getComision() + " Email "+ this.getEmail() + " Direccion "+ this.getDireccion();
    }
    
    
}

    


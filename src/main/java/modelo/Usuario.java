/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author andre
 */
public class Usuario {
    
    int id;
    String email;
    String pass;

    public Usuario() {
    }

    public Usuario(String email, String pass) {
        this.email = email;
        this.pass = pass;
    }

    public Usuario(int id, String email, String pass) {
        this.id = id;
        this.email = email;
        this.pass = pass;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    @Override
    public String toString() {
        return "Usuario{" + "id=" + id + ", email=" + email + ", pass=" + pass + '}';
    }
    
    
       
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Usuario;

public class Dao {
    
    Conexion con = new Conexion();
    Connection cn;
    PreparedStatement ps;
    ResultSet rs;
    
    public boolean insert (String email, String pass){
       
        String insert = "INSERT INTO `usuario` (`email`, `pass`) VALUES(?,?)";
        
        try{            
                cn = con.Conectar();              
                ps = cn.prepareStatement(insert);
                ps.setString(1, email);
                ps.setString(2, pass);
                ps.executeUpdate();
                con.Desconectar();
                return true;                
           
            }catch(Exception e){
                System.err.println("erro" + e);  
                return false;
            }finally{
                con.Desconectar();
            }        
    }
    
     public Usuario login(String email, String pass){
         String login = "SELECT * FROM usuario WHERE email = ? AND pass = ? ";
         Usuario us = null;
         try {
             cn=con.Conectar();
             ps=cn.prepareStatement(login);
             ps.setString(1,email);
             ps.setString(2,pass);
             rs=ps.executeQuery();
             while (rs.next()) { 
                 us = new Usuario();
                 us.setId(rs.getInt("id"));
                 us.setEmail(rs.getString("email"));
                 us.setPass(rs.getString("pass"));                 
             }             
         } catch (Exception e) {             
             System.out.println("Error: "+e);
         }finally{
              if (cn == null) {
                con.Desconectar();
            }
         }
         return us;
     }     
    
    public List<Usuario> list(){
        List<Usuario> listaUsuarios = new ArrayList<Usuario>();
        String consulta = "SELECT * FROM usuario";
        
        try {
            cn = con.Conectar();
            ps = cn.prepareStatement(consulta);
            rs = ps.executeQuery();
            while (rs.next()) {                
                int id = rs.getInt(1);
                String email = rs.getString(2);
                String pass = rs.getString(3);
                Usuario u = new Usuario(id, email, pass);
                listaUsuarios.add(u);                
            }
            con.Desconectar();
            
        } catch (Exception e) {
           
        }finally{
            if (con == null) {
                con.Desconectar();
            }
        }
        return listaUsuarios;
    }
    
    public Usuario getById(int id){
        Usuario u = new Usuario();
        String get = "SELECT * FROM usuario WHERE id = ?";
        
        try {
            cn = con.Conectar();
            ps= cn.prepareStatement(get);
            ps.setInt(1,id);
            rs=ps.executeQuery();
            while(rs.next()){
               u.id = rs.getInt("id");
               u.email = rs.getString("email");
               u.pass = rs.getString("pass");              
            }            
            con.Desconectar();  
            return u; 
        } catch (Exception e) {   
            System.err.println("erro" + e);  
            return null;
        }finally{
            if (con == null) {
                con.Desconectar();
            }
        }
    }
    
    public int update(Usuario u){        
        int fila = 0;
        String update = "UPDATE usuario SET email = ?, pass = ? where id = ?";
        try {
            cn = con.Conectar();
            ps=cn.prepareStatement(update);
            ps.setString(1,u.email);
            ps.setString(2,u.pass);
            ps.setInt(3,u.id);
            fila=ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }finally{
            if (con == null) {
                con.Desconectar();
            }
        }
           return fila; 
        }
    
    public boolean eliminar(int id) throws SQLException{
        String del = "delete from usuario where id = ?";
        try {
          cn=con.Conectar();           
          ps=cn.prepareStatement(del); 
          ps.setInt(1, id);
          ps.executeUpdate();
          con.Desconectar();
          return true;
            
        }catch(Exception e){
            return false;
        } finally {
            if(con==null){
            con.Desconectar();
                    }
        }
        
    }
    
}

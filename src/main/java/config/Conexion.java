/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author andre
 */
package config;

import java.sql.*;
import java.sql.SQLException;

/**
 *
 * @author jfgut
 */
public class Conexion {
    
    
    public static final String USERNAME = "root";
    public static final String PASSWORD = "";
    public static final String HOST = "localhost";
    public static final String PORT = "3306";
    public static final String DATABASE = "pru";
    public static final String CLASSNAME = "com.mysql.jdbc.Driver";
    public static final String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE+"?zeroDateTimeBehavior=CONVERT_TO_NULL";
    
    public java.sql.Connection con;
    
     public Conexion() {
    }
    
     public Connection Conectar() {
        try {
            Class.forName(CLASSNAME);
            con= DriverManager.getConnection(URL, USERNAME, PASSWORD);
            System.out.println("Conexion exitosa");
        } catch (ClassNotFoundException e) {
            System.out.println("Error driver no encontrado" + e);
            return null;
        }catch(SQLException e){
            System.out.println("Error en SQL"+e);
            return null;
        }
        return con;
    }
     
     public void Desconectar(){
         try{
             if(con!=null){
             con.close();
             }
         }catch(SQLException e){
             e.printStackTrace();
         }
     }
     
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilerias;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

/**
 * @author Esmeralda Estefania Rodríguez Ramos
 * @version 1 09/03/2019
 * 
 **/
public class Conexion {
      private static String ipAddress;
    private static String dbName;
    private static String user;
    private static String password;
    private static String service;
    private static ResourceBundle propiedadesBD;
    
    
    public static Connection getConexion() throws SQLException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        if (propiedadesBD == null) {
            propiedadesBD = ResourceBundle.getBundle("Properties");
            ipAddress = propiedadesBD.getString("host");
            dbName = propiedadesBD.getString("nombreBD");
            user = propiedadesBD.getString("usuario");
            password = propiedadesBD.getString("contrasenia");
            service = propiedadesBD.getString("servicio");
        }
        return DriverManager.getConnection("jdbc:sqlserver://"+ipAddress+":"+service+";databaseName="+dbName+";user="+user+";password="+password);
    }
    public static void main(String[] args) throws SQLException {
        Connection con = Conexion.getConexion() ;
            if(con !=null){
                System.out.println("Conexion");
                con.close();
            }else{
                System.out.println("Error");
            }
    }
}

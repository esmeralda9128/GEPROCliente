
package utilerias;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

/**
 *Esta clase sirve para conectarse a la base de datos en este caso es a SQL
 * Server Se de tener el .jar par sqlserver
 *
 * @author Esmeralda Estefania Rodríguez Ramos
 * @version 1 09/03/2019
 *
 *
 */
public class Conexion {

    /**
     * Establece la conexión a la base de datos se debe incluir la excepción
     * SQLException return regresa la conexión
     *
     * @return retorna la conexión
     * @throws java.sql.SQLException esta Expción sirve en caso de que no se
     * logre la conexión
     *
     */
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
        return DriverManager.getConnection("jdbc:sqlserver://" + ipAddress + ":" + service + ";databaseName=" + dbName + ";user=" + user + ";password=" + password);
    }

    /**
     * Método para comprobar que se establece la conexión
     *
     * @param args solo es el String por defecto
     * @throws java.sql.SQLException esta Expción sirve en caso de que no se
     * logre la conexión
     */
    public static void main(String[] args) throws SQLException {
        Connection con = Conexion.getConexion();
        if (con != null) {
            System.out.println("Conexion");
            con.close();
        } else {
            System.out.println("Error");
        }

        /**
         * @param con regresa la conexión y se utiliza para validar si se pudo
         * establecer o no
         */
    }
}

package utez.edu.modelo.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utez.edu.modelo.bean.BeanUsuario;
import utilerias.Conexion;

/**
 * Esta clase se utiliza para hacer métodos entre la aplicación y la base de
 * datos, referente a la tabla usuario
 *
 * @author Esmeralda Estefania Rodríguez Ramos
 * @version 1 15/03/2019
 *
 */
public class DaoUsuario {

    private ResultSet rs;
    private PreparedStatement psm;
    private Connection con;
    private CallableStatement csm;
    private boolean resultado;

    /**
     * Método para consultar el Líder un Proyecto
     *
     * @param idProyecto, es el id para saber a que proyecto pertenece
     * @return BeanUsuario regresa si encuentra un Líder de Proyecto que concida
     * con ese proyecto
     *
     *
     */
    public BeanUsuario consultarLiderdeProyecto(int idProyecto) {
        BeanUsuario usuarioConsultado = null;
        try {
            con = Conexion.getConexion();
            psm = con.prepareStatement("select * from usuario where idProyecto=?");
            psm.setInt(1, idProyecto);
            rs = psm.executeQuery();
            if (rs.next()) {
                usuarioConsultado = new BeanUsuario();
                usuarioConsultado.setId(rs.getInt("idUsuario"));
                usuarioConsultado.setNombre(rs.getString("nombre"));
                usuarioConsultado.setPrimerApellido(rs.getString("primerApellido"));
                usuarioConsultado.setSegundoApellido(rs.getString("segundoApellido"));
            }
        } catch (SQLException ex) {
            System.out.println("Error DaoCuenta verificarNombredeLider()" + ex);

        } finally {
            try {
                con.close();
                psm.close();

            } catch (SQLException ex) {
                System.out.println("Error DaoCuenta verificarNombredeLider()cerrar" + ex);
            }
        }

        return usuarioConsultado;
    }
    
    
     public BeanUsuario consultarUsuario(String usuario, String pass) {
        BeanUsuario usuarioConsultado = null;
        try {
            con = Conexion.getConexion();
            psm = con.prepareStatement("select * from usuario where usuario=? and pass=?");
            psm.setString(1, usuario);
            psm.setString(2, pass);
            rs = psm.executeQuery();
            if (rs.next()) {
                usuarioConsultado = new BeanUsuario();
                usuarioConsultado.setId(rs.getInt("idUsuario"));
                usuarioConsultado.setNombre(rs.getString("nombre"));
                usuarioConsultado.setPrimerApellido(rs.getString("primerApellido"));
                usuarioConsultado.setSegundoApellido(rs.getString("segundoApellido"));
                usuarioConsultado.setUsuario(rs.getString("usuario"));
                usuarioConsultado.setPass(rs.getString("pass"));
                usuarioConsultado.setRol(rs.getString("rol"));
                usuarioConsultado.setSalario(rs.getDouble("salario"));
                usuarioConsultado.setGradoEstudios(rs.getString("carrera"));
                usuarioConsultado.setRfc(rs.getString("rfc"));
                usuarioConsultado.setEmail(rs.getString("email"));
                usuarioConsultado.setTipo(rs.getInt("tipo"));
                usuarioConsultado.setIdProyecto(rs.getInt("idProyecto"));
            }
        } catch (SQLException ex) {
            System.out.println("Error DaoCuenta verificarNombredeLider()" + ex);

        } finally {
            try {
                con.close();
                psm.close();

            } catch (SQLException ex) {
                System.out.println("Error DaoCuenta verificarNombredeLider()cerrar" + ex);
            }
        }

        return usuarioConsultado;
    }
     
      public BeanUsuario consultarAdministrador(String usuario, String pass) {
        BeanUsuario usuarioConsultado = null;
        try {
            con = Conexion.getConexion();
            psm = con.prepareStatement("select * from administrador where usuario=? and pass=?");
            psm.setString(1, usuario);
            psm.setString(2, pass);
            rs = psm.executeQuery();
            if (rs.next()) {
                usuarioConsultado = new BeanUsuario();
                usuarioConsultado.setId(rs.getInt("idAdministrador"));
                usuarioConsultado.setNombre(rs.getString("nombre"));
                usuarioConsultado.setUsuario(rs.getString("usuario"));
                usuarioConsultado.setPass(rs.getString("pass"));
            }
        } catch (SQLException ex) {
            System.out.println("Error DaoCuenta verificarNombredeLider()" + ex);

        } finally {
            try {
                con.close();
                psm.close();

            } catch (SQLException ex) {
                System.out.println("Error DaoCuenta verificarNombredeLider()cerrar" + ex);
            }
        }

        return usuarioConsultado;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utez.edu.modelo.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utez.edu.modelo.bean.BeanUsuario;
import utilerias.Conexion;

/**
 *
 * @author horo_
 */
public class DaoUsuario {

    private ResultSet rs;
    private PreparedStatement psm;
    private Connection con;
    private CallableStatement csm;
    private boolean resultado;

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
                System.out.println("Nombre del lider " + usuarioConsultado.getNombre());
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
}

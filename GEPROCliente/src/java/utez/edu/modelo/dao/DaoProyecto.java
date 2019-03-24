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
import java.util.ArrayList;
import java.util.List;
import utez.edu.modelo.bean.BeanProyecto;
import utez.edu.modelo.bean.BeanUsuario;
import utilerias.Conexion;

/**
 *
 * @author horo_
 */
public class DaoProyecto {

    private ResultSet rs;
    private PreparedStatement psm;
    private Connection con;
    private CallableStatement csm;
    private boolean resultado;

    public boolean registrarProyecto(BeanProyecto beanProyecto, BeanUsuario beanUsuario) {
        try {
            con = Conexion.getConexion();
            csm = con.prepareCall("{call dbo.pa_registrarProyecto (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            csm.setString(1, beanProyecto.getNombre());
            csm.setString(2, beanProyecto.getInicioProyecto());
            csm.setString(3, beanProyecto.getFinalProyecto());
            csm.setInt(4, beanProyecto.getSemanas());
            csm.setDouble(5, beanProyecto.getPresupuestoInicial());
            csm.setDouble(6, beanProyecto.getReserva());
            csm.setString(7, beanUsuario.getNombre());
            csm.setString(8, beanUsuario.getPrimerApellido());
            csm.setString(9, beanUsuario.getSegundoApellido());
            csm.setString(10, beanUsuario.getUsuario());
            csm.setString(11, beanUsuario.getPass());
            csm.setDouble(12, beanUsuario.getSalario());
            csm.setString(13, beanUsuario.getGradoEstudios());
            csm.setString(14, beanUsuario.getCarrera());
            csm.setString(15, beanUsuario.getRfc());
            csm.setString(16, beanUsuario.getEmail());
            resultado = csm.executeUpdate() == 1;
        } catch (SQLException ex) {
            System.out.println("Error DaoCuenta registroCuenta()" + ex);

        } finally {

            try {
                con.close();
                csm.close();
            } catch (SQLException ex) {
                System.out.println("Error DaoCuenta registroCuenta()cerrar" + ex);
            }
        }
        return true;
    }

    public BeanProyecto verificarNombredeProyecto(BeanProyecto beanProyecto) {
        BeanProyecto proyectoConsultado = null;
        try {
            con = Conexion.getConexion();
            psm = con.prepareStatement("select * from proyecto where nombre=?");
            psm.setString(1, beanProyecto.getNombre());
            rs = psm.executeQuery();
            while (rs.next()) {
                proyectoConsultado = new BeanProyecto();
                proyectoConsultado.setNombre(rs.getString("nombre"));
            }
        } catch (SQLException ex) {
            System.out.println("Error DaoCuenta verificarNombredeProyecto()" + ex);
        } finally {
            try {
                con.close();
                psm.close();
                rs.close();
            } catch (SQLException ex) {
                System.out.println("Error DaoCuenta verificarNombredeProyecto()cerrar" + ex);
            }
        }

        return proyectoConsultado;
    }

    public BeanUsuario verificarNombredeLider(BeanUsuario beanUsuario) {
        BeanUsuario usuarioConsultado = null;
        try {
            con = Conexion.getConexion();
            psm = con.prepareStatement("select * from usuario where nombre=? and primerApellido=? and segundoApellido=?");
            psm.setString(1, beanUsuario.getNombre());
            psm.setString(2, beanUsuario.getPrimerApellido());
            psm.setString(3, beanUsuario.getSegundoApellido());
            rs = psm.executeQuery();
            while (rs.next()) {
                usuarioConsultado = new BeanUsuario();
                usuarioConsultado.setNombre(rs.getString("nombre"));
            }
        } catch (SQLException ex) {
            System.out.println("Error DaoCuenta verificarNombredeLider()" + ex);
        } finally {
            try {
                con.close();
                psm.close();
                rs.close();
            } catch (SQLException ex) {
                System.out.println("Error DaoCuenta verificarNombredeLider()cerrar" + ex);
            }
        }

        return usuarioConsultado;
    }

    public List<BeanProyecto> consultarProyectos() {
        List<BeanProyecto> proyectos = new ArrayList<>();
        BeanProyecto proyecto = null;
        try {
            con = Conexion.getConexion();
            psm = con.prepareStatement("select * from proyecto");
            rs = psm.executeQuery();
            while (rs.next()) {
                proyecto = new BeanProyecto();
                proyecto.setIdProyecto(rs.getInt("idProyecto"));
                proyecto.setNombre(rs.getString("nombre"));
                proyecto.setInicioProyecto(rs.getString("inicioProyecto"));
                proyecto.setFinalProyecto(rs.getString("finalProyecto"));
                proyecto.setSemanas(rs.getInt("semanas"));
                proyecto.setPresupuestoInicial(rs.getDouble("presupuestoInicial"));
                proyecto.setReserva(rs.getDouble("reserva"));
                DaoUsuario dao = new DaoUsuario();
                proyecto.setLider(dao.consultarLiderdeProyecto(proyecto.getIdProyecto()));
                proyectos.add(proyecto);
            }
        } catch (SQLException ex) {
            System.out.println("Error DaoCuenta consultarProyectos()" + ex);
        } finally {
            try {
                con.close();
                psm.close();
            } catch (SQLException ex) {
                System.out.println("Error DaoCuenta consultarProyectos()cerrar" + ex);
            }
        }

        return proyectos;
    }

   
}

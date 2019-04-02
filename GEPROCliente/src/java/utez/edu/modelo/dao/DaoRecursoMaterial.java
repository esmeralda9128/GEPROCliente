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
import utez.edu.modelo.bean.BeanRecursoMaterial;
import utilerias.Conexion;

/**
 *
 * @author horo_
 */
public class DaoRecursoMaterial {
     private ResultSet rs;
    private PreparedStatement psm;
    private Connection con;
    private CallableStatement csm;
    private boolean resultado;
    
    public List<BeanRecursoMaterial> listaRecursos(int idProyecto){
        List<BeanRecursoMaterial> recursos = new ArrayList<>();
        BeanRecursoMaterial recurso;
         try {
            con = Conexion.getConexion();
            psm = con.prepareStatement("select * from recursosMateriales where idProyecto=?");
            psm.setInt(1, idProyecto);
            rs = psm.executeQuery();
            while (rs.next()) {
             recurso = new BeanRecursoMaterial();
             recurso.setIdProyecto(rs.getInt("idRecursosMateriales"));
             recurso.setNombreRecursoMat(rs.getString("nombre"));
             recurso.setCostoUnitario(rs.getDouble("costoUnitario"));
             recurso.setCantidad(rs.getInt("cantidad"));
             recurso.setTotal(rs.getInt("total"));
             recurso.setIdProyecto(rs.getInt("idProyecto"));
             recursos.add(recurso);
            }
         }catch(SQLException ex){
             System.out.println("Error DaoRecursoMaterial listaRecursos" + ex);
         }finally {
            try {
                con.close();
                psm.close();

            } catch (SQLException ex) {
                System.out.println("Error DaoRecursoMaterial listaRecursos()cerrar" + ex);
            }
        }
        return recursos;
    }

        
        
        
    
    
}

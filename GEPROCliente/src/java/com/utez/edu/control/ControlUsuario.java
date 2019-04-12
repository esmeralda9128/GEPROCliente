/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utez.edu.control;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import utez.edu.modelo.bean.BeanUsuario;
import utilerias.Conexion;

/**
 *
 * @author Alberto
 */
public class ControlUsuario extends ActionSupport{
    private Map respuesta;
    private List myList;
    private Connection conexion;
    private Map<String,Object> parametros;
    private int idProyectoReporte;
    
    public String reporteNominas(){
      try{
            conexion = Conexion.getConexion();
            myList = new ArrayList<>();
            parametros = new HashMap<String,Object>();
            parametros.put("idProyecto", idProyectoReporte);
            parametros.put("context", "http://localhost:8080/GEPROCliente/imagenes/");
        }catch (Exception r){
            System.out.println("Error en metodo reporteNominas 'GetMyList' " +r);
        }  
      
      return SUCCESS;
    }
    
    public String reporteMaterialesComprados(){
      try{
            conexion = Conexion.getConexion();
            myList = new ArrayList<>();
            parametros = new HashMap<String,Object>();
            parametros.put("idProyecto", idProyectoReporte);
            parametros.put("context", "http://localhost:8080/GEPROCliente/imagenes/");
        }catch (Exception r){
            System.out.println("Error en metodo reporteNominas 'GetMyList' " +r);
        }  
      
      return SUCCESS;
    }
    
    public String redireccion(){
        System.out.println(respuesta.get("numero"));
        
        return SUCCESS;
    }
    
    public Map getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(Map respuesta) {
        this.respuesta = respuesta;
    }

    public List getMyList() {
        return myList;
    }

    public void setMyList(List myList) {
        this.myList = myList;
    }

    public Connection getConexion() {
        return conexion;
    }

    public void setConexion(Connection conexion) {
        this.conexion = conexion;
    }

    public Map<String, Object> getParametros() {
        return parametros;
    }

    public void setParametros(Map<String, Object> parametros) {
        this.parametros = parametros;
    }

    public int getIdProyectoReporte() {
        return idProyectoReporte;
    }

    public void setIdProyectoReporte(int idProyectoReporte) {
        this.idProyectoReporte = idProyectoReporte;
    }
    
}

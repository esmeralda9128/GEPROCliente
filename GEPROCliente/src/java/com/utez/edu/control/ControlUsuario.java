/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utez.edu.control;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import utez.edu.modelo.bean.BeanUsuario;

/**
 *
 * @author Alberto
 */
public class ControlUsuario  extends ActionSupport{
    private Map respuesta;

    
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
  
}

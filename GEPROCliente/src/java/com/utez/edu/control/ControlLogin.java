/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utez.edu.control;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import utez.edu.modelo.bean.BeanUsuario;

/**
 *
 * @author Alberto
 */
public class ControlLogin extends ActionSupport implements SessionAware{
    private Map session;
    private BeanUsuario miUsuario = null;
    private String mensaje;
    

    @Override
    public void setSession(Map<String, Object> map) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

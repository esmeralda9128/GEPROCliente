/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utez.edu.struts;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import utez.edu.modelo.dao.DaoUsuario;

/**
 *
 * @author horo_
 */
public class Interceptor extends ActionSupport implements SessionAware{
private Map respuestas = new HashMap();
Map sesion;
    DaoUsuario daoUsuario = new DaoUsuario();
    
    @Override
    public void setSession(Map<String, Object> map) {
        sesion= map;
    }
    
//    public String entrar()throws SQLException,{
//        
//        boolean resultado = daoUsuario.consultarUsuario(SUCCESS, NONE)
//    }
    
}

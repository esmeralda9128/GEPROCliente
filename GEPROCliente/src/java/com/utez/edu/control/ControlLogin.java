package com.utez.edu.control;

import com.google.gson.Gson;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import utez.edu.modelo.bean.BeanUsuario;
import utez.edu.modelo.dao.DaoUsuario;

public class ControlLogin extends ActionSupport implements SessionAware{
    private Map session;
    private BeanUsuario beanUsuario = null;
    private String parametros;
    private String mensaje;
    private String dir = null;
    private DaoUsuario daoUsuario= null;
    
    public String inicial(){
        return SUCCESS;
    }
    
    public String loginWeb(){
        daoUsuario = new DaoUsuario();
        //Obtengo la sesión vacía
        session = ActionContext.getContext().getSession();
        dir = "/index.jsp";
        //Valido datos de inicio de Sesión
        beanUsuario=new Gson().fromJson(parametros,BeanUsuario.class);
        beanUsuario  = daoUsuario.consultarUsuario(beanUsuario.getUsuario(),beanUsuario.getPass());
        if (beanUsuario != null) {
            //Damos mensaje y agregamos datos a sesion
            session.put("rol", getBeanUsuario().getRol());
            session.put("user", getBeanUsuario().getId());
            mensaje = "Bienvenido";
            if (getBeanUsuario().getRol().equals("Administrador")) {
                dir ="/Vistas/Administrador/inicioAdministrador.jsp";
            }else{
                dir ="/Vistas/LiderdeProyecto/inicioLiderdeProyecto.jsp";
            }
            
        }
        parametros="";
        return SUCCESS;
        
    }

    public String logOut(){
        System.out.println("salio de sesion");
        session = ActionContext.getContext().getSession();
        session.clear();
        return SUCCESS;
    }
    
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public BeanUsuario getBeanUsuario() {
        return beanUsuario;
    }

    public void setBeanUsuario(BeanUsuario beanUsuario) {
        this.beanUsuario = beanUsuario;
    }


    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getMensaje() {
        return mensaje;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public String getParametros() {
        return parametros;
    }

    public void setParametros(String parametros) {
        this.parametros = parametros;
    }
    
    
}

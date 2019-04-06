/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utez.edu.struts;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import java.util.Map;

/**
 *
 * @author horo_
 */
public class Interceptor extends AbstractInterceptor{
    
//    public String entrar()throws SQLException,{
//        
//        boolean resultado = daoUsuario.consultarUsuario(SUCCESS, NONE)
//    }

    @Override
    public String intercept(ActionInvocation ai) throws Exception {
        Map session = ActionContext.getContext().getSession();
        System.out.println("Se realizan actividades antes de la ejecución");
        System.out.println(":> " + session.get("rol"));
        System.out.println("Se realizan actividades antes de la ejecución");
        if (session.get("user") != null) {
            return ai.invoke();
        } else {
            System.out.println("Entra en el nologin");
            return "NOLOGIN";
        }   
    }
    
    @Override
    public void destroy(){
        System.out.println("Se destruye lo creado.");
    }
    
    @Override
    public void init(){
        System.out.println("Se crean datos para interceptor.");
    }
}

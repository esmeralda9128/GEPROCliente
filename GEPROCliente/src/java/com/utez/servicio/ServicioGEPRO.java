/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utez.servicio;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.core.Application;
import javax.ws.rs.ApplicationPath;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.json.JSONException;
import org.json.JSONObject;
import utez.edu.modelo.bean.BeanProyecto;
import utez.edu.modelo.bean.BeanUsuario;
import utez.edu.modelo.dao.DaoProyecto;

/**
 *
 * @author Esmeralda Estefanía Rodríguez Ramos
 * @version 15/03/2019
 */
@ApplicationPath("/servicioGEPRO")
@Path("/proyecto")
public class ServicioGEPRO extends Application {

    String mensaje = "";
    String tipo = "";
    Map respuestas = new HashMap();

    @GET
    @Path("registroProyecto")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response registrarProyecto(@QueryParam("proyecto") String proyecto, @QueryParam("usuario") String usuario) throws ParseException {
        DaoProyecto daoProyecto = new DaoProyecto();
        JSONObject proyectoJ = null;
        JSONObject usuarioJ = null;
        BeanProyecto beanProyecto = null;
        BeanUsuario beanUsuario = null;
        String conpass = "";

        try {
            proyectoJ = new JSONObject(proyecto);
            usuarioJ = new JSONObject(usuario);
            beanProyecto = new BeanProyecto(proyectoJ.getString("nombre"), proyectoJ.getString("fecha"), Integer.parseInt(proyectoJ.getString("semanas")), Double.parseDouble(proyectoJ.getString("presupuesto")), Double.parseDouble(proyectoJ.getString("reserva")));
            beanUsuario = new BeanUsuario(usuarioJ.getString("nombre"), usuarioJ.getString("apellidoP"), usuarioJ.getString("apellidoM"), usuarioJ.getString("usuario"), usuarioJ.getString("pass"), usuarioJ.getString("grado"), usuarioJ.getString("carrera"), usuarioJ.getString("rfc"), usuarioJ.getString("email"), Double.parseDouble(usuarioJ.getString("salario")));
            conpass = usuarioJ.getString("conpass");
        } catch (JSONException ex) {
            System.out.println("Error" + ex);
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String inico = beanProyecto.getInicioProyecto();
        java.util.Date fechaInicio = sdf.parse(inico);
        Date fechaFin = sumarDiasAFecha(fechaInicio, ((beanProyecto.getSemanas() * 7) - 2));
        String fechaFinString = sdf.format(fechaFin);
        beanProyecto.setFinalProyecto(fechaFinString);

        Calendar fecha = new GregorianCalendar();

        int año = fecha.get(Calendar.YEAR);
        int mes = fecha.get(Calendar.MONTH);
        int dia = fecha.get(Calendar.DAY_OF_MONTH);
        String actual = "" + año + "-" + (mes + 1) + "-" + dia;
        java.util.Date fechadateactual = sdf.parse(actual);

        if (conpass.equals(beanUsuario.getPass())) {
            if (fechadateactual.before(fechaInicio)) {
                if(beanProyecto.getPresupuestoInicial()>beanUsuario.getSalario()){
                if (daoProyecto.verificarNombredeLider(beanUsuario) == null) {
                    if (daoProyecto.verificarNombredeProyecto(beanProyecto) == null) {
                        if (daoProyecto.registrarProyecto(beanProyecto, beanUsuario)) {
                            mensaje = "Se ha registrado el Proyecto Correctamente";
                            tipo = "success";
                        } else {
                            mensaje = "No se ha podido registrar el proyecto";
                            tipo = "error";
                        }
                    } else {
                        mensaje = "Ya existe un Proyecto con ese nombre";
                        tipo = "error";
                    }
                } else {
                    mensaje = "Ese usuario ya esta asignado a otro Proyecto";
                    tipo = "error";
                }
                }else{
                     mensaje = "El salario del Líder de Proyecto no puede ser mayor al Presupuesto";
                    tipo = "error";
                }               
                
            } else {
                mensaje = "No puedes iniciar un proyecto antes de la fecha actual";
                tipo = "error";
            }
        } else {
            mensaje = "Las contraseñas no coinciden";
            tipo = "error";
        }
        System.out.println(mensaje);
        List<BeanProyecto> proyectos = daoProyecto.consultarProyectos();
        respuestas.put("proyectos", proyectos);
        respuestas.put("mensaje", mensaje);
        respuestas.put("tipo", tipo);
        try {

            proyectoJ.put("respuesta", respuestas);

        } catch (JSONException e) {
            System.out.println("Error" + e);
        }
        Response.ResponseBuilder constructor = Response.ok(proyectoJ.toString());

        constructor.header(
                "Access-Control-Allow-Origin", "*");
        constructor.header(
                "Access-Control-Allow-Methods", "*");
        return constructor.build();
    }

    @GET
    @Path("consultarProyectos")
    @Produces(MediaType.APPLICATION_JSON)
    public Response consultarProyectos() {
        DaoProyecto daoProyecto = new DaoProyecto();
        List<BeanProyecto> proyectos = daoProyecto.consultarProyectos();
        respuestas.put("proyectos", proyectos);
        JSONObject objeto = new JSONObject();
        try {

            objeto.put("respuesta", respuestas);

        } catch (JSONException e) {
            System.out.println("Error" + e);
        }
        Response.ResponseBuilder constructor = Response.ok(objeto.toString());
        constructor.header("Access-Control-Allow-Origin", "*");
        constructor.header("Access-Control-Allow-Methods", "*");
        return constructor.build();

    }

    public static Date sumarDiasAFecha(Date fecha, int dias) {
        if (dias == 0) {
            return fecha;
        }
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(fecha);
        calendar.add(Calendar.DAY_OF_YEAR, dias);
        return calendar.getTime();
    }
}

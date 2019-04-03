/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utez.servicio;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import utez.edu.modelo.bean.BeanRecursoMaterial;
import utez.edu.modelo.bean.BeanUsuario;
import utez.edu.modelo.dao.DaoProyecto;
import utez.edu.modelo.dao.DaoRecursoMaterial;
import utez.edu.modelo.dao.DaoUsuario;

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
    public static int idProyectoGlobal;

    @GET
    @Path("loginWeb")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response login(@QueryParam("usuario") String usuario) throws ParseException {
        DaoUsuario daoUsuario = new DaoUsuario();
        JSONObject usuarioJ = null;
        int tipoUsuario = 0;
        try {
            usuarioJ = new JSONObject(usuario);

            BeanUsuario usuarioConsultado = daoUsuario.consultarUsuario(usuarioJ.getString("usuario"), usuarioJ.getString("pass"));
            if (usuarioConsultado == null) {
                usuarioConsultado = daoUsuario.consultarAdministrador(usuarioJ.getString("usuario"), usuarioJ.getString("pass"));
                if (usuarioConsultado == null) {
                    mensaje = "Usuario o Contraseña incorrectos";
                    tipo = "error";
                } else {
                    mensaje = "Bienvenido " + usuarioConsultado.getNombre();
                    tipo = "success";
                    tipoUsuario = 1;
                }
            } else if (usuarioConsultado.getTipo() == 2) {
                mensaje = "Bienvenido " + usuarioConsultado.getNombre() + " " + usuarioConsultado.getPrimerApellido() + " " + usuarioConsultado.getSegundoApellido();
                tipo = "success";
                tipoUsuario = usuarioConsultado.getTipo();
                idProyectoGlobal = usuarioConsultado.getIdProyecto();
            } else {
                mensaje = "Usuario o Contraseña incorrectos";
                tipo = "error";
                tipoUsuario = usuarioConsultado.getTipo();
                idProyectoGlobal = usuarioConsultado.getIdProyecto();
            }
        } catch (JSONException ex) {
            System.out.println("Error" + ex);
        }
        respuestas.put("mensaje", mensaje);
        respuestas.put("tipo", tipo);
        respuestas.put("tipoUsuario", tipoUsuario);
        respuestas.put("idProyecto", idProyectoGlobal);

        try {
            usuarioJ.put("respuesta", respuestas);

        } catch (JSONException e) {
            System.out.println("Error" + e);
        }

        Response.ResponseBuilder constructor = Response.ok(usuarioJ.toString());
        constructor.header("Access-Control-Allow-Origin", "*");
        constructor.header("Access-Control-Allow-Methods", "*");
        return constructor.build();
    }

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
        boolean bandera = false;
        boolean registro = false;
        try {
            proyectoJ = new JSONObject(proyecto);
            usuarioJ = new JSONObject(usuario);
            beanProyecto = new BeanProyecto(proyectoJ.getString("nombre"), proyectoJ.getString("fecha"), Integer.parseInt(proyectoJ.getString("semanas")), Double.parseDouble(proyectoJ.getString("presupuesto")), Double.parseDouble(proyectoJ.getString("reserva")));
            beanUsuario = new BeanUsuario(usuarioJ.getString("nombre"), usuarioJ.getString("apellidoP"), usuarioJ.getString("apellidoM"), usuarioJ.getString("usuario"), usuarioJ.getString("pass"), usuarioJ.getString("grado"), usuarioJ.getString("carrera"), usuarioJ.getString("rfc"), usuarioJ.getString("email"), Double.parseDouble(usuarioJ.getString("salario")));
            conpass = usuarioJ.getString("conpass");
            if (usuarioJ.getString("rfc").length() == 0 || usuarioJ.getString("email").length() == 0 || (usuarioJ.getString("salario").length() == 0)) {
                mensaje = "No puedes enviar campos vacios";
                tipo = "error";
            } else {
                bandera = true;
            }
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
        if (bandera) {
            if (conpass.equals(beanUsuario.getPass())) {
                if (fechadateactual.before(fechaInicio)) {
                    if (beanProyecto.getPresupuestoInicial() > beanUsuario.getSalario()) {
                        if (daoProyecto.verificarNombredeLider(beanUsuario) == null) {
                            if (daoProyecto.verificarNombredeProyecto(beanProyecto) == null) {
                                registro = daoProyecto.registrarProyecto(beanProyecto, beanUsuario);
                                if (registro) {
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
                    } else {
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
        }

        List<BeanProyecto> proyectos = daoProyecto.consultarProyectos();
        respuestas.put("proyectos", proyectos);
        respuestas.put("mensaje", mensaje);
        respuestas.put("tipo", tipo);
        respuestas.put("registro", registro);
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

    @GET
    @Path("eliminarProyecto")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response elimiarProyecto(@QueryParam("proyecto") String proyecto) {
        DaoProyecto daoProyecto = new DaoProyecto();
        int idProyecto = 0;
        JSONObject proyectoJ = null;
        try {
            proyectoJ = new JSONObject(proyecto);
            idProyecto = proyectoJ.getInt("idProyecto");
        } catch (JSONException ex) {
            System.out.println("Error" + ex);
        }
        if (daoProyecto.eliminarProyecto(idProyecto)) {
            mensaje = "Se ha eliminado el proyecto";
            tipo = "success";
        } else {
            mensaje = "Ocurrio un error";
            tipo = "error";
        }
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
        constructor.header("Access-Control-Allow-Origin", "*");
        constructor.header("Access-Control-Allow-Methods", "*");
        return constructor.build();
    }

    @GET
    @Path("consultarProyecto")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response consultarProyecto(@QueryParam("proyecto") String proyecto) {
        DaoProyecto daoProyecto = new DaoProyecto();

        JSONObject proyectoJ = null;
        try {
            proyectoJ = new JSONObject(proyecto);
            idProyectoGlobal = proyectoJ.getInt("idProyecto");
        } catch (JSONException ex) {
            System.out.println("Error" + ex);
        }

        Response.ResponseBuilder constructor = Response.ok(proyectoJ.toString());
        constructor.header("Access-Control-Allow-Origin", "*");
        constructor.header("Access-Control-Allow-Methods", "*");
        return constructor.build();
    }

    @GET
    @Path("consultarPerfilAdmin")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response consultarPerfilAdmin() {
        DaoUsuario daoUsuario = new DaoUsuario();
        BeanUsuario beanUsuario = daoUsuario.consultarPerfilAdministrador();
        JSONObject objeto = new JSONObject();
        respuestas.put("usuario", beanUsuario);
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

    @GET
    @Path("seguimientoProyecto")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response seguimientoAdmin() throws ParseException {
        DaoProyecto daoProyecto = new DaoProyecto();
        DaoUsuario daoUsuario = new DaoUsuario();
        DaoRecursoMaterial daoMaterial = new DaoRecursoMaterial();
        JSONObject proyectoJ = new JSONObject();
        BeanProyecto proyecto = daoProyecto.consultarProyectoporId(idProyectoGlobal);
        String semana;
        Double valorPlaneado = 0.0;

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String fin = proyecto.getFinalProyecto();
        java.util.Date fechaFin = sdf.parse(fin);
        Calendar fecha = new GregorianCalendar();
        int año = fecha.get(Calendar.YEAR);
        int mes = fecha.get(Calendar.MONTH);
        int dia = fecha.get(Calendar.DAY_OF_MONTH);
        String actual = "" + año + "-" + (mes + 1) + "-" + dia;
        java.util.Date fechadateactual = sdf.parse(actual);

        if (fechadateactual.before(fechaFin)) {
            semana = Integer.toString(((daoProyecto.consultarDias(proyecto.getInicioProyecto())) / 7) + 1);
            valorPlaneado = (proyecto.getPresupuestoInicial() / proyecto.getSemanas()) * Integer.parseInt(semana);
        } else {
            semana = "El proyecto ya termino";
        }

        respuestas.put("proyecto", proyecto);
        respuestas.put("lider", daoUsuario.consultarLiderdeProyecto(idProyectoGlobal));
        respuestas.put("recursosHumanos", daoUsuario.consultarRescursos(idProyectoGlobal));
        respuestas.put("recursosMateriales", daoMaterial.listaRecursos(idProyectoGlobal));
        respuestas.put("semana", semana);
        respuestas.put("valorPlaneado", valorPlaneado);

        try {

            proyectoJ.put("respuesta", respuestas);

        } catch (JSONException e) {
            System.out.println("Error" + e);
        }
        Response.ResponseBuilder constructor = Response.ok(proyectoJ.toString());
        constructor.header("Access-Control-Allow-Origin", "*");
        constructor.header("Access-Control-Allow-Methods", "*");
        return constructor.build();
    }

    @GET
    @Path("registroRecursoHumano")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response registrarRecursoHumano(@QueryParam("usuario") String usuario) throws ParseException {
        DaoUsuario daoUsuario = new DaoUsuario();
        BeanUsuario beanUsuario = null;
        JSONObject usuarioJ = null;
        String conpass = "";
        boolean registro = false;
        try {
            usuarioJ = new JSONObject(usuario);
            beanUsuario = new BeanUsuario(usuarioJ.getString("nombre"), usuarioJ.getString("apellidoP"), usuarioJ.getString("apellidoM"), usuarioJ.getString("usuario"), usuarioJ.getString("pass"), usuarioJ.getString("grado"), usuarioJ.getString("carrera"), usuarioJ.getString("rfc"), usuarioJ.getString("email"), Double.parseDouble(usuarioJ.getString("salario")));
            beanUsuario.setRol(usuarioJ.getString("rol"));
            conpass = usuarioJ.getString("conpass");
        } catch (JSONException e) {
            System.out.println("Error" + e);
        }

        if (conpass.equals(beanUsuario.getPass())) {
            if (daoUsuario.consultarUsuariosRepetidos(beanUsuario) == null) {
                registro = daoUsuario.registrarRecursoHumano(beanUsuario, idProyectoGlobal);
                if (registro) {
                    mensaje = "Se ha registrado correctamente el recurso";
                    tipo = "success";
                } else {
                    mensaje = "No se pudo registrar el recurso";
                    tipo = "error";
                }
            } else {
                mensaje = "Ese recurso ya esta registrado";
                tipo = "error";
            }
        } else {
            mensaje = "Las contraseñas no coinciden";
            tipo = "error";
        }

        respuestas.put("mensaje", mensaje);
        respuestas.put("tipo", tipo);
        respuestas.put("registro", registro);
        try {

            usuarioJ.put("respuesta", respuestas);

        } catch (JSONException e) {
            System.out.println("Error" + e);
        }
        Response.ResponseBuilder constructor = Response.ok(usuarioJ.toString());
        constructor.header("Access-Control-Allow-Origin", "*");
        constructor.header("Access-Control-Allow-Methods", "*");
        return constructor.build();
    }

    @GET
    @Path("registroRecursoMaterial")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response registrarRecursoMaterial(@QueryParam("material") String material) {
        DaoRecursoMaterial daoRecursoMaterial = new DaoRecursoMaterial();
        BeanRecursoMaterial beanRecursoMaterial = null;
        JSONObject objeto = null;
        String conpass = "";
        boolean registro = false;
        try {
            objeto = new JSONObject(material);
            beanRecursoMaterial = new BeanRecursoMaterial(objeto.getString("nombre"), objeto.getDouble("precio"), objeto.getInt("cantidad"));
            Double total = beanRecursoMaterial.getCostoUnitario() * beanRecursoMaterial.getCantidad();
            beanRecursoMaterial.setTotal(total);
        } catch (JSONException e) {
            System.out.println("Error" + e);
        }

        if (daoRecursoMaterial.consultarRecursoRepetido(beanRecursoMaterial, idProyectoGlobal) == null) {
            registro = daoRecursoMaterial.registrarRecursoMaterial(beanRecursoMaterial, idProyectoGlobal);
            if (registro) {
                mensaje = "Se ha registrado correctamente el recurso";
                tipo = "success";
            } else {
                mensaje = "No se pudo registrar el recurso";
                tipo = "error";
            }
        } else {
            mensaje = "Ese recurso ya esta registrado en el proyecto";
            tipo = "error";
        }

        respuestas.put("mensaje", mensaje);
        respuestas.put("tipo", tipo);
        respuestas.put("registro", registro);
        respuestas.put("recursosMateriales", daoRecursoMaterial.listaRecursos(idProyectoGlobal));
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

    @GET
    @Path("consultarPerfilLider")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response consultarPerfilLider() {
        DaoUsuario daoUsuario = new DaoUsuario();
        BeanUsuario beanUsuario = daoUsuario.consultarLiderdeProyecto(idProyectoGlobal);
        
        
        JSONObject objeto = new JSONObject();
        respuestas.put("usuario", beanUsuario);
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

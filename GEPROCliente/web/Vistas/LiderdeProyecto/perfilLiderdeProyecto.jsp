<%-- 
    Document   : perfilAdministrador
    Created on : 7/03/2019, 09:07:37 PM
    Author     : horo_
--%>
<%
    String context = request.getContextPath();
    if (session.getAttribute("user") == null){
        response.sendRedirect(context + "/index");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil Líder de Proyecto-GEPRO</title>
         <script src="<%=context%>/js/jqBootstrapValidation.js"></script>
        <script src="<%=context%>/js/sweetalert2.all.min.js"></script>
        <link rel="shortcut icon" href="<%=context%>/imagenes/geprologo.ico"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="<%=context%>/css/style.css"> 
        <link rel="stylesheet" href="<%=context%>/css/sweetalert2.min.css">
        <script type="text/javascript" src="<%=context%>/js/acciones.js"></script> 
    </head>
    <body>
        <div id="sidebar">
            <p></p>
            <center><img src="<%=context%>/imagenes/geprologo.png" height="92"/></center>
            </br>
            <h1>Líder de Proyecto</h1>
            <div class="side-Elements" >                
                <button class="btn-sidebar" onclick="location.href = '<%=context%>/Vistas/LiderdeProyecto/inicioLiderdeProyecto.jsp'" ><center><img src="<%=context%>/imagenes/house-black-silhouette-without-door.png" height="22" style="padding: 0px 21px" />Inicio</center></button>
                <button class="btn-sidebar"><center><img src="<%=context%>/imagenes/user.png" height="22" style="padding: 0px 21px" />Perfil</center></button>
                <button class="btn-sidebar2" onclick="cerrarSesion()"><center><img src="<%=context%>/imagenes/logout.png" height="22" style="padding: 0px 15px" />Cerrar Sesión</center></button>
            </div>
        </div>

        <div class="offset-md-2 container">
            </br>
            <h1 style="float:left">Perfil</h1>
            </br>
            </br>
            <form>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="nombre">Nombre</label>
                        <input type="text"  pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ]+" class="form-control" id="nombre" readonly="true">
                        <p class="help-block"></p>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="grado">Grado Académico</label>
                        <input type="text" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ.]+" class="form-control" id="grado" readonly="true">
                        <p class="help-block"></p>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group  col-md-5">
                        <label for="carrera">Carrera</label>
                        <input type="text" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ.]+" class="form-control" id="carrera" readonly="true">
                        <p class="help-block"></p>
                    </div>
                </div> 
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="usuario">Usuario</label>
                        <input type="text" pattern="[a-zA-Z0-9]+" class="form-control" id="usuario" readonly="true">
                        <p class="help-block"></p>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="contrasenia">Contraseña</label>
                        <input type="password"  pattern="[a-zA-Z0-9]+" class="form-control" id="contrasenia" readonly="true">
                        <p class="help-block"></p>
                    </div>
                </div>                
                
            </form>
        </div>
             <script>
            var peticion = new XMLHttpRequest();
            peticion.onreadystatechange = function () {
                if (this.status === 200 && this.readyState === 4) {
                    var respuesta = JSON.parse(this.responseText);
                    var lider = respuesta.respuesta.usuario;
                    document.getElementById('nombre').value = lider.nombre;
                    document.getElementById('grado').value = lider.gradoEstudios;
                    document.getElementById('carrera').value = lider.carrera;
                    document.getElementById('usuario').value = lider.usuario;
                    document.getElementById('contrasenia').value = lider.pass;
                }

            }
            peticion.open("GET", "http://localhost:8080/GEPROServidor/servicioGEPRO/proyecto/consultarPerfilLider", true);
            peticion.send();
        </script>
            
            
            
    </body>
</html>

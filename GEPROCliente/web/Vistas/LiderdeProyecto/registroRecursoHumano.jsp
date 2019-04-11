<%-- 
    Document   : registroRecursoHumano
    Created on : 29/03/2019, 08:50:00 PM
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
        <title>Registrar Recurso Humano</title>
        <link rel="shortcut icon" href="<%=context%>/imagenes/geprologo.ico"/>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="<%=context%>/css/sweetalert2.min.css">
        <script src="<%=context%>/js/sweetalert/sweetalert2.all.min.js"></script>
        <script type="text/javascript" src="<%=context%>/js/jqBootstrapValidation.js"></script> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="<%=context%>/css/style.css">
        <script type="text/javascript" src="<%=context%>/js/acciones.js"></script>
    </head>
    <body>
        <div id="sidebar">
            <p></p>
            <center><img src="<%=context%>/imagenes/geprologo.png" height="92"/></center>
            
            </br>
            <h1>Líder de Proyecto</h1>
            <h1><%=session.getAttribute("nombre")%></h1>
            <div class="side-Elements" >                
                <button class="btn-sidebar" onclick="location.href = '<%=context%>/Vistas/LiderdeProyecto/inicioLiderdeProyecto.jsp'"  ><center><img src="<%=context%>/imagenes/house-black-silhouette-without-door.png" height="22" style="padding: 0px 21px" />Inicio</center></button>
                <button class="btn-sidebar" onclick="location.href = '<%=context%>/Vistas/LiderdeProyecto/perfilLiderdeProyecto.jsp'"><center><img src="<%=context%>/imagenes/user.png" height="22" style="padding: 0px 21px" />Perfil</center></button>
                <button class="btn-sidebar2" onclick="cerrarSesion()"><center><img src="<%=context%>/imagenes/logout.png" height="22" style="padding: 0px 15px" />Cerrar Sesión</center></button>
            </div>
        </div>
              <div class="offset-md-2 container">
            <h1>Registrar Recurso Humano</h1>
            <br/>
            <form action="#" id="myform" onsubmit="return false" >
                <div class="form-row">
                    <h2>Información personal del Recurso Humano</h2>
                    <br/>
                </div>
                <input type="text" value="<%=session.getAttribute("idProyecto")%>"  id="idProyecto" hidden="true">
                <div class="form-row">
                    <div class="form-group  col-md-4">
                        <label for="nombreL">Nombre(s)</label>
                        <input type="text" placeholder="Nombre"  pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ]+" class="form-control" id="nombreL" required>
                    </div>
                    <div class="form-group  col-md-4">
                        <label for="apellidoP">Apellido Paterno</label>
                        <input type="text" placeholder="Apellido Paterno" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ]+" class="form-control" id="apellidoP" required>
                    </div>
                    <div class="form-group  col-md-4">
                        <label for="apellidoM">Apellido Materno</label>
                        <input type="text" placeholder="Apellido Materno" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ]+" class="form-control" id="apellidoM" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group  col-md-2">
                        <label for="grado">Grado Académico</label>
                        <input type="text" placeholder="Grado Académico" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ.]+" class="form-control" id="grado" required>
                    </div>
                    <div class="form-group  col-md-7">
                        <label for="carrera">Carrera</label>
                        <input type="text" placeholder="Carrera" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ]+" class="form-control" id="carrera" required>
                    </div>
                </div>
                <div class="form-row">
                     <div class="form-group  col-md-3">
                        <label for="rol">Rol</label>
                        <input type="text" placeholder="Rol"  pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ]+" class="form-control" id="rol" required>
                    </div>
                    <div class="form-group  col-md-2">
                        <label for="salario">Salario por hora</label>
                        <input type="text" placeholder="Salario"  pattern="[0-9.]+" class="form-control" id="salario" required>
                    </div>
                    <div class="form-group  col-md-3">
                        <label for="rfc">RFC</label>
                        <input type="text" placeholder="RFC" minlength="12" maxlength="13" pattern="[A-Z0-9]+" class="form-control" id="rfc1" required>
                    </div>
                    <div class="form-group  col-md-3">
                        <label for="email">Email</label>
                        <input type="email" placeholder="Email" class="form-control" id="email" required>
                    </div>
                </div>
                  <div class="form-row">
                    <h2>Información de usuario de Recurso Humano</h2>
                    <br/>
                </div>
                <div class="form-row">
                    <div class="form-group  col-md-3">
                        <label for="usuario">Usuario</label>
                        <input type="text" placeholder="Usuario" pattern="[A-Za-z0-9]+" class="form-control" id="usuario" required>
                    </div>
                    <div class="form-group  col-md-3">
                        <label for="pass">Contraseña</label>
                        <input type="password" placeholder="Contraseña" pattern="[A-Za-z0-9]+" class="form-control" id="pass" required>
                    </div>
                    <div class="form-group  col-md-3">
                        <label for="conpass">Confirmar contraseña</label>
                        <input type="password" placeholder="Confirmar Contraseña" pattern="[A-Za-z0-9]+" class="form-control" id="conpass" required>
                    </div>
                </div>
                <input type="submit" disabled id="btnRegistrar"  value="Registrar"  onclick="" class ="btn-verde" />
            </form>
        </div> 
    </body>
    <script>
        $("#myform").submit(function(e) {
            var beanUsuario = {
                nombre: document.getElementById("nombreL").value,
                apellidoP: document.getElementById("apellidoP").value,
                apellidoM: document.getElementById("apellidoM").value,
                grado: document.getElementById("grado").value,
                rfc: document.getElementById("rfc1").value,
                carrera: document.getElementById("carrera").value,
                email: document.getElementById("email").value,
                usuario: document.getElementById("usuario").value,
                pass: document.getElementById("pass").value,
                conpass: document.getElementById("conpass").value,
                salario: document.getElementById("salario").value,
                rol: document.getElementById("rol").value,
                idProyecto: document.getElementById("idProyecto").value
            };
            peticion.onreadystatechange = function () {
                if (this.status === 200) {
                    var respuesta = JSON.parse(this.responseText);
                    Swal.fire(
                            respuesta.respuesta.mensaje,
                            '',
                            respuesta.respuesta.tipo,
                            ).then((value) => {
                        if (respuesta.respuesta.registro) {

                            window.location.href = "http://localhost:8080/GEPROCliente/Vistas/LiderdeProyecto/inicioLiderdeProyecto.jsp";
                        }
                    });
                }
            }
            peticion.open("GET", "http://localhost:8080/GEPROServidor/servicioGEPRO/proyecto/registroRecursoHumano?usuario=" + JSON.stringify(beanUsuario), true);
            peticion.send();
        });
        
        // Añadir event listener al documento para detectar una tecla presionada
        document.addEventListener("keyup", validar);
        
        function validar() {
            var flag = true; // bandera
            // Obtener todos los inputs
            var inputs = document.getElementsByClassName("form-control");
            for (var i = 0; i < inputs.length; i++) {
                if(inputs[i].value.length == 0){
                    flag = false;
                }
            }
            if(flag){
                document.getElementById("btnRegistrar").disabled = false;
            }
        }
        
    </script>
    
    
</html>

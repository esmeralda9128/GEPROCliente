<%-- 
    Document   : perfilAdministrador
    Created on : 7/03/2019, 09:07:37 PM
    Author     : horo_
--%>
<%
    String context = request.getContextPath();
    if (session.getAttribute("user") == null) {
        response.sendRedirect(context + "/index");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil Administrador</title>
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
            <h1>Administrador</h1>
            <div class="side-Elements" >                
                <button class="btn-sidebar" onclick="location.href = '<%=context%>/Vistas/Administrador/inicioAdministrador.jsp'" ><center><img src="<%=context%>/imagenes/house-black-silhouette-without-door.png" height="22" style="padding: 0px 21px" />Inicio</center></button>
                <button class="btn-sidebar"><center><img src="<%=context%>/imagenes/user.png" height="22" style="padding: 0px 21px" />Perfil</center></button>
                <button class="btn-sidebar2" onclick="cerrarSesion()"><center><img src="<%=context%>/imagenes/logout.png" height="22" style="padding: 0px 15px" />Cerrar Sesión</center></button>
            </div>
        </div>

        <div class="offset-md-2 container">
            </br>
            <h1 style="float:left">Perfil</h1>
            </br>
            </br>
            <form action="#" onsubmit="return false" >
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="nombre">Nombre</label>
                        <input type="text"  pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ]+" class="form-control" id="nombre" required>
                        <p class="help-block"></p>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="grado">Grado Académico</label>
                        <input type="text" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ.]+" class="form-control" id="grado" required>
                        <p class="help-block"></p>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group  col-md-8">
                        <label for="carrera">Carrera</label>
                        <input type="text" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ.]+" class="form-control" id="carrera" required>
                        <p class="help-block"></p>
                    </div>
                </div> 
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="usuario">Usuario</label>
                        <input type="text" pattern="[a-zA-Z0-9]+" class="form-control" id="usuario" required>
                        <p class="help-block"></p>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="contrasenia">Contraseña actual</label>
                        <input type="text"  pattern="[a-zA-Z0-9]+" class="form-control" id="contrasenia" required readonly>
                        <p class="help-block"></p>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="nuevaContrasenia">Nueva Contraseña</label>
                        <input type="password" pattern="[a-zA-Z0-9]+" class="form-control" id="nuevaContrasenia" >
                        <p class="help-block"></p>
                    </div>

                    <div class="form-group col-md-3">
                        <label for="nuevaConfirmarContrasenia">Confirmar Nueva Contraseña</label>
                        <input   type="password" Passwordagain="#nuevaContrasenia" pattern="[a-zA-Z0-9]+" class="form-control" id="nuevaConfirmarContrasenia">
                        <p class="help-block"></p>
                    </div>

                </div>
                <center>
                    <button  style="margin-right: 200px" class="btn-rojo">Cancelar</button>
                    <button type="submit" class="btn-verde" onclick="actualizarPerfil()">Enviar</button>
                </center>
            </form>

        </div>

        <script>
            var peticion = new XMLHttpRequest();
            peticion.onreadystatechange = function () {
                if (this.status === 200 && this.readyState === 4) {
                    var respuesta = JSON.parse(this.responseText);
                    var administrador = respuesta.respuesta.usuario;
                    document.getElementById('nombre').value = administrador.nombre;
                    document.getElementById('grado').value = administrador.gradoEstudios;
                    document.getElementById('carrera').value = administrador.carrera;
                    document.getElementById('usuario').value = administrador.usuario;
                    document.getElementById('contrasenia').value = administrador.pass;
                }

            }
            peticion.open("GET", "http://localhost:8080/GEPROServidor/servicioGEPRO/proyecto/consultarPerfilAdmin", true);
            peticion.send();
        </script>
        <script>
            function actualizarPerfil() {
                Swal.fire({
                    title: 'Confirmar solicitud',
                    text: "¿Desea actualizar la informaci\u00f3n?",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#009475',
                    cancelButtonColor: '#E61A1A',
                    confirmButtonText: 'Si',
                    cancelButtonText: 'No'
                }).then((result) => {
                    if (result.value) {
                        var beanUsuario = {
                            nombre: document.getElementById("nombre").value,
                            gradoEstudios: document.getElementById("grado").value,
                            carrera: document.getElementById("carrera").value,
                            usuario: document.getElementById("usuario").value,
                            pass: document.getElementById("contrasenia").value,
                            newPass: document.getElementById("nuevaContrasenia").value,
                            confirmNewPass: document.getElementById("nuevaConfirmarContrasenia").value
                        };
                        var peticion = new XMLHttpRequest();
                        peticion.onreadystatechange = function () {
                            if (this.status === 200) {
                                var respuesta = JSON.parse(this.responseText);
                                Swal.fire(
                                        respuesta.respuesta.mensaje,
                                        '',
                                        respuesta.respuesta.tipo,
                                        ).then((value) => {
                                            if (respuesta.respuesta.registro) {
                                                window.location.href = "http://localhost:8080/GEPROCliente/Vistas/Administrador/perfilAdministrador.jsp";
                                            }
                                        });
                            }
                        }

                        peticion.open("GET", "http://localhost:8080/GEPROServidor/servicioGEPRO/proyecto/actualizarPerfilAdmin?perfilAdmin="
                                + JSON.stringify(beanUsuario), true);
                        peticion.send();
                    }
                })
            }
        </script>
        <!--        <script>
                    $(document).ready(function () {
                        var vidFile = document.getElementById('nuevaContrasenia').value.toString().length;
                        if (vidFile === 0) {
                            $("nuevaConfirmarContrasenia").attr('disabled', 'disabled');
                        } else {
                            d$("nuevaConfirmarContrasenia").removeAttr('disabled');
                        }
                    });
                </script>-->


    </body>
</html>

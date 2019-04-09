<%-- 
    Document   : seguimientoEmpleado
    Created on : 08-abr-2019, 12:45:20
    Author     : Alberto
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
        <title>Seguimiento de Empleados</title>
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
            <input type="text" value="<%=session.getAttribute("idProyecto")%>"  id="idProyecto" hidden="false">
            <h1>Líder de Proyecto</h1>
            <h1><%=session.getAttribute("nombre")%></h1>
            <div class="side-Elements" >                
                <button class="btn-sidebar" onclick="location.href = '<%=context%>/Vistas/LiderdeProyecto/inicioLiderdeProyecto.jsp'" ><center><img src="<%=context%>/imagenes/house-black-silhouette-without-door.png" height="22" style="padding: 0px 21px" />Inicio</center></button>
                <button class="btn-sidebar" onclick="location.href = '<%=context%>/Vistas/LiderdeProyecto/perfilLiderdeProyecto.jsp'"><center><img src="<%=context%>/imagenes/user.png" height="22" style="padding: 0px 21px" />Perfil</center></button>
                <!--<a class="btn-sidebar" href="<%=context%>/cerrarSesion"><center><img src="<%=context%>/imagenes/logout.png" height="22" style="padding: 0px 15px" />Cerrar Sesión</center></a>-->
                <button class="btn-sidebar2" onclick="cerrarSesion()"><center><img src="<%=context%>/imagenes/logout.png" height="22" style="padding: 0px 15px" />Cerrar Sesión</center></button>
            </div>
        </div>
        <div class="offset-md-2 container">
            <br/>
            <h1 style="float:left">Perfil</h1>
            <table class="table" style="color: white">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Rol</th>
                        <th>Actividades</th>
                    </tr>
                </thead>
                <tbody id="tablaSeguimientoEmpleado">
                </tbody>
            </table>
        </div>
        <script>
            var peticion = new XMLHttpRequest();
            var idProyecto = {proyecto: document.getElementById("idProyecto").value};

            peticion.onreadystatechange = function () {
                if (this.status === 200 && this.readyState === 4) {
                    respuesta = JSON.parse(this.responseText);
                    mensaje = respuesta.mensaje;
                    tipo = respuesta.tipo;
                    var arr = respuesta.respuesta.usuarios;
                }
                $('#tablaSeguimientoEmpleado').html('');
                if (arr.length !== 0) {
                    for (var i = 0; i < arr.length; i++) {
                        $('#tablaSeguimientoEmpleado').append('<tr><td>' + arr[i].nombre + '</td><td>' + arr[i].rol + '</td><td><button class="btn-verde-largo" onclick="actividades(' + arr[i].id + ')">Ver Actividades</button></td></tr>');
                    }
                } else {
                    Swal.fire({
                        title: 'Aviso',
                        text: "No hay usuarios registrados.",
                        type: 'info',
                        confirmButtonColor: '#009475',
                        confirmButtonText: 'Aceptar'
                    });
                    $('#tablaSeguimientoEmpleado').append('<h2>No hay usuarios registrados en este proyecto.</h2>');
                }
            };
            peticion.open("GET", "http://localhost:8080/GEPROServidor/servicioGEPRO/proyecto/seguimientoEmpleados?idProyecto=" + JSON.stringify(idProyecto), true);
            peticion.send();

        </script>

        <script>
            var peticion = new XMLHttpRequest();
             function actividades(idUsuario) {
                 var idUser = {id: idUsuario};
                    peticion.onreadystatechange = function () {
                        if (this.status === 200 && this.readyState === 4) {
                            window.location.replace("http://localhost:8080/GEPROCliente/Vistas/LiderdeProyecto/mostrarActividades.jsp");
                        }
                    };
                    peticion.open("GET", "http://localhost:8080/GEPROServidor/servicioGEPRO/proyecto/consultarActividadId?id="
                            + JSON.stringify(idUser), true);
                    peticion.send();
                }
        </script>
    </body>

</html>

<%-- 
    Document   : inicioAdministrador
    Created on : 4/03/2019, 08:11:02 PM
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
        <title>Inicio Administrador-GEPRO</title>
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
    <body onload="cargarProyectos()">
        <div id="sidebar">
            <p></p>
            <center><img src="<%=context%>/imagenes/geprologo.png" height="92"/></center>
            </br>
            <h1>Administrador</h1>
            <div class="side-Elements" >

                <button  class="btn-sidebar active"><center><img src="<%=context%>/imagenes/house-black-silhouette-without-door.png" height="22" style="padding: 0px 21px" />Inicio</center></button>
                <button onclick="location.href = '<%=context%>/Vistas/Administrador/perfilAdministrador.jsp'" class="btn-sidebar"><center><img src="<%=context%>/imagenes/user.png" height="22" style="padding: 0px 21px" />Perfil</center></button>
                <button class="btn-sidebar2"><center><img src="<%=context%>/imagenes/logout.png" height="22" style="padding: 0px 15px" />Cerrar Sesión</center></button>

            </div>
        </div>

        <div class="offset-md-2 container " >
            <br>
            <h1  style="float:left">Proyectos</h1>
            <button style="float:right; width: 160px" onclick="location.href = '<%=context%>/Vistas/Administrador/registrarProyecto.jsp'" class="btn-verde">Crear Proyecto</button>
            <br>
            <br>   
            <div  class="container-fluid">
                <div class="card-group" id="cardsProyectos">

                </div>
            </div>

          
            <script>
                peticion.onreadystatechange = function () {
                    if (this.status === 200 && this.readyState === 4) {
                        var respuesta = JSON.parse(this.responseText);
                        var proyectos = respuesta.respuesta.proyectos;
                        if (proyectos !== null) {
                            for (var i = 0; i < proyectos.length; i++) {
                                $('#cardsProyectos').append(' <div class="col-md-4"><div class="card" style="width: 18rem;"><div class="card-header" style="background-color: #009475">' + proyectos[i].nombre + '</div><div class="card-body"><h5 class="card-title" >' + proyectos[i].lider.nombre + ' ' + proyectos[i].lider.primerApellido + ' ' + proyectos[i].lider.segundoApellido + '</h5><p class="card-text">' + 'Semanas ' + proyectos[i].semanas + '<br/>' + 'Prespuesto ' + proyectos[i].presupuestoInicial + '</p><center><button class="btn-azul" onclick="consultarProyectoAdmin(' + proyectos[i].idProyecto + ')">Seguimiento</button><button class="btn-rojo" onclick="eliminarProyecto(' + proyectos[i].idProyecto + ')">Eliminar</button></center></div></div><br/></div>');
                            }
                        }
                    }
                }

                peticion.open("GET", "http://localhost:8080/GEPROServidor/servicioGEPRO/proyecto/consultarProyectos", true);
                peticion.send();
            </script>

       
        </div>





      
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>

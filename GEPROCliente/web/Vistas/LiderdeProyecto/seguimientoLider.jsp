<%-- 
    Document   : seguimientoLider
    Created on : 2/04/2019, 07:49:34 PM
    Author     : horo_
--%>
<%
    String context = request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seguimiento de Proyecto</title>

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
        <script  src="<%=context%>/js/index.js"></script>
        <script src="<%=context%>/js/sweetalert/sweetalert2.all.min.js"></script>
        <script src="<%=context%>/js/bootstrap/bootstrap.min.js"></script>
        <script src="<%=context%>/js/jqBootstrapValidation.js"></script>            

    </head>
    <body>
        <div id="sidebar">
            <p></p>
            <center><img src="<%=context%>/imagenes/geprologo.png" height="92"/></center>
            </br>
            <h1>Líder de Proyecto</h1>
            <div class="side-Elements" >                
                <button class="btn-sidebar"  ><center><img src="<%=context%>/imagenes/house-black-silhouette-without-door.png" height="22" style="padding: 0px 21px" />Inicio</center></button>
                <button class="btn-sidebar" onclick="location.href = '<%=context%>/Vistas/LiderdeProyecto/perfilLiderdeProyecto.jsp'"><center><img src="<%=context%>/imagenes/user.png" height="22" style="padding: 0px 21px" />Perfil</center></button>
                <a class="btn-sidebar2" href="<%=context%>/cerrarSesion"><center><img src="<%=context%>/imagenes/logout.png" height="22" style="padding: 0px 15px" />Cerrar Sesión</center></a>
            </div>
        </div>
        <div class="offset-md-2 container">
            <input type="text" value="<%=session.getAttribute("idProyecto")%>"  id="idProyecto" hidden="true">
            <br/>
            <div id="nombrePS">
            </div>
            <br/>
            <br/>
            <br/>
            <br/>
            <div class="row">
                <div class="col-md-4">
                    <button class="btn-azul-grande">Iniciar Seguimiento </button>
                </div>
                <div class="col-md-4">
                    <button class="btn-azul-grande">Dar Seguimiento </button>
                </div>
                <div class="col-md-4">
                    <button class="btn-azul-grande">Seguimiento de Empleados </button>
                </div>
            </div>
            <br/>
            <br/>

            <div class="container" >
                <div class="row">
                    <div class="col-md-4">
                        <h2 style="float: left" id="txt1">Semana</h2>
                    </div>
                    <div class="col-md-4">
                        <h2 style="float: left" id="txt2">Semana</h2>
                    </div>
                    <div class="col-md-4">
                        <h2 style="float: left" id="txt2">Semana</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <h2 style="float: left" id="presupuestoInicial">Semana</h2>
                    </div>
                    <div class="col-md-4">
                        <h2 style="float: left" id="txt1">Semana</h2>
                    </div>
                    <div class="col-md-4">
                        <h2 style="float: left" id="txt1">Semana</h2>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-md-3">
                        <button class="btn-azul-largo">Pagar Nóminas</button>

                    </div>
                    <div class="col-md-3">
                        <button class="btn-azul-largo">Comprar Materiales</button>

                    </div>
                </div>



            </div>

        </div>
        <script>
            var peticion = new XMLHttpRequest();
            var idProyecto = {proyecto: document.getElementById("idProyecto").value};


            peticion.onreadystatechange = function () {
                if (this.status === 200 && this.readyState === 4) {
                    var respuesta = JSON.parse(this.responseText);
                    var proyecto = respuesta.respuesta.proyecto;
                    var lider = respuesta.respuesta.lider;
                    var semana = respuesta.respuesta.semana;
                    var recursoHumanos = respuesta.respuesta.recursosHumanos;
                    var recursoMateriales = respuesta.respuesta.recursosMateriales;
                }
                $('#nombrePS').html('');
                $('#nombrePS').append(' <h1 style="float: left">' + proyecto.nombre + '</h1>');
                $('#semanas').html('');
                $('#senamanas').append(semana);

            }
            peticion.open("GET", "http://localhost:8080/GEPROServidor/servicioGEPRO/proyecto/seguimientoProyecto?proyecto=" + JSON.stringify(idProyecto), true);
            peticion.send();

            function iniciarSeguimiento() {

            }
        </script>
    </body>
</html>

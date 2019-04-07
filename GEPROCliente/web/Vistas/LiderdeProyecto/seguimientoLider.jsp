<%-- 
    Document   : seguimientoLider
    Created on : 2/04/2019, 07:49:34 PM
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
                <button class="btn-sidebar"  onclick="location.href = '<%=context%>/Vistas/LiderdeProyecto/inicioLiderdeProyecto.jsp'"><center><img src="<%=context%>/imagenes/house-black-silhouette-without-door.png" height="22" style="padding: 0px 21px" />Inicio</center></button>
                <button class="btn-sidebar" onclick="location.href = '<%=context%>/Vistas/LiderdeProyecto/perfilLiderdeProyecto.jsp'"><center><img src="<%=context%>/imagenes/user.png" height="22" style="padding: 0px 21px" />Perfil</center></button>
                <button class="btn-sidebar2" onclick="cerrarSesion()"><center><img src="<%=context%>/imagenes/logout.png" height="22" style="padding: 0px 15px" />Cerrar Sesión</center></button>
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
                    <button class="btn-azul-grande" onclick="iniciarSeguimiento()">Iniciar Seguimiento </button>
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
                        <h2 style="float: left" id="txt1"></h2>
                    </div>
                    <div class="col-md-4">
                        <h2 style="float: left" id="txt2"></h2>
                    </div>
                    <div class="col-md-4">
                        <h2 style="float: left" id="txt3"></h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <h2 style="float: left" id="presupuestoInicial"></h2>
                    </div>
                    <div class="col-md-4">
                        <h2 style="float: left" id="PresupuestoActual"></h2>
                    </div>
                    <div class="col-md-4">
                        <h2 style="float: left" id="totalPagado"></h2>
                    </div>
                </div>
                <br/>

                <div class="row" id="botones"></div>
                <div class="row">
                    <div class="col-md-4">
                        <br/>
                        <br/>
                        <h2 style="float: left" id="txt4"></h2>
                    </div>
                </div>
                <br/>
                <br/>
                <br/>
                <div id="tablaRecursos" class="row">
                    <table class="table" style="color: white">
                        <thead id="cabeceraTablaRecursos">

                        </thead>
                        <tbody id="bodyTablaRecursos">
                        </tbody>
                    </table>  
                </div>


            </div>

        </div>
        <script>
            var peticion = new XMLHttpRequest();
            var idProyecto = {proyecto: document.getElementById("idProyecto").value};
            var semana;
            var materialesPorComprar;
            peticion.onreadystatechange = function () {
                if (this.status === 200 && this.readyState === 4) {
                    var respuesta = JSON.parse(this.responseText);
                    var proyecto = respuesta.respuesta.proyecto;
                    semana = respuesta.respuesta.semana;
                    materialesPorComprar = respuesta.respuesta.materialesPorComprar;
                }
                $('#nombrePS').html('');
                $('#nombrePS').append('<h1 style="float: left">' + proyecto.nombre + '</h1>');


            }
            peticion.open("GET", "http://localhost:8080/GEPROServidor/servicioGEPRO/proyecto/seguimientoProyecto?proyecto=" + JSON.stringify(idProyecto), true);
            peticion.send();

            function iniciarSeguimiento() {
                $('#cabeceraTablaRecursos').html('');
                $('#bodyTablaRecursos').html('');
                $('#botones').html('');
                $('#botones').append('<div class="col-md-3"><button class="btn-azul-largo" onclick="verEmpleados()">Pagar Nóminas</button></div><div class="col-md-3"><button class="btn-azul-largo" onclick="verMateriales()">Comprar Materiales</button></div>');
                $('#txt1').html('');
                $('#txt1').append('Semana ' + semana);
            }
            function verEmpleados() {
                $('#txt4').html('');
                $('#txt4').append('Empleados');
                $('#cabeceraTablaRecursos').html('');
                $('#cabeceraTablaRecursos').append('<tr><th>Nombre</th><th>Rol</th><th>Pagar</th><th>Nómina</th></tr>');
                $('#bodyTablaRecursos').html('');
                if (materialesPorComprar != null) {
                     for (var i = 0; i < materialesPorComprar.length; i++) {
                        $('#bodyTablaRecursos').append('<tr><th>'+materialesPorComprar[i].nombreRecursoMat+'</th></tr>');
                    }
                }
            }
            
            function verMateriales() {
                $('#txt4').html('');
                $('#txt4').append('Empleados');
                $('#cabeceraTablaRecursos').html('');
                $('#cabeceraTablaRecursos').append('<tr><th>Nombre</th><th>Rol</th><th>Pagar</th><th>Nómina</th></tr>');
                $('#bodyTablaRecursos').html('');
                if (materialesPorComprar != null) {
                     for (var i = 0; i < materialesPorComprar.length; i++) {
                        $('#bodyTablaRecursos').append('<tr><th>'+materialesPorComprar[i].nombreRecursoMat+'</th></tr>');
                    }
                }
            }
        </script>
    </body>
</html>

<%-- 
    Document   : seguimientoAdministrador
    Created on : 7/03/2019, 08:27:30 PM
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
        <title>Seguimiento Administrador-GEPRO</title>
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
                <button class="btn-sidebar" onclick="location.href = '<%=context%>/Vistas/Administrador/inicioAdministrador.jsp'"><center><img src="<%=context%>/imagenes/house-black-silhouette-without-door.png" height="22" style="padding: 0px 21px" />Inicio</center></button>
                <button class="btn-sidebar" onclick="location.href = '<%=context%>/Vistas/Administrador/perfilAdministrador.jsp'"><center><img src="<%=context%>/imagenes/user.png" height="22" style="padding: 0px 21px" />Perfil</center></button>
                <button class="btn-sidebar2"><center><img src="<%=context%>/imagenes/logout.png" height="22" style="padding: 0px 15px" />Cerrar Sesión</center></button>

            </div>
        </div>
        <div class="offset-md-2 container">
            </br>
            <h1 style="float: left">Seguimiento de Proyecto</h1>
            <br>
            <br>
            <div id="nombrePS">
            </div>
            <br>
            <br>
            <div class="row">
                <h2 style="float: left; margin-left: 15px">Lider de Proyecto</h2>
                <div id="liderPro">                 
                </div>
            </div>
            <div class="row">
                <h2  style="float: left; margin-left: 15px">Presupuesto Inicial</h2> <h2 id="presupuestoInicial" style="padding-left:  10px"></h2>
            </div>
            <div class="row">
                <h2 style="float: left;margin-left: 15px"> Fecha de inicio</h2> <h2 style="padding-left:  10px" id="fechaInicioSeguimiento"></h2>
            </div>

            <div class="row">
                <h2 style="float: left;margin-left: 15px">Semana </h2> <h2 style="padding-left:  10px">#</h2>
            </div>
            <div class="row">
                <div class="col-md-4"><h2>Presupuesto Planeado</h2></div>
                <div class="col-md-4"><h2>Costo Real</h2> </div>
                <div class="col-md-4"><h2>Valor Ganado</h2></div>  
            </div>
            <div class="row">
                <div class="col-md-4"><h2  id="presupuestoPlaneado"></h2></div>
                <div class="col-md-4" ><h2 id="costoReal"></h2></div> 
                <div class="col-md-4" ><h2 id="valorGanado"></h2></div> 
            </div>
            <br>
            <br>
            <div class="row">
                <h2 style="float: left;margin-left: 15px" >Valores Acumulados</h2>
                <br>
            </div>
            <div class="row">
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" style="background-color:  #002E60" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Elige el valor acumulado
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <button class="dropdown-item" onclick="variaciondelCronograma()"> Variación del Cronograma</button>
                        <button class="dropdown-item" onclick="variaciondelCosto()"> Variación del Costo</button>
                        <button class="dropdown-item" onclick="indicedeDesempenodelCronograma()"> Índice de Desempeño del Cronograma</button>
                        <button class="dropdown-item" onclick="indicedeDesempeñodelCosto()"> Índice de Desempeño del Costo</button>
                    </div>
                </div>
                <div style=" padding-left: 200px" id="valores">

                </div>

            </div>
            <hr/>
            <h1 style="float: left">Peticiones</h1>
            <br>
            <br>
            <p style="color: white">
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
            </p>
            <br>
            <center>
                <button  style="margin-right: 200px" class="btn-rojo">Rechazar</button>
                <button type="submit" class="btn-verde">Aprobar</button>
            </center>

        </div>

        <script src="<%=context%>/js/jquery-3.3.1.min.js"></script>
        <script src="<%=context%>/js/popper.min.js"></script>

        <script src="<%=context%>/js/acciones.js"></script>

        <script>
            var peticion = new XMLHttpRequest();
            peticion.onreadystatechange = function () {
                if (this.status === 200 && this.readyState === 4) {
                    var respuesta = JSON.parse(this.responseText);
                    var proyecto = respuesta.respuesta.proyecto;
                    var lider = respuesta.respuesta.lider;
                }
                $('#nombrePS').html('');
                $('#nombrePS').append(' <h2 style="float: left">' + proyecto.nombre + '</h2>');
                 $('#liderPro').html('');
                $('#liderPro').append('  <h2 style="float: left;  margin-left: 15px">' +lider.nombre + ' ' + lider.primerApellido + ' ' +lider.segundoApellido + '</h2>');
                  $('#presupuestoInicial').html('');
                $('#presupuestoInicial').append('$'+proyecto.presupuestoInicial);
                 $('#fechaInicioSeguimiento').html('');
                $('#fechaInicioSeguimiento').append(proyecto.inicioProyecto);
                $('#presupuestoPlaneado').html('');
                $('#presupuestoPlaneado').append('$'+proyecto.valorPlaneado);
                 $('#valorGanado').html('');
                $('#valorGanado').append('$'+proyecto.valorGanado);
 
            }
            peticion.open("GET", "http://localhost:8080/GEPROCliente/servicioGEPRO/proyecto/seguimientoProyecto", true);
            peticion.send();
        </script>

    </body>
</html>

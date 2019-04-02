<%-- 
    Document   : inicioAdministrador
    Created on : 4/03/2019, 08:11:02 PM
    Author     : horo_
--%>

<%
    String context = request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registrar Proyecto</title>
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
            <h1>Registrar Proyecto</h1>
            <br/>
            <form action="#" onsubmit="return false" >
                <div class="form-row">
                    <h2>Información del Proyecto</h2>
                    <br/>
                </div>
                <div class="form-row">
                    <div class="form-group  col-md-5">
                        <label for="nombreP">Nombre de Proyecto</label>
                        <input type="text" placeholder="Nombre del Proyecto" pattern="[ A-Za-z0-9-äÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ.]+" class="form-control" id="nombreP" required>
                        <p class="help-block"></p>
                    </div>
                    <div class="form-group  col-md-2">
                        <label for="presupuesto">Presupuesto Inicial</label>
                        <input type="text" placeholder="Presupuesto" pattern="[ 0-9.]+" class="form-control" id="presupuesto" required>
                        <p class="help-block"></p>
                    </div>
                    <div class="form-group  col-md-2">
                        <label for="reserva">Reserva</label>
                        <input type="text" placeholder="Reserva" pattern="[ 0-9.]+" class="form-control" id="reserva" required>
                        <p class="help-block"></p> 
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group  col-md-2">
                        <label for="fechaInicio">Fecha de inicio</label>
                        <input type="date"   placeholder="Fecha Inicio" class="form-control" id="fechaInicio" required>                                
                        <p class="help-block"></p> 
                    </div>
                    <div class="form-group  col-md-2">
                        <label for="semanas">Duración en semanas</label>
                        <input type="number"   placeholder="Semanas" class="form-control"  id="semanas"  required>                                
                        <p class="help-block"></p> 
                    </div>
                </div>
                <div class="form-row">
                    <h2>Información personal de Líder de Proyecto</h2>
                    <br/>
                </div>
                <div class="form-row">
                    <div class="form-group  col-md-4">
                        <label for="semanas">Nombre(s)</label>
                        <input type="text" placeholder="Nombre"  pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ]+" class="form-control" id="nombreL" required>
                        <p class="help-block"></p>
                    </div>
                    <div class="form-group  col-md-4">
                        <label for="apellidoP">Apellido Paterno</label>
                        <input type="text" placeholder="Apellido Paterno" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ]+" class="form-control" id="apellidoP" required>
                        <p class="help-block"></p>
                    </div>
                    <div class="form-group  col-md-4">
                        <label for="apellidoM">Apellido Materno</label>
                        <input type="text" placeholder="Apellido Materno" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ]+" class="form-control" id="apellidoM" required>
                        <p class="help-block"></p>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group  col-md-2">
                        <label for="grado">Grado Académico</label>
                        <input type="text" placeholder="Grado Académico" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ.]+" class="form-control" id="grado" required>
                        <p class="help-block"></p>
                    </div>
                    <div class="form-group  col-md-7">
                        <label for="carrera">Carrera</label>
                        <input type="text" placeholder="Carrera" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ]+" class="form-control" id="carrera" required>
                        <p class="help-block"></p>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group  col-md-2">
                        <label for="salario">Salario por hora</label>

                        <input type="text" placeholder="Salario"  pattern="[0-9.]+" class="form-control" id="salario" required>
                        <p class="help-block"></p>
                    </div>
                    <div class="form-group  col-md-3">
                        <label for="rfc">RFC</label>

                        <input type="text" placeholder="RFC" minlength="12" maxlength="13" pattern="[A-Z0-9]+" class="form-control" id="rfc" required>
                        <p class="help-block"></p>
                    </div>
                    <div class="form-group  col-md-3">
                        <label for="email">Email</label>

                        <input type="email" placeholder="Email" class="form-control" id="email" required>
                        <p class="help-block"></p>
                    </div>
                </div>
                  <div class="form-row">
                    <h2>Información de usuario de Líder de Proyecto</h2>
                    <br/>
                </div>
                <div class="form-row">
                    <div class="form-group  col-md-3">
                        <label for="usuario">Usuario</label>
                        <input type="text" placeholder="Usuario" pattern="[A-Za-z0-9]+" class="form-control" id="usuario" required>
                        <p class="help-block"></p>
                    </div>

                    <div class="form-group  col-md-3">
                        <label for="pass">Contraseña</label>
                        <input type="password" placeholder="Contraseña" pattern="[A-Za-z0-9]+" class="form-control" id="pass" required>
                        <p class="help-block"></p>
                    </div>
                    <div class="form-group  col-md-3">
                        <label for="pass">Confirmar contraseña</label>
                        <input type="password" placeholder="Confirmar Contraseña" pattern="[A-Za-z0-9]+" class="form-control" id="conpass" required>
                        <p class="help-block"></p>
                    </div>
                </div>
                <input type="submit"  value="Registrar"  onclick="registrarProyecto()" class ="btn-verde" />
            </form>
        </div> 

 <script>

        $(document).ready(function () {
            $('input[type="submit"]').attr('disabled', 'disabled');
            $('input[type="text"]').keypress(function () {
                if ($(this).val() != '') {
                    $('input[type="submit"]').removeAttr('disabled');
                }

            });

        });
    </script>

    </body>
</html>
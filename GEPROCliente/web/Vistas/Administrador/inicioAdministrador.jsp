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
    <body>
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
            <button style="float:right; width: 160px" data-toggle="modal" data-target="#exampleModal" class="btn-verde">Crear Proyecto</button>
            <br>
            <br>   
            <div  class="container-fluid">
                <div class="card-group" id="cardsProyectos">

                </div>
            </div>





            <div class="modal bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel" style="color:black">Nuevo Mensaje</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-row">
                                    <div class="form-group  col-md-6">
                                        <input type="text" placeholder="Nombre del Proyecto" pattern="[ A-Za-z0-9-äÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ.]+" class="form-control" id="nombreP" required>
                                        <p class="help-block"></p>
                                    </div>
                                    <div class="form-group  col-md-3">
                                        <input type="text" placeholder="Presupuesto" pattern="[ 0-9.]+" class="form-control" id="presupuesto" required>
                                        <p class="help-block"></p>
                                    </div>
                                    <div class="form-group  col-md-3">
                                        <input type="text" placeholder="Reserva" pattern="[ 0-9.]+" class="form-control" id="reserva" required>
                                        <p class="help-block"></p> 
                                    </div>
                                </div>
                                <div class="form-row" >

                                    <div class="form-group  col-md-4">
                                        <input type="text"   placeholder="Fecha Inicio" id="fechaInicio" class="form-control" id="fechaInicio" required>                                
                                        <p class="help-block"></p> 
                                    </div>
                                    <div class="form-group  col-md-3">
                                        <input type="number"   placeholder="Semanas" id="semanas" class="form-control"  required>                                
                                        <p class="help-block"></p> 
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group  col-md-4">
                                        <input type="text" placeholder="Nombre" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ]+" class="form-control" id="nombreL" required>
                                        <p class="help-block"></p>
                                    </div>
                                    <div class="form-group  col-md-4">
                                        <input type="text" placeholder="Apellido Paterno" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ]+" class="form-control" id="apellidoP" required>
                                        <p class="help-block"></p>
                                    </div>
                                    <div class="form-group  col-md-4">
                                        <input type="text" placeholder="Apellido Materno" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ]+" class="form-control" id="apellidoM" required>
                                        <p class="help-block"></p>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group  col-md-4">
                                        <input type="text" placeholder="Grado Académico" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ.]+" class="form-control" id="grado" required>
                                        <p class="help-block"></p>
                                    </div>
                                    <div class="form-group  col-md-8">
                                        <input type="text" placeholder="Carrera" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ]+" class="form-control" id="carrera" required>
                                        <p class="help-block"></p>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group  col-md-3">
                                        <input type="text" placeholder="Salario" pattern="[ 0-9.]+" class="form-control" id="salario" required>
                                        <p class="help-block"></p>
                                    </div>
                                    <div class="form-group  col-md-3">
                                        <input type="text" placeholder="RFC" pattern="[A-Z0-9]+" class="form-control" id="rfc" required>
                                        <p class="help-block"></p>
                                    </div>

                                    <div class="form-group  col-md-6">
                                        <input type="text" placeholder="Usuario" pattern="[ A-Za-z0-9]+" class="form-control" id="usuario" required>
                                        <p class="help-block"></p>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group  col-md-6">
                                        <input type="email" placeholder="Email" class="form-control" id="email" required>
                                        <p class="help-block"></p>
                                    </div>
                                    <div class="form-group  col-md-6">
                                        <input type="password" placeholder="Contraseña" pattern="[ A-Za-z0-9]+" class="form-control" id="pass" required>
                                        <p class="help-block"></p>
                                    </div>
                                    <div class="form-group  col-md-6">
                                        <input type="password" placeholder="Confirmar Contraseña" pattern="[ A-Za-z0-9]+" class="form-control" id="conpass" required>
                                        <p class="help-block"></p>
                                    </div>
                                </div>
                                <input type="submit"  value="Registrar"  onclick="registrarProyecto()" class ="btn-verde" />
                            </form>
                        </div>
                        <div class="modal-footer">

                        </div>
                    </div>
                </div>
            </div>





































            <div class="modal bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"  id="modalGrande" >
                <div class="modal-dialog modal-lg" >
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                        </div>
                        <div class="modal-footer">
                            <button type="button"   onclick="registrarProyecto()" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>


            <%--
            Inicio del modal por pasos
           
            <form class="modal multi-step" id="demo-modal-3">
                <div class="modal-dialog" id="modal">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 style="font-size: 20px"class="modal-title">Registrar Proyecto</h4>
                            <h4  style="font-size: 15px" class="modal-title step-1" data-step="1">Información del Proyecto</h4>
                            <h4  style="font-size: 15px" class="modal-title step-2" data-step="2">Información de Líder Proyecto</h4>
                            <h4  style="font-size: 15px" class="modal-title step-3" data-step="3">Información de Líder Proyecto</h4>
                        </div>

                    <div class="modal-body step-1" data-step="1">
                        <div class="form-row">
                            <div class="form-group  col-md-6">
                                <input type="text" placeholder="Nombre del Proyecto" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ.]+" class="form-control" id="grado" required>
                                <p class="help-block"></p>
                            </div>
                            <div class="form-group  col-md-6">
                                <input type="text" placeholder="Presupuesto" pattern="[ 0-9.]+" class="form-control" id="grado" required>
                                <p class="help-block"></p>
                            </div>
                        </div>
                        <div class="form-row" >
                            <div class="form-group  col-md-3">
                                <input type="text" placeholder="Reserva" pattern="[ 0-9.]+" class="form-control" id="reserva" required>
                                <p class="help-block"></p> 
                            </div>
                            <div class="form-group  col-md-4">
                                <input type="text"   placeholder="Fecha Inicio" id="fechaInicio" class="form-control" id="fechaInicio" required>                                
                                <p class="help-block"></p> 
                            </div>
                            <div class="form-group  col-md-3">
                                <input type="number"   placeholder="Semanas" id="semanas" class="form-control"  required>                                
                                <p class="help-block"></p> 
                            </div>
                        </div>
                    </div>

                    <div class="modal-body step-2" data-step="2">
                        <div class="form-row">
                            <div class="form-group  col-md-6">
                                <input type="text" placeholder="Nombre" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ]+" class="form-control" id="nombreL" required>
                                <p class="help-block"></p>
                            </div>
                            <div class="form-group  col-md-6">
                                <input type="text" placeholder="Apellido Paterno" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ]+" class="form-control" id="apellidoP" required>
                                <p class="help-block"></p>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group  col-md-6">
                                <input type="text" placeholder="Apellido Materno" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ]+" class="form-control" id="nombreL" required>
                                <p class="help-block"></p>
                            </div>
                            <div class="form-group  col-md-6">
                                <input type="text" placeholder="Grado Académico" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ.]+" class="form-control" id="grado" required>
                                <p class="help-block"></p>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group  col-md-6">
                                <input type="text" placeholder="Carrera" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ]+" class="form-control" id="carrera" required>
                                <p class="help-block"></p>
                            </div>
                            <div class="form-group  col-md-6">
                                <input type="text" placeholder="RFC" pattern="[ A-Z0-9]+" class="form-control" id="grado" required>
                                <p class="help-block"></p>
                            </div>
                        </div>

                    </div>
                    <div class="modal-body step-3" data-step="3">
                        <div class="form-row">
                            <div class="form-group  col-md-6">
                                <input type="text" placeholder="Usuario" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ]+" class="form-control" id="usuario" required>
                                <p class="help-block"></p>
                            </div>
                            <div class="form-group  col-md-6">
                                <input type="text" placeholder="Contraseña" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ.]+" class="form-control" id="pass" required>
                                <p class="help-block"></p>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group  col-md-6">
                                <input type="text" placeholder="Confirmar Contraseña" pattern="[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ]+" class="form-control" id="conpass" required>
                                <p class="help-block"></p>
                            </div>
                            <div class="form-group  col-md-6">
                                <input type="text" placeholder="Salario por hora" pattern="[0-9.]+" class="form-control" id="salario" required>
                                <p class="help-block"></p>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-rojo" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-azul step step-2" data-step="2" onclick="sendEvent('#demo-modal-3', 1)">Atrás</button>
                        <button type="button" class="btn btn-verde step step-1" data-step="1" onclick="sendEvent('#demo-modal-3', 2)">Siguiente</button>
                        <button type="button" class="btn btn-azul step step-3" data-step="3" onclick="sendEvent('#demo-modal-3', 2)">Atrás</button>
                        <button type="button" class="btn btn-verde step step-2" data-step="2" onclick="sendEvent('#demo-modal-3', 3)">Siguiente</button>
                        <button type="button" class="btn btn-verde step step-3" onclick="registrarProyecto()">Registrar</button>

                    </div>
                </div>
            </div>
            <script src="../../js/bootstrap/multi-step-modal.js" type="text/javascript"></script>
        </form>

       
        <script>
            sendEvent = function (sel, step) {
                $(sel).trigger('next.m.' + step);
            }
        </script>
       
        <script>
            $(function () {
                $("#fechaInicio").datepicker();
            });
        </script>
            --%>
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>

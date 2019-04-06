<%-- 
    Document   : inicioLiderdeProyecto
    Created on : 9/03/2019, 03:50:38 PM
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
        <title>Inicio Líder de Proyecto-GEPRO</title>
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
    <body >
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
            <br/>
            <div id="nombrePS">
            </div>
            <button style="float: right; width:210px" class="btn-azul">Seguimiento del Proyecto</button>
            <br>
            <br>
            <div class="row">
                <h2  style="float: left; margin-left: 15px">Presupuesto Actual</h2> <h2 id="presupuestoActual" style="padding-left:  10px"></h2>
            </div>
            <div class="row">
                <h2 style="float: left;margin-left: 15px"> Fecha de inicio</h2> <h2 style="padding-left:  10px" id="fechaInicioSeguimiento"></h2>
                <h2 style="float: left;margin-left: 15px"> Fecha de fin</h2> <h2 style="padding-left:  10px" id="fechaFinSeguimiento"></h2>
            </div>

            <div class="row">
                <h2 style="float: left;margin-left: 15px">Semana </h2> <h2 style="padding-left:  10px" id="semanas">#</h2>
            </div>
            <h2 style="float: left">Recursos Humanos</h2>
            <button style=" margin-left: 200px;" onclick="location.href = '<%=context%>/Vistas/LiderdeProyecto/registroRecursoHumano.jsp'" class="btn-verde">Agregar</button>
            </br>
            </br>
            <table class="table" style="color: white">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Rol</th>
                        <th>Grado Académico</th>
                        <th>Carrera</th>
                        <th>RFC</th>
                        <th>Salario por hora</th>
                    </tr>
                </thead>
                <tbody id="tablaRecursosHumanos">
                </tbody>
            </table>
            <br/>
            <hr/>
            <br/>
            <h2 style="float: left">Recursos Materiales</h2>
            <button style=" margin-left: 190px;"  data-toggle="modal" data-target="#exampleModal" class="btn-verde">Agregar</button>
            </br>
            </br>
            <table class="table" style="color: white">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Costo Unitario</th>
                        <th>Cantidad</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody id="tablaRecursosMateriales">
                </tbody>
            </table>
        </div>

        <%--
        Empieza el modal de los recursos materiales
        --%>
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Registrar Recurso Material</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="#" onsubmit="return false">
                            <div class="form-row">
                                <div class="form-group  col-md-10">
                                    <label style="color:black" for="nombre">Nombre</label>
                                    <input type="text" placeholder="Nombre"  pattern="[ A-Za-z0-9-äÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ.]+" class="form-control" id="nombre" required>
                                    <p class="help-block"></p>
                                </div>

                            </div>
                            <div class="form-row">
                                <div class="form-group  col-md-3">
                                    <label  style="color:black" for="cantidad">Cantidad</label>
                                    <input type="number" placeholder="Cantidad" pattern="[0-9]+" class="form-control" id="cantidad" required>
                                    <p class="help-block"></p>
                                </div>
                                <div class="form-group  col-md-3">
                                    <label style="color:black" for="precio">Precio</label>
                                    <input type="text"  placeholder="Precio" pattern="[0-9.]+" class="form-control" id="precio" required>
                                    <p class="help-block"></p>
                                </div>
                            </div>


                            <div style="float:right">
                                <button type="button" class="btn-rojo" data-dismiss="modal">Cerrar</button>
                                <input type="submit"  value="Registrar"  onclick="registrarRecursoMaterial()" class ="btn-verde" />
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">

                    </div>
                </div>
            </div>
        </div>


 
    </body>
</html>

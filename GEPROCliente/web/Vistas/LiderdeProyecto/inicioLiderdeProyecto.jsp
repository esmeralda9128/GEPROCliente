<%-- 
    Document   : inicioLiderdeProyecto
    Created on : 9/03/2019, 03:50:38 PM
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
        <title>Inicio Líder de Proyecto-GEPRO</title>
        <script src="<%=context%>/js/jqBootstrapValidation.js"></script>
        <script src="<%=context%>/js/sweetalert2.all.min.js"></script>
        <link rel="shortcut icon" href="<%=context%>/imagenes/geprologo.ico"/>
        <link rel="stylesheet" href="<%=context%>/css/bootstrap_4.css">  
        <link rel="stylesheet" href="<%=context%>/css/style.css"> 
        <link rel="stylesheet" href="<%=context%>/css/sweetalert2.min.css">

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
                <button class="btn-sidebar2"><center><img src="<%=context%>/imagenes/logout.png" height="22" style="padding: 0px 15px" />Cerrar Sesión</center></button>
            </div>
        </div>

        <div class="offset-md-2 container">
            </br>
            <h1 style="float:left">Proyecto</h1>
             <button style="float: right; width:210px"  class="btn-azul">Seguimiento del Proyecto</button>
            </br>
            </br>
            <h2 style="float: left">Presupuesto Actual</h2>
            </br>
            <div class="row">
                <h3 style="padding-right: 100px">Fecha inicio</h3>
                <h3>Fecha fin</h3>
            </div>
            </br>
            </br>
            <h2 style="float: left">Recursos Humanos</h2>
            <button style=" margin-left: 200px;"  class="btn-verde">Agregar</button>
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
            </table>
            <br/>
            <hr/>
            <br/>
            <h2 style="float: left">Recursos Materiales</h2>
            <button style=" margin-left: 190px;"  class="btn-verde">Agregar</button>
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
            </table>



        </div>
    </body>
</html>

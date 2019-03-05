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


        <link rel="stylesheet" href="<%=context%>/css/bootstrap_4.css">  
       <link rel="stylesheet" href="<%=context%>/css/style.css"> 
    </head>
    <body>


        <div id="sidebar">
            <h1>Administrador</h1>
            <div class="side-Elements" >

                <button class="btn-sidebar"><center><img src="<%=context%>/imagenes/house-black-silhouette-without-door.png" height="22" style="padding: 0px 20px" />Inicio</center></button>
                <button class="btn-sidebar"><center><img src="<%=context%>/imagenes/user.png" height="22" style="padding: 0px 20px" />Perfil</center></button>
                <button class="btn-sidebar2"><center><img src="<%=context%>/imagenes/logout.png" height="22" style="padding: 0px 15px" />Cerrar Sesión</center></button>

            </div>
        </div>

        <div class="offset-md-2 container " >
            <br>
            <br>
            
            <h1  style="float:left">Proyectos</h1>
            <br>
            <br>
            <br>
            <br>
            
            <div class="card" style="width: 18rem;">
                <div class="card-header" style="background-color: #009475">
                    Proyecto
                </div>
                <div class="card-body">
                    <h5 class="card-title" style="ba">Special title treatment</h5>
                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                    <center>
                        <button class="btn-azul">Ver Petición</button>
                         <button class="btn-rojo">Eliminar</button>
                    
                    </center>
                </div>
            </div>
        </div>




        <script  src="js/bootstrap_4.min.js"></script>

    </body>
</html>

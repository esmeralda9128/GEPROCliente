<%-- 
    Document   : perfilAdministrador
    Created on : 7/03/2019, 09:07:37 PM
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
        <title>Perfil Administrador-GEPRO</title>
        <link rel="shortcut icon" href="<%=context%>/imagenes/geprologo.ico"/>
        <link rel="stylesheet" href="<%=context%>/css/bootstrap_4.css">  
        <link rel="stylesheet" href="<%=context%>/css/style.css"> 
    </head>
    <body>
        <div id="sidebar">
            <p></p>
            <center><img src="<%=context%>/imagenes/geprologo.png" height="92"/></center>
            </br>
            <h1>Administrador</h1>
            <div class="side-Elements" >                
                <button class="btn-sidebar" onclick="location.href='<%=context%>/Vistas/Administrador/inicioAdministrador.jsp'" ><center><img src="<%=context%>/imagenes/house-black-silhouette-without-door.png" height="22" style="padding: 0px 21px" />Inicio</center></button>
                <button class="btn-sidebar"><center><img src="<%=context%>/imagenes/user.png" height="22" style="padding: 0px 21px" />Perfil</center></button>
                <button class="btn-sidebar2"><center><img src="<%=context%>/imagenes/logout.png" height="22" style="padding: 0px 15px" />Cerrar Sesión</center></button>
            </div>
        </div>

        <div class="offset-md-2 container">
            </br>
             <h1 style="float:left">Perfil</h1>
                




        </div>
    </body>
</html>

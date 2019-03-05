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
        <title>JSP Page</title>
        
          
        <link rel="stylesheet" href="<%=context%>/css/style.css">  
    </head>
    <body>
        <div id="sidebar">
    <ul>
    <li>Inicio</li>
    <li>Perfil</li>
    <li>Cerrar Sesión</li>        
    </ul>
        </div>
         <script  src="js/bootstrap_4.min.js"></script>
    </body>
</html>

<%-- 
    Document   : redireccion}
    Created on : 02-abr-2019, 15:14:11
    Author     : Alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<% 
    String context = request.getContextPath();
    if (session.getAttribute("rol") == null){
    response.sendRedirect(context + "/index");
}%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>HOla prueba</h3>
    </body>
    
</html>

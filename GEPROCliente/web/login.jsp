<%-- 
    Document   : login
    Created on : 4/03/2019, 06:08:34 PM
    Author     : horo_
--%>
<%
    String context = request.getContextPath();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" >

    <head>
        <meta charset="UTF-8">
        <title>Login-GEPRO</title>
        <script  src="js/index.js"></script>
        <script src="js/sweetalert2.all.min.js"></script>
        <script src="js/bootstrap_4.min.js"></script>
        <script src="js/jqBootstrapValidation.js"></script>
            
        <link rel="stylesheet" href="css/sweetalert2.min.css">
        <link rel="stylesheet" href="css/style.css">  
    </head>

    <body>
        <link rel="shortcut icon" href="<%=context%>/imagenes/geprologo.ico" />
    <center><img src="<%=context%>/imagenes/geprologo.png"></center>

    <div class="polig">
        <h1>Inicio de sesión</h1>
    </div>
    <div class="login-form">
        <div class="form-group ">
            <input type="text" class="form-control" placeholder="Usuario " id="UserName">
            <i class="fa fa-user"></i>
        </div>
        <div class="form-group log-status">
            <input type="password" class="form-control" placeholder="Contraseña" id="Passwod">
            <i class="fa fa-lock"></i>
        </div>
        <span class="alert">Datos incorrectos</span>

        <button onclick="" type="button" class="log-btn" >Iniciar Sesión</button>   
    </div>

    <script>
        Swal.fire(
                'Good job!',
                'You clicked the button!',
                'success'
                );
    </script>

</body>
</html>

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
        <script  src="<%=context%>/js/index.js"></script>
        <script src="<%=context%>/js/sweetalert/sweetalert2.all.min.js"></script>
        <script src="<%=context%>/js/bootstrap/bootstrap.min.js"></script>
        <script src="<%=context%>/js/jqBootstrapValidation.js"></script>            

    </head>

    <body>

    <center><img src="<%=context%>/imagenes/geprologo.png"></center>

    <div class="polig">
        <h1>Inicio de sesión</h1>
    </div>
    <form action="#" onsubmit="return false;" method="POST">
        <div class="login-form">
            <div class="form-group ">
                <input type="text" name="beanUsuario.usuario" class="form-control" placeholder="Usuario " id="UserName">
                <i class="fa fa-user"></i>
            </div>
            <div class="form-group log-status">
                <input type="password" class="form-control" name="beanUsuario.pass" placeholder="Contraseña" id="Passwod">
                <i class="fa fa-lock"></i>
            </div>
            <span class="alert">Datos incorrectos</span>

            <button type="submit" onclick="login()" class="log-btn" >Iniciar Sesión</button>   

        </div>

    </form>

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

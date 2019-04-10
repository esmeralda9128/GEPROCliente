<%-- 
    Document   : seguimientoLider
    Created on : 2/04/2019, 07:49:34 PM
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
        <title>Seguimiento de Proyecto</title>

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
        <div id="sidebar">
            <p></p>
            <center><img src="<%=context%>/imagenes/geprologo.png" height="92"/></center>
            </br>
            <h1>Líder de Proyecto</h1>
            <h1><%=session.getAttribute("nombre")%></h1>
            <div class="side-Elements" >                
                <button class="btn-sidebar"  onclick="location.href = '<%=context%>/Vistas/LiderdeProyecto/inicioLiderdeProyecto.jsp'"><center><img src="<%=context%>/imagenes/house-black-silhouette-without-door.png" height="22" style="padding: 0px 21px" />Inicio</center></button>
                <button class="btn-sidebar" onclick="location.href = '<%=context%>/Vistas/LiderdeProyecto/perfilLiderdeProyecto.jsp'"><center><img src="<%=context%>/imagenes/user.png" height="22" style="padding: 0px 21px" />Perfil</center></button>
                <button class="btn-sidebar2" onclick="cerrarSesion()"><center><img src="<%=context%>/imagenes/logout.png" height="22" style="padding: 0px 15px" />Cerrar Sesión</center></button>
            </div>
        </div>
        <div class="offset-md-2 container">
            <input type="text" value="<%=session.getAttribute("idProyecto")%>"  id="idProyecto" hidden="true">
            <br/>
            <div id="nombrePS">
            </div>
            <br/>
            <br/>
            <br/>
            <br/>
            <div class="row">
                <div class="col-md-4">
                    <button class="btn-azul-grande" onclick="iniciarSeguimiento()">Iniciar Seguimiento </button>
                </div>
                <div class="col-md-4">
                    <button class="btn-azul-grande" onclick="darSeguimiento()">Dar Seguimiento </button>
                </div>
                <div class="col-md-4">
                    <button class="btn-azul-grande" onclick="location.href = '<%=context%>/Vistas/LiderdeProyecto/seguimientoEmpleado.jsp'">Seguimiento de Empleados </button>
                </div>
            </div>
            <br/>
            <br/>

            <div class="container" >
                <div class="row">
                    <div class="col-md-4">
                        <h2 style="float: left" id="txt1"></h2>
                    </div>
                    <div class="col-md-4">
                        <h2 style="float: left" id="txt2"></h2>
                    </div>
                    <div class="col-md-4">
                        <h2 style="float: left" id="txt3"></h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <h2 style="float: left" id="presupuestoInicial"></h2>
                    </div>
                    <div class="col-md-4">
                        <h2 style="float: left" id="presupuestoActual"></h2>
                    </div>
                    <div class="col-md-4">
                        <h2 style="float: left" id="totalPagado"></h2>
                    </div>
                </div>
                <br/>
                <div class="row" id="botones">
                </div>
                <br/>
                <div class="row">
                    <div class="col-md-6">                     
                        <h2 style="float: left" id="txt4"></h2>
                    </div>
                    <div class="col-md-6">  
                        <div id="opcion"></div>
                    </div>
                </div>
                <br/>
                <div id="tablaRecursos" class="row">
                    <table class="table" style="color: white">
                        <thead id="cabeceraTablaRecursos">

                        </thead>
                        <tbody id="bodyTablaRecursos">

                        </tbody>
                    </table>  
                </div>
            </div>
            <form action="<%=context%>/reporteNominas" target="_blank" id="formReporte" method="post">
                <input type="text" value="<%=session.getAttribute("idProyecto")%>" name="idProyectoReporte"  id="idProyectoReporte" hidden="true">
            </form>
        </div>
        <script>
            var peticion = new XMLHttpRequest();
            var idProyecto = {proyecto: document.getElementById("idProyecto").value};
            peticion.onreadystatechange = function () {
                if (this.status === 200 && this.readyState === 4) {
                    var respuesta = JSON.parse(this.responseText);
                    proyecto = respuesta.respuesta.proyecto;
                    semana = respuesta.respuesta.semana;
                    materiales = respuesta.respuesta.recursosMateriales;
                    humanos = respuesta.respuesta.recursosHumanos;
                    costoReal = respuesta.respuesta.presuPuestoGastado;
                    recursoHumanos = respuesta.respuesta.recursosHumanos;
                }
                $('#nombrePS').html('');
                $('#nombrePS').append('<h1 style="float: left">' + proyecto.nombre + '</h1>');


            }
            peticion.open("GET", "http://localhost:8080/GEPROServidor/servicioGEPRO/proyecto/seguimientoProyecto?proyecto=" + JSON.stringify(idProyecto), true);
            peticion.send();

            function iniciarSeguimiento() {
                $('#cabeceraTablaRecursos').html('');
                $('#bodyTablaRecursos').html('');
                $('#opcion').html('');
                $('#botones').html('');
                $('#presupuestoInicial').html('');
                $('#presupuestoActual').html('');
                $('#totalPagado').html('');
                $('#botones').append('<div class="col-md-3"><button class="btn-azul-largo" onclick="verEmpleados()">Pagar Nóminas</button></div><div class="col-md-3"><button class="btn-azul-largo" onclick="verMateriales()">Comprar Materiales</button></div>');
                $('#txt1').html('');
                $('#txt2').html('');
                $('#txt3').html('');
                $('#txt4').html('');
                $('#txt1').append('Semana ' + semana);
            }
            function darSeguimiento() {
                $('#cabeceraTablaRecursos').html('');
                $('#bodyTablaRecursos').html('');
                $('#botones').html('');
                $('#botones').append('<div class="col-md-6"><button class="btn-azul-largo" onclick="verNominasPDF()">Ver Nóminas</button></div><div class="col-md-6"><button class="btn-azul-largo" onclick="verMaterialesPDF()">Ver Materiales</button></div>');
                $('#opcion').html('');
                $('#txt4').html('');
                $('#txt1').html('');
                $('#txt1').append('Presupuesto Inicial');
                $('#txt2').html('');
                $('#txt2').append('Presupuesto Actual');
                $('#txt3').html('');
                $('#txt3').append('Presupuesto Planeado');
                $('#presupuestoInicial').html('');
                $('#presupuestoInicial').append('$ ' + proyecto.presupuestoInicial);
                $('#presupuestoActual').html('');
                $('#presupuestoActual').append('$ ' + proyecto.presupustoActual);
                $('#totalPagado').html('');
                $('#totalPagado').append('$ ' + costoReal);
            }

            function verEmpleados() {
                $('#txt4').html('');
                $('#txt4').append('Empleados');
                $('#opcion').html('');
                $('#opcion').append('');
                $('#cabeceraTablaRecursos').html('');
                $('#cabeceraTablaRecursos').append('<tr><th style="width: 400px">Nombre</th><th style="width: 200px">Rol</th><th style="width: 122px">Valor Ganado</th><th style="width: 122px">Pagar</th></tr>');
                $('#bodyTablaRecursos').html('');
                if (recursoHumanos != null) {
                    for (var i = 0; i < recursoHumanos.length; i++) {
                        $('#bodyTablaRecursos').append('<tr><th>' + recursoHumanos[i].nombre + ' ' + recursoHumanos[i].primerApellido + ' ' + recursoHumanos[i].segundoApellido + '</th><th>' + recursoHumanos[i].rol + '</th><th><input size="3"  maxlength="5" pattern="[ 0-9.]+" type="text" placeholder="%"  id="' + i + '"></th><th><button class="btn-verde" onclick="pagarNominas(' + i + ',' + recursoHumanos[i].id + ')">Pagar</button></th></tr>');
                    }
                }
            }

            function verMateriales() {
                $('#opcion').html('');
                $('#opcion').append('<button class="btn-verde" id="enviar" onclick="comprarMateriales()">Comprar</button>');
                $('#txt4').html('');
                $('#txt4').append('Materiales');
                $('#cabeceraTablaRecursos').html('');
                $('#cabeceraTablaRecursos').append('<tr><th>Nombre</th><th>Precio Unitario</th><th>Cantidad</th><th>Subtotal</th><th>Comprar</th></tr>');
                $('#bodyTablaRecursos').html('');
                if (materiales != null) {
                    for (var i = 0; i < materiales.length; i++) {
                        $('#bodyTablaRecursos').append('<tr><th>' + materiales[i].nombreRecursoMat + '</th><th>' + materiales[i].costoUnitario + '</th><th>' + materiales[i].cantidad + '</th><th>' + materiales[i].total + '</th> <th><input name="checks[]" type="checkbox" value="' + materiales[i].idRecuroMat + '"></th></tr>');
                    }
                }
            }
            function pagarNominas(indice, id) {
                
            }
            
            function verNominasPDF(){
                $("#formReporte").submit();
            }

            function comprarMateriales() {
                let valoresCheck = [];

                $("input[type=checkbox]:checked").each(function () {
                    valoresCheck.push(this.value);
                });
                peticion.onreadystatechange = function () {
                    var respuesta = JSON.parse(this.responseText);
                    mensaje = respuesta.respuesta.mensaje;
                    mensaje1 = respuesta.respuesta.mensaje2;
                    total = respuesta.respuesta.total;
                   if(total>0){
                    Swal.fire({
                        title: mensaje,
                        text: mensaje1,
                        type: 'question',
                        showCancelButton: true,
                        confirmButtonColor: '#009475',
                        cancelButtonColor: '#E61A1A',
                        confirmButtonText: 'Si, deseo comprarlos!'
                    }).then((result) => {
                        if (result.value) {
                            Swal.fire(
                                    '¡Comprados!',
                                    'Se han comprado los Recursos Materiales, se descontaron del presupuesto.',
                                    'success'
                                    )
                        }
                    })
                    }else{
                        Swal.fire(
                                    '¡Error!',
                                    'Debes seleccionar los Recursos a Comprar',
                                    'error'
                                    )
                    }

                }
                peticion.open("GET", "http://localhost:8080/GEPROServidor/servicioGEPRO/proyecto/comprarRecurso?materiales=" + JSON.stringify(valoresCheck), true);
                peticion.send();
            }
            
            
        </script>
    </body>
</html>

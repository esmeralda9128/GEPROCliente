var peticion = new XMLHttpRequest();


var raiz = window.location.origin + '/GEPROCliente/';
function variaciondelCronograma() {

    Swal.fire(
            'Good job!',
            'You clicked the button!',
            'success'
            );
    document.getElementById('valores').innerHTML = '';
    $('#valores').append('<h3>' + "Variacion del cronograma" + '</h3><h3>' + "Valor>0" + '</h3>');

}


function variaciondelCosto() {

    Swal.fire(
            'Good job!',
            'You clicked the button!',
            'success'
            );
    document.getElementById('valores').innerHTML = '';
    $('#valores').append('<h3>' + "Variación del Costo" + '</h3><h3>' + "Valor>0" + '</h3>');

}
function indicedeDesempenodelCronograma() {

    Swal.fire(
            'Good job!',
            'You clicked the button!',
            'success'
            );
    document.getElementById('valores').innerHTML = '';
    $('#valores').append('<h3>' + "Índice de Desempeño del Cronograma" + '</h3><h3>' + "Valor>0" + '</h3>');

}
function indicedeDesempexodelCosto() {

    Swal.fire(
            'Good job!',
            'You clicked the button!',
            'success'
            );
    document.getElementById('valores').innerHTML = '';
    $('#valores').append('<h3>' + "Índice de Desempeño del Costo" + '</h3><h3>' + "Valor>0" + '</h3>');

}


function login() {
    var usuario = {
        usuario: document.getElementById("UserName").value,
        pass: document.getElementById("Passwod").value
    };
    peticion.onreadystatechange = function () {
        if (this.status === 200) {
            var respuesta = JSON.parse(this.responseText);
//            Swal.fire({
//                    respuesta.mensaje,
//                    '',
//                    respuesta.respuesta.tipo
//                }).then((result) => {
                    window.location.href = "http://localhost:8080/GEPROCliente"+respuesta.dir;
//                });

        }
    };
    peticion.open("GET", "http://localhost:8080/GEPROCliente/servicioGEPRO/iniciarSesion?parametros="
            + JSON.stringify(usuario), true);
    peticion.send();
}




//function eliminarProyecto(idProyecto) {
//    var id = {idProyecto};
//    peticion.onreadystatechange = function () {
//        if (this.status === 200 && this.readyState === 4) {
//            var respuesta = JSON.parse(this.responseText);
//            $('#cardsProyectos').html('');
//            var proyectos = respuesta.respuesta.proyectos;
//            if (proyectos !== null) {
//                for (var i = 0; i < proyectos.length; i++) {
//                    $('#cardsProyectos').append(' <div class="col-md-4"><div class="card" style="width: 18rem;"><div class="card-header" style="background-color: #009475">' + proyectos[i].nombre + '</div><div class="card-body"><h5 class="card-title" >' + proyectos[i].lider.nombre + ' ' + proyectos[i].lider.primerApellido + ' ' + proyectos[i].lider.segundoApellido + '</h5><p class="card-text">' + 'Semanas ' + proyectos[i].semanas + '<br/>' + 'Prespuesto ' + proyectos[i].presupuestoInicial + '</p><center><button class="btn-azul" onclick="consultarProyectoAdmin(' + proyectos[i].idProyecto + ')">Seguimiento</button><button class="btn-rojo" onclick="eliminarProyecto(' + proyectos[i].idProyecto + ')">Eliminar</button></center></div></div><br/></div>');
//                }
//            }
////            Swal.fire(
////                    respuesta.respuesta.mensaje,
////                    '',
////                    respuesta.respuesta.tipo,
////                    );
//        }
//    }
//    peticion.open("GET", "http://localhost:8080/GEPROCliente/servicioGEPRO/proyecto/eliminarProyecto?proyecto="
//            + JSON.stringify(id), true);
//    peticion.send();
//
//}
////
//
//
//function consultarProyectoAdmin(idProyecto) {
//    var id = {idProyecto};
//    peticion.onreadystatechange = function () {
//        if (this.status === 200 && this.readyState === 4) {
//            window.location.replace("http://localhost:8080/GEPROCliente/Vistas/Administrador/seguimientoAdministrador.jsp");
//        }
//    }
//    peticion.open("GET", "http://localhost:8080/GEPROCliente/servicioGEPRO/proyecto/consultarProyecto?proyecto="
//            + JSON.stringify(id), true);
//    peticion.send();
//}
//
//function consultarProyectoLider(idProyecto) {
//    var id = {idProyecto};
//    peticion.onreadystatechange = function () {
//        if (this.status === 200 && this.readyState === 4) {
//            window.location.replace("http://localhost:8080/GEPROCliente/Vistas/LiderdeProyecto/inicioLiderdeProyecto.jsp");
//        }
//    }
//    peticion.open("GET", "http://localhost:8080/GEPROCliente/servicioGEPRO/proyecto/consultarProyecto?proyecto="
//            + JSON.stringify(id), true);
//    peticion.send();
//}
//
//
//
//
//function registrarRecursoHumano() {
//
//    var beanUsuario = {
//        nombre: document.getElementById("nombreL").value,
//        apellidoP: document.getElementById("apellidoP").value,
//        apellidoM: document.getElementById("apellidoM").value,
//        grado: document.getElementById("grado").value,
//        rfc: document.getElementById("rfc").value,
//        carrera: document.getElementById("carrera").value,
//        email: document.getElementById("email").value,
//        usuario: document.getElementById("usuario").value,
//        pass: document.getElementById("pass").value,
//        conpass: document.getElementById("conpass").value,
//        salario: document.getElementById("salario").value,
//        rol: document.getElementById("rol").value
//    };
//    peticion.onreadystatechange = function () {
//        if (this.status === 200) {
//            var respuesta = JSON.parse(this.responseText);
//            Swal.fire(
//                    respuesta.respuesta.mensaje,
//                    '',
//                    respuesta.respuesta.tipo,
//                    ).then((value) => {
//                if (respuesta.respuesta.registro) {
//
//                    window.location.href = "http://localhost:8080/GEPROCliente/Vistas/LiderdeProyecto/inicioLiderdeProyecto.jsp";
//                }
//            });
//
//
//
//        }
//    }
//    peticion.open("GET", "http://localhost:8080/GEPROCliente/servicioGEPRO/proyecto/registroRecursoHumano?usuario=" + JSON.stringify(beanUsuario), true);
//    peticion.send();
//}
//
//function registrarRecursoMaterial() {
//    var beanRecursoMaterial = {
//        nombre: document.getElementById("nombre").value,
//        cantidad: document.getElementById("cantidad").value,
//        precio: document.getElementById("precio").value
//    };
//    peticion.onreadystatechange = function () {
//        if (this.status === 200) {
//            var respuesta = JSON.parse(this.responseText);
//            var recursoHumanos = respuesta.respuesta.recursosMateriales;
//            Swal.fire(
//                    respuesta.respuesta.mensaje,
//                    '',
//                    respuesta.respuesta.tipo,
//                    );
//        }
//        $('#tablaRecursosMateriales').html('');
//        if (recursoHumanos === null) {
//            $('#tablaRecursosMateriales').append('<h2>No hay recursos registrados</h2>');
//        } else {
//            for (var i = 0; i < recursoHumanos.length; i++) {
//                $('#tablaRecursosMateriales').append('<tr><td>' + recursoHumanos[i].nombreRecursoMat + '</td><td>' + recursoHumanos[i].costoUnitario + '</td><td>' + recursoHumanos[i].cantidad + '</td><td>' + recursoHumanos[i].total + '</td></tr>');
//            }
//        }
//    }
//    
//     peticion.open("GET", "http://localhost:8080/GEPROCliente/servicioGEPRO/proyecto/registroRecursoMaterial?material=" + JSON.stringify(beanRecursoMaterial), true);
//    peticion.send();
//}
//
////
////

//
//
//
//
//
//

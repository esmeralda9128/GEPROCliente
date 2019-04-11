var peticion = new XMLHttpRequest();
// comentario
var raizVista = window.location.origin + '/GEPROCliente';

var raiz = window.location.origin + '/GEPROServidor/';
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
            var dir = respuesta.dir;
            var nom = respuesta.mensaje;
            if (usuario.usuario.length == 0 || usuario.pass.length==0) {
                Swal.fire({
                    title: 'Error',
                    text: 'No puedes dejar campos vac\u00EDos',
                    type: 'error',
                    confirmButtonColor: '#009475',
                    confirmButtonText: 'Aceptar'
                })
            } else {
                if (dir === "/index.jsp") {
                    Swal.fire({
                        title: 'Sesi\u00f3n incorrecta',
                        text: "Usuario y/o contrase\u00F1a incorrectos",
                        type: 'error',
                        confirmButtonColor: '#009475',
                        confirmButtonText: 'Aceptar'
                    })
                } else {

                    window.location.href = raizVista + dir;
                }
            }
        }
    };
    peticion.open("GET", "http://localhost:8080/GEPROCliente/servicioGEPRO/iniciarSesion?parametros="
            + JSON.stringify(usuario), true);
    peticion.send();
}

function cerrarSesion() {
    Swal.fire({
        title: 'Cerrar sesi\u00f3n',
        text: '\u00BFDeseas cerrar sesi\u00f3n?',
        type: 'question',
        showCancelButton: true,
        confirmButtonColor: '#009475',
        cancelButtonColor: '#E61A1A',
        confirmButtonText: 'Si, cerrar sesi\u00f3n'
    }).then((result) => {
        if (result.value) {
            window.location.replace("http://localhost:8080/GEPROCliente/cerrarSesion");
        }
    })
}

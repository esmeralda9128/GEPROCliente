var peticion = new XMLHttpRequest();
// comentario


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

            window.location.href = "http://localhost:8080/GEPROCliente" + respuesta.dir;

        }
    };
    peticion.open("GET", "http://localhost:8080/GEPROCliente/servicioGEPRO/iniciarSesion?parametros="
            + JSON.stringify(usuario), true);
    peticion.send();
}

function cerrarSesion() {
    Swal.fire({
        title: 'Cerrar sesión?',
        text: "Seguro?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, cerrar sesión'
    }).then((result) => {
        if (result.value) {
            window.location.replace("http://localhost:8080/GEPROCliente/cerrarSesion");
        }
    })
}

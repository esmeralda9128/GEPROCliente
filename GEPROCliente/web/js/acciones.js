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
function indicedeDesempeñodelCosto() {

    Swal.fire(
            'Good job!',
            'You clicked the button!',
            'success'
            );
    document.getElementById('valores').innerHTML = '';
    $('#valores').append('<h3>' + "Índice de Desempeño del Costo" + '</h3><h3>' + "Valor>0" + '</h3>');

}





function registrarProyecto() {
    var beanProyecto = {
        nombre: document.getElementById("nombreP").value,
        presupuesto: document.getElementById("presupuesto").value,
        reserva: document.getElementById("reserva").value,
        fecha: document.getElementById("fechaInicio").value,
        semanas: document.getElementById("semanas").value
    };
    var beanUsuario = {
        nombre: document.getElementById("nombreL").value,
        apellidoP: document.getElementById("apellidoP").value,
        apellidoM: document.getElementById("apellidoM").value,
        grado: document.getElementById("grado").value,
        rfc: document.getElementById("rfc").value,
        carrera: document.getElementById("carrera").value,
        email: document.getElementById("email").value,
        usuario: document.getElementById("usuario").value,
        pass: document.getElementById("pass").value,
        conpass: document.getElementById("conpass").value,
        salario: document.getElementById("salario").value

    };

    peticion.onreadystatechange = function () {
        if (this.status === 200 && this.readyState === 4) {
            var respuesta = JSON.parse(this.responseText);
            if (proyectos !== null) {
                 document.getElementById('cardsProyectos').innerHTML = '';
                for (var i = 0; i < proyectos.length; i++) {
                    $('#cardsProyectos').append(' <div class="col-md-4"><div class="card" style="width: 18rem;"><div class="card-header" style="background-color: #009475">' + proyectos[i].nombre + '</div><div class="card-body"><h5 class="card-title" >' +proyectos[i].lider.nombre+' '+proyectos[i].lider.primerApellido +' '+proyectos[i].lider.segundoApellido  + '</h5><p class="card-text">'+'Semanas '+proyectos[i].semanas+'<br/>' +'Prespuesto '+proyectos[i].presupuestoInicial + '</p><center><button class="btn-azul">Seguimiento</button><button class="btn-rojo">Eliminar</button></center></div></div><br/></div>');
                }
            }
            Swal.fire(
                    respuesta.respuesta.mensaje,
                    '',
                    respuesta.respuesta.tipo,
                    );
            var proyectos = respuesta.respuesta.proyectos;
            
        }
    }
    peticion.open("GET", "http://localhost:8080/GEPROCliente/servicioGEPRO/proyecto/registroProyecto?proyecto="
            + JSON.stringify(beanProyecto) + "&usuario=" + JSON.stringify(beanUsuario), true);
    peticion.send();

}



var peticion = new XMLHttpRequest();
peticion.onreadystatechange = function () {
    if (this.status === 200 && this.readyState === 4) {
        var respuesta = JSON.parse(this.responseText);
        var proyectos = respuesta.respuesta.proyectos;
        if (proyectos !== null) {
            for (var i = 0; i < proyectos.length; i++) {
                $('#cardsProyectos').append(' <div class="col-md-4"><div class="card" style="width: 18rem;"><div class="card-header" style="background-color: #009475">' + proyectos[i].nombre + '</div><div class="card-body"><h5 class="card-title" >' +proyectos[i].lider.nombre+' '+proyectos[i].lider.primerApellido +' '+proyectos[i].lider.segundoApellido  +'</h5><p class="card-text">' +'Semanas '+proyectos[i].semanas+'<br/>' +'Prespuesto '+proyectos[i].presupuestoInicial + '</p><center><button class="btn-azul">Seguimiento</button><button class="btn-rojo">Eliminar</button></center></div></div><br/></div>');
            }
        }
    }
}

peticion.open("GET", "http://localhost:8080/GEPROCliente/servicioGEPRO/proyecto/consultarProyectos", true);
peticion.send();







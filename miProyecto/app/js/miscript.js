    // ESTABLECEMOS LAS VARIABLES QUE USAREMOS A 0 PARA LOS INVITADOS 
    let idUsuario = "1"
    let username = ""
    let nombreUsuario = ""
    let apellidoUsuario = ""
    let imagenUsuario = ""
    let rolUsuario = "invitado"
    let arrReservas = []

    let estiloActivo = ""

$(function () {

    // CARGAMOS HOME AL CARGAR LA PAGINA
    $.ajax({
        url: 'html/home.html',
        type: 'GET',
        success: function(respuesta) {
            $("#contenido").html(respuesta)
            rememberUser()
            cargarCanciones()
            getEstilosMusica()
            generarTarjetasEventos(estiloActivo)
            
        },
        error: function() {
            //alert("Error al cargar el JSON")
        }
    })    






    
    // ACCESOS DE LA BARRA DE NAVEGACION
    



    // ACCESO HOME
    $('body').on('click','#home',function () {
        $.ajax({
            url: 'html/home.html',
            type: 'GET',
            success: function(respuesta) {
                $("#contenido").html(respuesta)
                cargarCanciones()
                getEstilosMusica()
                generarTarjetasEventos(estiloActivo)

            },
            error: function() {
                //alert("Error al cargar el JSON")
            }
        })    
    })

      


    // ACCESO DESCUBRE
    $('body').on('click','#descubre',function () {
        $.ajax({
            url: 'html/descubre.html',
            type: 'GET',
            success: function(respuesta) {
                $("#contenido").html(respuesta)
                cargarEstadios()
            },
            error: function() {
                //alert("Error al cargar el JSON")
            }
        })    
    })




// AUTOCOMPLETAR CUADRO DE BUSQUEDA

$('body').on('click','#searchButton',function () {
    //alert($('#searchInput').val())
})
    
$('#searchInput').autocomplete({
    source: 'php/autocompletar.php'
});



// ########################################################################
//      GESTION DE USUARIOS






    // LOGIN
    let isLoggedIn = false;
    if (!isLoggedIn) {
        $("#menuUser").hide()
        $("#administrar").hide()
    }

    $('body').on('click','#acceso',function () {
        $('#loginModal').modal('show');
        $("#loginError").hide()
        $('body').off('click', '#entrar').on('click', '#entrar', function () {
            let user = $("#email").val().split("@")[0];
            let password = $("#password").val();
            let rememberme = $("#rememberme").prop('checked') == true
            //alert(rememberme)
            accesoUsuario(user, password,rememberme);
            idUsuario = ""
        });
      })

      // CERRAR SESSION
      $('body').on('click','#cerrarSesion',function () {
            $("#menuUser").hide()
            $("#acceso").show()
            $("#administrar").hide()
            isLoggedIn = false;
            idUsuario = ""
            username = ""
            nombreUsuario = ""
            apellidoUsuario = ""
            imagenUsuario = ""
            rolUsuario = "invitado"

            $.ajax({
                url: 'php/logout.php',
                type: 'POST',

                success: function (respuesta) {
                    //alert(respuesta)
                },
                error: function () {
                console.log('Error al cargar el JSON');
                }
                });   
            
      })

      // REGISTRO DE USUARIO

      $('body').on('click','.registrar',function () {
        $('#loginModal').modal('hide');
        $('#registerModal').modal('show');

        //El boton de registrarse estara deshabilitado hasta que no esten completos los campos necesarios
        $("#registrarme").prop("disabled", true)
        
        let userCheck
        let passCheck
        let mailCheck
        
        // Comprobamos que el usuario es valido (no existe)
        $("#userRegister").on('keyup',function () {
            if ($("#userRegister").val().length<4) {
                $('#userExistCheck').removeClass("text-success")
                $('#userExistCheck').addClass("text-danger")
                $('#userExistCheck').text("El usuario es demasiado corto")
            } else {

                checkRegisterUser($("#userRegister").val(), function (usuarioValido) {
                    if (usuarioValido) {
                        $('#userExistCheck').removeClass("text-danger")
                        $('#userExistCheck').addClass("text-success")
                        $('#userExistCheck').text("El usuario es válido")
                        userCheck = true;
                    } else {
                        $('#userExistCheck').removeClass("text-success")
                        $('#userExistCheck').addClass("text-danger")
                        $('#userExistCheck').text("Ese usuario ya existe")
                        userCheck = false;
                    }
                });
            }
            
        })
        
        // Comprobamos que el correo sea valido
        $('#emailRegister').on('keyup',function () {
            // Comprobamos que el correo tenga @
            // Comprobamos que antes y despues del @ la longuitud no sea menor de 0
            // Comprobamos que tiene . despues del @
            // Comprobamos que antes y despues del . la longuitud no sea menor de 0
            

            if ($('#emailRegister').val().includes("@") 
            && $('#emailRegister').val().split("@")[0].length>0
            && $('#emailRegister').val().split("@")[1].length>0
            

            && $('#emailRegister').val().split("@")[1].includes(".")
            && $('#emailRegister').val().split("@")[1].split(".")[0].length>0
            && $('#emailRegister').val().split("@")[1].split(".")[1].length>1
            
            ) {
             
                $('#mailCheck').removeClass("text-danger")
                $('#mailCheck').addClass("text-success")
                $('#mailCheck').text("El correo es valido")
                mailCheck = true
            } else {
                $('#mailCheck').removeClass("text-success")
                $('#mailCheck').addClass("text-danger")
                $('#mailCheck').text("El correo no es valido")
                mailCheck = false
            }
        })

        // Comprobamos seguridad de la password
        
        $('#passwordRegister1').on('keyup',function () {
            if (checkPasswordStrong($('#passwordRegister1').val())) {
                $('#passwordStrongCheck').removeClass("text-danger")
                $('#passwordStrongCheck').addClass("text-success")
                $('#passwordStrongCheck').text("La Contraseña es valida")
            } else {
                $('#passwordStrongCheck').removeClass("text-success")
                $('#passwordStrongCheck').addClass("text-danger")
                $('#passwordStrongCheck').text("La Contraseña es debil")
            }

        })

        $('#passwordRegister2').on('keyup',function () {
            if ($('#passwordRegister1').val() == $('#passwordRegister2').val() ) {
                $('#passwordCheck').removeClass("text-danger")
                $('#passwordCheck').addClass("text-success")
                $('#passwordCheck').text("Las Contraseñas coinciden")
                passCheck = true
            } else {
                $('#passwordCheck').removeClass("text-success")
                $('#passwordCheck').addClass("text-danger")
                $('#passwordCheck').text("Las Contraseñas no coinciden")
                passCheck = false
            }

        })

        $('#userRegister, #passwordRegister1, #passwordRegister2').on('keyup',function () {
            if (userCheck && passCheck && mailCheck) {
                $("#registrarme").prop("disabled", false)
            } else {
                $("#registrarme").prop("disabled", true)
            }
        })

        $('body').on('click','#registrarme',function () {
            let userToRegister = $("#userRegister").val()
            let passToRegister = $('#passwordRegister1').val()
            let mailToRegister = $('#emailRegister').val()
            let nameToRegister = $('#nameRegister').val()
            let lastNameToRegister = $('#lastNameRegister').val()

            $.ajax({
                url: 'php/registerUser.php',
                type: 'POST',
                data: {"userToRegister": userToRegister,
                    "passToRegister": passToRegister,
                    "mailToRegister": mailToRegister,
                    "nameToRegister": nameToRegister,
                    "lastNameToRegister": lastNameToRegister
                },
                success: function (respuesta) {
                    //alert(respuesta)
                    if (respuesta) {
                        //alert("Registro con exito!")
                        $('#registerModal').modal('hide');
                    } else {
                        //alert("ERROR EN EL REGISTRO :(")
                    }
                //    //alert("Datos enviados " + respuesta);
                    // //alert(respuesta)
                    // $(".filaArtistas").html("")
                    // var infoEntradas = JSON.parse(respuesta);
                    // $.each(infoEntradas, function (index, entrada) {
                    //     // //alert(entrada.butaca)
        
                    // })
                    
                },
                error: function () {
                console.log('Error al cargar el JSON');
                }
                });   

        })
    })


      
// PAGINA HOME

// BOTONES PARA CARGAR LOS DISTINTOS EVENTOS SEGUN SU GENERO



$('body').on('click','.btnGeneroMusical',function () {
    
    estiloActivo = $(this).text()
    generarTarjetasEventos($(this).text())
  })




// ########################################################################

      // GESTION DEL IFRAME DINAMICO CON LAS CANCIONES

      $('body').on('click','.cancion',function () {
        
        let videoYT = $(this).find(".videoURL").text(); // ID del video de YouTube
        // $('#videoYT').html(videoYT)
        // player.loadVideoById(videoId);
        // //alert($('#videoYT iframe').attr("src"))
        $('#videoYT iframe').attr("src",videoYT)
        // //alert($('#videoYT iframe').attr("src"))
      })




/* *********************************************************************************************** */


    // PAGINA COMPRAR
    // BOTON COMPRAR (SOLO FUNCIONA CON .CARD SELECCIONADO)

    $("#comprar").addClass("disabled")
    let idEvento
    let imagenArtista
    let tituloArtista
    let lugarConcierto
    let fechaEvento
    // SELECCIONAMOS .CARD (EVENTO)
    $('body').on('click','.card',function () {
        $(".card").each(function () {
            $(this).removeClass('eventoSeleccionado')
        })

        $(this).addClass('eventoSeleccionado')

        $("#comprar").removeClass("disabled")
        idEvento = $(this).find(".idEvento").text()
        tituloArtista = $(this).find(".tituloArtista").text()
        imagenArtista = $(this).find(".imagenArtista").attr("src")
        lugarConcierto = $(this).find(".lugarConcierto").text()
        fechaEvento = $(this).find(".fechaEvento").text()
    })

    // PULSAMOS BOTON COMPRAR
    $('body').on('click','#comprar',function () {
        $.ajax({
            url: 'html/comprar.html',
            type: 'GET',
            success: function(respuesta) {
                $("#contenido").html(respuesta)
                eventoSeleccionadoParaComprar(tituloArtista,imagenArtista,lugarConcierto,fechaEvento)
                cargarInfoEntradas(idEvento)
                for (let i in arrReservas) {
                    let idEventoReservado = arrReservas[i].split(",")[0]
                    let idUsuarioEvReservado = arrReservas[i].split(",")[1]
                    let butacaReservada = arrReservas[i].split(",")[2]
                    let nombreReserva = arrReservas[i].split(",")[3]
                    let apellidosReserva = arrReservas[i].split(",")[4]
                    let imagenReserva = arrReservas[i].split(",")[5]
                    //CAMBIAMOS LAS BUTACAS 
                    if (idEventoReservado == idEvento) {
                        $(".asiento").each(function name() {
                            if ($(this).text()==butacaReservada) {
                                $(this).addClass("reservado")
                            }
                        })                
                    }

                    // Añadimos el contenido a Fila Butacas
                    $("#reservas h2").after(filaReserva(imagenReserva,nombreReserva,apellidosReserva,butacaReservada))
                }
                
            },
            error: function() {
                //alert("Error al cargar el JSON")
            }
        })    
    })

    // BOTON PARA RESERVAR EL EVENTO PARA NOSOTROS ()

    $('body').on('click','.botonReservar',function () {
        let nombreReserva = $('.nombre').val()
        let apellidosReserva = $('.apellidos').val()
        let butacaReserva = $('.butaca').text()
        let imagenArtistaReserva = $("#imagenArtista").attr("src")
        
        if (nombreReserva.length <= 0 ||apellidosReserva.length <= 0 ||butacaReserva.length <= 0) {
            //alert("Los datos no pueden estar vacios")
        } else {
            $('.asiento').each(function () {
                if ($(this).hasClass('seleccionado')) {
                    $(this).removeClass('seleccionado')
                    $(this).addClass('reservado')
                }
            })
    
            $("#reservas h2").after(filaReserva(imagenArtistaReserva,nombreReserva,apellidosReserva,butacaReserva))
            arrReservas.push(idEvento+","+idUsuario+","+butacaReserva+","+nombreReserva+","+apellidosReserva+","+imagenArtistaReserva)
        }
        
    })

    // BOTON PARA COMPRAR FINAL DE LA ENTRADA

    $('body').on('click','.botonComprarEntradas',function () {
        let idEventoReservado
        let idUsuarioEvReservado 
        let butacaReservada
        let nombreReserva
        let apellidoReserva
        for (let i in arrReservas) {
            idEventoReservado = arrReservas[i].split(",")[0]
            idUsuarioEvReservado = arrReservas[i].split(",")[1]
            butacaReservada = arrReservas[i].split(",")[2]
            nombreReserva = arrReservas[i].split(",")[3]
            apellidoReserva = arrReservas[i].split(",")[4]
            
            //CAMBIAMOS LAS BUTACAS DE RESERVADAS A COMPRADAS
            if (idEventoReservado == idEvento) {
                $(".asiento").each(function name() {
                    if ($(this).text()==butacaReservada) {
                        $(this).addClass("comprado")
                    }
                })                
            }
            
            //alert(idEventoReservado + " | " +  idUsuarioEvReservado+ " | " +butacaReservada + " | " +nombreReserva + " | " +apellidoReserva)

            comprarEvento(idEventoReservado,idUsuarioEvReservado,butacaReservada,nombreReserva,apellidoReserva)
        }
        
        

        // VACIAMOS EL ARRAY DE LAS RESERVAS QUE TENEMOS
        arrReservas = []
        //ELIMINAMOS LAS  butacasReservadas DE LAS LISTA DE BUTACAS EN RESERVA
        $(".butacasReservadas").each(function () {
            $(this).remove()
        })
    })

    // MODIFICAMOS LOS ASIENTOS AL PULSARLOS 
    // LOS ASIENTOS TIENEN 
    // 1: Disponible -> El Asiento esta Disponible y se puede reservar (GRIS)
    // 2: Seleccionado -> El Asiento esta seleccionado pero aun no se ha reservado (AMARILLO)
    // 3: Reservado -> El Asiento se marca como reservado (AZUL)
    // 4: Comprado -> Nosotros somos los propietarios del asiento (VERDE)
    // 5: Ocupado -> El Asiento esta reservado por otro usuario (ROJO)

    $('body').on('click','.asiento',function () {
        // //alert($(this).hasClass("ocupado"))
        $('.asiento').each(function () {
            if($(this).hasClass("seleccionado")){
                $(this).removeClass("seleccionado")
                $('.butaca').text("")
            }    
        })

        if(!$(this).hasClass("ocupado") && !$(this).hasClass("comprado")){
            $(this).addClass("seleccionado")
            //alert($(this).text())
            $('.butaca').text($(this).text())
        } else {
            //alert("Ese asiento ya esta ocupado!")
        }
    })







})

/* FIN DE 

$(function ({    
})

*/

// MIS FUNCIONES


// ########################################################################
// ########################################################################
// ########################################################################


// PAGINA COMPRAR



// ESTA FUNCION LA CARGAMOS AL ENTRAR EN LA PAGINA COMPRAR 
// MODIFICAMOS LOS DATOS DE LA PAGINA COMPRAR POR LOS PASADOS EN PARAMETROS
// ESTOS PARAMETROS SE OBTIENEN AL SELECCIONAR UNA TARJETA DE EVENTO EN LA PAGINA HOME

function eventoSeleccionadoParaComprar(tituloArtista,imagenArtista,lugarConcierto,fechaEvento) {
    $('#tituloArtista').text(tituloArtista)
    $('#imagenArtista').attr("src",imagenArtista)
    $('#lugarConcierto').text(lugarConcierto)
    $('#fechaEvento').text(fechaEvento)
    $(".nombre").val(nombreUsuario)
    $(".apellidos").val(apellidoUsuario)
    $(".filtro").css({backgroundImage : 'url('+imagenArtista+')'})
    
}

// OBTENEMOS LA INFORMACION DE LAS ENTRADAS RESERVADAS PARA ESE EVENTO
// SI LA ENTRADA ESTA OCUPADA SE AÑADIRA AL CLASE OCUPADO
function cargarInfoEntradas(idEvento){
    $.ajax({
        url: 'php/getInfoEvento.php',
        type: 'POST',
        data: {"idEvento": idEvento,
            "getCantiones": "getCanciones"
        },
        // data: {"estilo": estilo,
        //     "nombre": "Luis",
        //     "edad":20
        // },
        success: function (respuesta) {
        //    //alert("Datos enviados " + respuesta);
            // //alert(respuesta)
            // $(".filaArtistas").html("")
            var infoEntradas = JSON.parse(respuesta);
            $.each(infoEntradas, function (index, entrada) {
                // //alert(entrada.butaca)
                $(".asiento").each(function () {
                    if ($(this).text() == entrada.butaca) {
                        if (entrada.id_usuario == idUsuario && idUsuario != 1 ) {
                            $(this).addClass('comprado')
                        } else {
                            $(this).addClass('ocupado')
                        }
                    }
                })

            })
            
        },
        error: function () {
        console.log('Error al cargar el JSON');
        }
        });   
}


function filaReserva(imagen, nombre, apellidos, butaca) {
    let div = $("<div>").addClass('row butacasReservadas border-bottom border-secondary p-1')
    let fila = div.html("<div class='offset-1 col-1 d-flex align-items-center'>\
                <img src=' " + imagen + "' class='img-fluid'>\
            </div>\
            <div class='col-7 fw-medium'>\
                <p class='fs-3 mb-0'>Nombre: <span>" + nombre + "</span></p>\
                <p class='fs-4 mb-0 text-secondary'>Apellidos: <span>"+ apellidos + "</span></p>\
                <p class='fs-4 text-secondary'>Butaca: <span>"+ butaca + "</span></p>\
            </div>\
            <div class='col-2 d-flex align-items-center'>\
                <button class='bg-transparent border-0'><i class='papeleraBorrar bi bi-trash-fill fs-2 text-danger'></i></button>\
                <button class='bg-transparent border-0'><i class='modificarNombre bi bi-pencil-square fs-2 text-primary'></i></button>\
            </div>\
        </div>")
    return fila
}






// ########################################################################
// ########################################################################


// PAGINA DESCUBRE




// ESTA FUNCION SE ENCARGA DE CARGAR LOS ESTADIOS DE UN JSON

function cargarEstadios() {
    $.ajax({
        url: 'json/estadios.json',
        type: 'GET',
        dataType: 'json',
        success: function(respuesta) {
            let resultado = ""
            for (let i = 0; i < respuesta.estadios.length; i++) {
                let titulo=respuesta.estadios[i].titulo
                let ubicacion=respuesta.estadios[i].ubicacion
                let seguidores=respuesta.estadios[i].seguidores
                let descripcion=respuesta.estadios[i].descripcion
                let imagen=respuesta.estadios[i].imagen
                let enlace=respuesta.estadios[i].enlace
                
                let nuevoEstadio = $(`
                <div class="row estadio">
                    <div class="col-2 align-items-center d-flex">
                    <img class="img-fluid rounded-circle imagenEstadioDescubre" src="${imagen}" alt="">
                </div>
                <div class="col-8">
                
                    <h2>${titulo}</h2>
                    <p>${ubicacion}</p>
                    <p>${seguidores} Seguidores</p>
                    <p>${descripcion}</p>
                </div>
                <div class="col-2 align-items-center d-flex">
                    <button class="btn rounded-pill btn-descubre"><a class="text-decoration-none text-white" href="${enlace}">Más Información</a></button>
                </div>
                </div>`
                )
                let fondoEstadio = $(`<div class="fondoEstadio"></div>`);
                

                nuevoEstadio.append(fondoEstadio);

                $('.contenidoDescubre').append(nuevoEstadio);

                $(fondoEstadio).css({
                    "content": " '' ",
                    "position": "absolute" ,
                    "top": 0,
                    "left": 0, 
                    "right": 0, 
                    "bottom": 0, 
                    "background-image": "url("+imagen+")", 
                    "background-repeat": "no-repeat",
                    "background-position": "top",
                    "background-size": "cover",
                    "filter": "blur(4px) brightness(50%)", 
                    "z-index": -1, 
            })
                
            }
            // //alert(resultado)
        },
        error: function() {
            //alert("Error al cargar el JSON")
        }
    })

}




// ########################################################################
// ########################################################################






// GESTION DE USUARIOS


// COMPROBAMOS EN BD SI EL USUARIO Y PASS SON CORRECTOS, EN CASO DE SER CORRECTOS
// OCULTA EL BOTON DE ACCESO, MUESTRA EL MENU DE USUARIO, MUESTRA EL NOMBRE DEL USUARIO Y
// LA IMAGEN DEL USUARIO (BD) EN EL MENU
// SI EL USUARIO TIENE EL ROL DE ADMINISTRADOR SE MUESTRA EL BOTON DE ADMINISTRAR
function rememberUser() {
    $.ajax({
        url: 'php/checkLoggedAndRemUser.php',
        type: 'POST',
        // data: {"user": user,
        //     "password": pass,
        //     "remember": remember
        // },
        success: function (respuesta) {
            //alert(respuesta)
            if (respuesta) {
                // //alert(respuesta)
                var datosUsuario = JSON.parse(respuesta);
                $.each(datosUsuario, function (index, dato) {
                    idUsuario = dato.id_usuarios
                    //alert(idUsuario)
                    user = dato.user
                    nombreUsuario = dato.nombre_usuario
                    apellidoUsuario = dato.apellido_usuario
                    imagenUsuario = dato.imagenUsuario
                    rolUsuario = dato.rol_usuario
                })
                
                $('#modalbtn').text($("#email").val().split("@")[0])
                $(".dropdown-toggle span").text("Hola, " + user )
                $("#menuUser").show()
                $("#logoUser").attr("src",imagenUsuario)
                $("#acceso").hide()
                $('#loginModal').modal('hide');
                $("#loginError").hide()
                if (rolUsuario=="administrador") {
                    $("#administrar").show()
                }
                
            } else {
                $("#loginError").show()
            }
        },
        error: function () {
        console.log('Error al cargar el JSON');
        }
        });
}


function accesoUsuario(user,pass,remember) {
    $.ajax({
        url: 'php/loginUser.php',
        type: 'POST',
        data: {"user": user,
            "password": pass,
            "remember": remember
        },
        success: function (respuesta) {
            
            if (respuesta) {
                // //alert(respuesta)
                var dato = JSON.parse(respuesta);
                    idUsuario = dato.id_usuarios
                    //alert(idUsuario)
                    nombreUsuario = dato.nombre_usuario
                    apellidoUsuario = dato.apellido_usuario
                    imagenUsuario = dato.imagenUsuario
                    rolUsuario = dato.rol_usuario
                // var datosUsuario = JSON.parse(respuesta);
                // $.each(datosUsuario, function (index, dato) {
                //     idUsuario = dato.id_usuarios
                //     //alert(idUsuario)
                //     nombreUsuario = dato.nombre_usuario
                //     apellidoUsuario = dato.apellido_usuario
                //     imagenUsuario = dato.imagenUsuario
                //     rolUsuario = dato.rol_usuario
                // })
                
                $('#modalbtn').text($("#email").val().split("@")[0])
                $(".dropdown-toggle span").text("Hola, " + $("#email").val().split("@")[0])
                $("#menuUser").show()
                $("#logoUser").attr("src",imagenUsuario)
                $("#acceso").hide()
                $('#loginModal').modal('hide');
                $("#loginError").hide()
                if (rolUsuario=="administrador") {
                    $("#administrar").show()
                }
                
            } else {
                $("#loginError").show()
            }
        },
        error: function () {
        console.log('Error al cargar el JSON');
        }
        });
}

// COMPROBAR SI EXISTE EL USUARIO PARA EL REGISTRO
function checkRegisterUser(userToCheck,callback){
    $.ajax({
        url: 'php/checkRegisterUser.php',
        type: 'POST',
        data: {"userToCheck": userToCheck,
        },
        success: function (respuesta) {
            // //alert(respuesta)
            if (respuesta == "0" ) {
                callback(true)
             //EL USUARIO NO EXISTE
                // $('#userExistCheck').removeClass("text-danger")
                // $('#userExistCheck').addClass("text-success")
                // $('#userExistCheck').text("El usuario es valido")
            } else {
                callback(false)
                // $('#userExistCheck').removeClass("text-success")
                // $('#userExistCheck').addClass("text-danger")
                // $('#userExistCheck').text("Ese usuario ya existe")
            }

        },
        error: function () {
        console.log('Error al cargar el JSON');
        callback(false)
        }
        });
}


// ESTA FUNCION SE ENCARGA DE OBTENER LAS CANCIONES DE BD Y MOSTRARLAS
// EN DESTACADOS, TENDENCIAS O NUEVOS SEGUN SU CATEGORIA

function cargarCanciones() {
    $.ajax({
        url: 'php/getCanciones.php',
        type: 'POST',
        // data: {"estilo": estilo},
        // data: {"estilo": estilo,
        //     "nombre": "Luis",
        //     "edad":20
        // },
        success: function (respuesta) {
        //    //alert("Datos enviados " + respuesta);
            // //alert(respuesta)
            // $(".filaArtistas").html("")
            if (respuesta) {
                var canciones = JSON.parse(respuesta);
            
                $.each(canciones, function (index, cancion) {
                    

                    let nuevaCancion = `
                    <div class="row cancion mb-1">
                        <div class="col-2  d-flex align-items-center justify-content-center">
                            <h2>${index}</h2>
                        </div> 
                        <div class="col-2  d-flex align-items-center justify-content-center"><img class="img-fluid imagenCancion" src="${cancion.imagenCancion}" alt=""></div>
                        <div class="col-6 ">
                            <p>${cancion.nombreCancion}</p>
                            <p>${cancion.descripcionCancion}</p>
                            <p hidden class="videoURL">${cancion.enlaceCancion}</p>
                        </div>
                        <div class="col-2 d-flex align-items-center justify-content-center">05:00 <i class="bi bi-caret-right"></i>
                        </div>
                    </div>`


                    switch (cancion.categoriaCancion) {
                        case "Destacados":
                            $("#pills-destacados").append(nuevaCancion)        
                            break;
                    
                        case "Tendencias":
                            $("#pills-tendencias").append(nuevaCancion)        
                            break;
                        default:
                            break;
                    }

                    
                });

            } else {
                $(".filaArtistas").append("<p>No se encontraron datos</p>")
            }
            
        },
        error: function () {
        console.log('Error al cargar el JSON');
        }
        });   
}

// PAGINA HOME

// OBTENER LOS DISTINOS GENEROS DE MUSICA
function getEstilosMusica() {
    $.ajax({
        url: 'php/getEstilos.php',
        type: 'POST',
        // data: {"idEvento": idEvento,
        //     "getCantiones": "getCanciones"
        // },
        // data: {"estilo": estilo,
        //     "nombre": "Luis",
        //     "edad":20
        // },
        success: function (respuesta) {
        //    //alert("Datos enviados " + respuesta);
            // //alert(respuesta)
            // $(".filaArtistas").html("")
            var estilos = JSON.parse(respuesta);
            $.each(estilos, function (index, estilo) {
                $('#botonesGeneroMusical').append('<button class="btn btn-outline-success rounded-pill btnGeneroMusical">'+estilo.nombre+'</button>')

            })
            
        },
        error: function () {
        console.log('Error al cargar el JSON');
        }
        });   
}


// OBTENER LOS DATOS DE LOS EVENTOS PARA GENERAR LAS TARJETAS

function generarTarjetasEventos(estilo) {
    
    $.ajax({
        url: 'php/getMusicBD.php',
        type: 'POST',
        data: {"estilo": estilo},
        // data: {"estilo": estilo,
        //     "nombre": "Luis",
        //     "edad":20
        // },
        success: function (respuesta) {
        //    //alert("Datos enviados " + respuesta);
            // //alert(respuesta)
            $(".filaArtistas").html("")
            if (respuesta) {
                var eventos = JSON.parse(respuesta);
            
                $.each(eventos, function (index, evento) {
                    
                    let nuevaTarjeta = `
                    <div class="col">
                    <div class="card h-100">
                    <img src="${evento.imagenEvento}" class="card-img-top img-fluid imagenArtista" alt="...">
                    <div class="card-body">
                        <div class="pb-3">
                        <p class="card-text mb-5">
                            <i class="bi-calendar3"></i><span class="fechaEvento"> ${evento.fecha} </span>
                            <i class="bi-people-fill"></i><span> ${evento.aforo} </span>
                            <i class="bi-bookmark-star"></i></p>
                        </div>
                        <p hidden class="idEvento">${evento.id_evento}</p>
                        <h5 class="card-title tituloArtista">${evento.nombre_artista}</h5>
                        <p class="mb-0 lugarConcierto">${evento.lugarConcierto}</p>
                    </div>
                    </div>
                </div>`

                $(".filaArtistas").append(nuevaTarjeta)
                });

            } else {
                $(".filaArtistas").append("<p class='text-center'>No se encontraron datos</p>")
            }
            
        },
        error: function () {
        console.log('Error al cargar el JSON');
        }
        });
}


// PAGINA COMPRAR RESERVAR ENTRADAS
function comprarEvento(idEventoReservado,idUsuarioEvReservado,butacaReservada,nombreReserva,apellidoReserva) {
    $.ajax({
        url: 'php/comprarEntradas.php',
        type: 'POST',
        data: {"idEventoReservado": idEventoReservado,
            "idUsuarioEvReservado": idUsuarioEvReservado,
            "butacaReservada": butacaReservada,
            "nombreReserva": nombreReserva,
            "apellidoReserva": apellidoReserva,
        },
        success: function (respuesta) {
            //alert(respuesta)
        },
        error: function () {
        console.log('Error al cargar el JSON');
        }
        });
}

function checkPasswordStrong(pass){
    if (pass.length<=7) {
        return false;
    } else {
        return true;
    }
}
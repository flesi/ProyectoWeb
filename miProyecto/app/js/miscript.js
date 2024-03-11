$(function () {

    // CARGAMOS HOME AL CARGAR LA PAGINA
    $.ajax({
        url: './html/home.html',
        type: 'GET',
        success: function(respuesta) {
            $("#contenido").html(respuesta)
            cargarCanciones()
        },
        error: function() {
            alert("Error al cargar el JSON")
        }
    })    






    
    // ACCESOS DE LA BARRA DE NAVEGACION
    



    // ACCESO HOME
    $('body').on('click','#home',function () {
        $.ajax({
            url: './html/home.html',
            type: 'GET',
            success: function(respuesta) {
                $("#contenido").html(respuesta)
                cargarCanciones()

            },
            error: function() {
                alert("Error al cargar el JSON")
            }
        })    
    })





    // ACCESO DESCUBRE
    $('body').on('click','#descubre',function () {
        $.ajax({
            url: './html/descubre.html',
            type: 'GET',
            success: function(respuesta) {
                $("#contenido").html(respuesta)
                cargarEstadios()
            },
            error: function() {
                alert("Error al cargar el JSON")
            }
        })    
    })







// BOTON COMPRAR (SOLO FUNCIONA CON .CARD SELECCIONADO)

    $("#comprar").addClass("disabled")
    let imagenArtista
    let tituloArtista
    let lugarConcierto
    let fechaEvento
    // SELECCIONAMOS .CARD (EVENTO)
    $('body').on('click','.card',function () {
        $(".card").each(function () {
            $(this).css("border","0px solid black")    
        })

        $(this).css("border","4px solid #183152")
        $("#comprar").removeClass("disabled")
        
        tituloArtista = $(this).find(".tituloArtista").text()
        imagenArtista = $(this).find(".imagenArtista").attr("src")
        lugarConcierto = $(this).find(".lugarConcierto").text()
        fechaEvento = $(this).find(".fechaEvento").text()
    })

    // PULSAMOS BOTON COMPRAR
    $('body').on('click','#comprar',function () {
        $.ajax({
            url: './html/comprar.html',
            type: 'GET',
            success: function(respuesta) {
                $("#contenido").html(respuesta)
                eventoSeleccionadoParaComprar(tituloArtista,imagenArtista,lugarConcierto,fechaEvento)
            },
            error: function() {
                alert("Error al cargar el JSON")
            }
        })    
    })






    // LOGIN
    let isLoggedIn = false;
    if (!isLoggedIn) {
        $("#menuUser").hide()
    }

    $('body').on('click','#acceso',function () {
        $('#exampleModal').modal('show');
        $('body').on('click','#entrar',function () {
            let user = $("#email").val().split("@")[0];
            let password = $("#password").val()
            comprobarUsusario(user,password)
        })
      })


      $('body').on('click','#cerrarSesion',function () {
        $("#menuUser").hide()
            $("#acceso").show()
      })








      // CANCIONES E IFRAME
      let player;

      // Carga la API de YouTube
      if (!window.YT) {
          let tag = document.createElement('script');
          tag.src = "https://www.youtube.com/iframe_api";
          let firstScriptTag = document.getElementsByTagName('script')[0];
          firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
      }
  
      // Función de inicialización del reproductor
      window.onYouTubeIframeAPIReady = function() {
          player = new YT.Player('videoYT', {
              height: '315',
              width: '560',
              events: {
                  'onReady': onPlayerReady,
                  'onStateChange': onPlayerStateChange
              }
          });
  
              // Función que se ejecuta cuando el reproductor está listo
              function onPlayerReady(event) {
                  event.target.playVideo();
              }
  
              // Función que se ejecuta cuando el estado del reproductor cambia
              function onPlayerStateChange(event) {
                  // Aquí puedes agregar lógica adicional si es necesario
              }
  
      }

    //   cargarReproductorYT()
      $('body').on('click','.cancion',function () {
        let videoId = $(this).find(".videoURL").text(); // ID del video de YouTube
        player.loadVideoById(videoId);
        // alert($('#videoYT iframe').attr("src"))
        // $('#videoYT iframe').attr("src","https://www.youtube.com/embed/JGwWNGJdvx8?si=AWMe6NHQrgQbZFK2")
        // alert($('#videoYT iframe').attr("src"))
        

      })

      // BOTONES GENERO MUSICAL
      $('body').on('click','.btnGeneroMusical',function () {
            gerneroMusica($(this).text())
      })



    // PAGINA COMPRAR
    $('body').on('click','.asiento',function () {
        alert($(this).text())
    })


})

function eventoSeleccionadoParaComprar(tituloArtista,imagenArtista,lugarConcierto,fechaEvento) {
    $('#tituloArtista').text(tituloArtista)
    $('#imagenArtista').attr("src",imagenArtista)
    $('#lugarConcierto').text(lugarConcierto)
    $('#fechaEvento').text(fechaEvento)
}




function cargarEstadios() {
    $.ajax({
        url: './json/estadios.json',
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
            // alert(resultado)
        },
        error: function() {
            alert("Error al cargar el JSON")
        }
    })

}

function gerneroMusica(estilo) {
    $.ajax({
        url: './php/getMusicBD.php',
        type: 'POST',
        data: {"estilo": estilo},
        // data: {"estilo": estilo,
        //     "nombre": "Luis",
        //     "edad":20
        // },
        success: function (respuesta) {
        //    alert("Datos enviados " + respuesta);
            // alert(respuesta)
            $(".filaArtistas").html("")
            if (respuesta) {
                var artistas = JSON.parse(respuesta);
            
                $.each(artistas, function (index, artista) {
                    
                    let nuevaTarjeta = `
                    <div class="col">
                    <div class="card h-100">
                    <img src="${artista.imagen}" class="card-img-top img-fluid imagenArtista" alt="...">
                    <div class="card-body">
                        <div class="pb-3">
                        <p class="card-text mb-5">
                            <i class="bi-calendar3"></i><span class="fechaEvento"> ${artista.fecha} </span>
                            <i class="bi-people-fill"></i><span> ${artista.seguidores} </span>
                            <i class="bi-bookmark-star"></i></p>
                        </div>
        
                        <h5 class="card-title tituloArtista">${artista.nombreArtista}</h5>
                        <p class="mb-0 lugarConcierto">${artista.lugarConcierto}</p>
                    </div>
                    </div>
                </div>`

                $(".filaArtistas").append(nuevaTarjeta)
                });

            } else {
                $(".filaArtistas").append("<p class='bg-danger'>No se encontraron datos</p>")
            }
            
        },
        error: function () {
        console.log('Error al cargar el JSON');
        }
        });
}



function comprobarUsusario(user,pass) {
    $.ajax({
        url: './php/getUser.php',
        type: 'POST',
        data: {"user": user,
            "password": pass,
        },
        success: function (respuesta) {
            if(respuesta>=1){
                alert("Bienvenido " + user)
                $('#modalbtn').text($("#email").val().split("@")[0])
                $(".dropdown-toggle span").text("Hola, " + $("#email").val().split("@")[0])
                $("#menuUser").show()
                $("#acceso").hide()    
            } else {
                alert("Usuario o Contraseña Incorrectos")
            }
        },
        error: function () {
        console.log('Error al cargar el JSON');
        }
        });
}

function cargarCanciones() {
    $.ajax({
        url: './php/getCanciones.php',
        type: 'POST',
        // data: {"estilo": estilo},
        // data: {"estilo": estilo,
        //     "nombre": "Luis",
        //     "edad":20
        // },
        success: function (respuesta) {
        //    alert("Datos enviados " + respuesta);
            // alert(respuesta)
            // $(".filaArtistas").html("")
            if (respuesta) {
                var canciones = JSON.parse(respuesta);
            
                $.each(canciones, function (index, cancion) {
                    

                    let nuevaCancion = `
                    <div class="row cancion mb-1">
                        <div class="col-2  d-flex align-items-center justify-content-center">
                            <h2>${index}</h2>
                        </div>
                        <div class="col-2  d-flex align-items-center justify-content-center"><img class="img-fluid imagenCancion" src="${cancion.imagenArtista}" alt=""></div>
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
                $(".filaArtistas").append("<p class='bg-danger'>No se encontraron datos</p>")
            }
            
        },
        error: function () {
        console.log('Error al cargar el JSON');
        }
        });   
}
function cargarReproductorYT(){
   
}
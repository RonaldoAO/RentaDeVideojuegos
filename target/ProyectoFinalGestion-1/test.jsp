<%@page import="datos.ClienteDAO"%>
<%@page import="java.util.List"%>
<%@page import="domain.Cliente"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    ClienteDAO dao = new ClienteDAO();
    List<Cliente> clientes = dao.listar();
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <title>Bootstrap Grid Example</title>
    </head>

    <body>
        <jsp:include page="WEB-INF/Jsps/header.jsp" />



        <div class="row">

            <div class="card" style="width:400px;margin: 10px;">
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/venta" method="post">
                        <i class="fa-brands fa-xbox"></i>
                        <h5 class="card-title">Consola 01</h5>
                        <p style="color:green; font-size:smaller;">Disponible</p>
                        <div class="progress" role="progressbar" aria-label="Success example" aria-valuenow="25"
                             aria-valuemin="0" aria-valuemax="100">
                            <div class="progress-bar bg-success" id="progressBar" style="width:0%"></div>
                        </div>
                        
                        
                        <input style="font-size: x-small;" type="text" name="tiempo" class="form-control-plaintext" id="cronometro" value="00:00:00">

                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal" id="inicio">
                            Iniciar
                        </button>
                        <button type="button" class="btn btn-success" style="display: none;" id="fin" onclick="generarPago()" >
                            Finalizar sesión
                        </button>
                        <button type="submit" class="btn btn-success" style="display: none;" id="pago" style="display:none;">
                            Generar pago
                        </button>
                        <button type="submit" class="btn btn-success"id="startButton" style="display:none;">Parar
                        </button>
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Rellene los campos</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="exampleFormControlSelect1">Cliente</label>
                                            <select class="form-control" id="exampleFormControlSelect1"  name="exampleFormControlSelect1">
                                                <c:forEach var="cliente" items="${clientes}" varStatus="status" >
                                                    <option value="${cliente.nombre}">${cliente.nombre}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="mb-3">
                                            <label for="hora" class="form-label">Tiempo(Horas)</label>
                                            <input type="number" class="form-control" id="hora" name="exampleInputPassword1" value="50">
                                        </div>

                                        
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-success" id="startButton" data-bs-dismiss="modal" onclick="iniciarCronometro()">Iniciar</button>


                                    </div>

                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>



        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
    crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/50dc801875.js" crossorigin="anonymous"></script>
    <script>
        let segundos;
        function generarPago(){
            var botonNuevo = document.getElementById('pago');
            var botonG = document.getElementById('fin');
            var botonH = document.getElementById('inicio');
            detenerCronometro();
            
            document.getElementById('hora').value = segundos;
            
            botonNuevo.style.display = 'block';
            botonG.style.display = 'none';
            botonH.style.display = 'none';
        }
                                            let usuario;
                                            let cronometro;
                                            // Función para formatear el tiempo en formato hh:mm:ss
                                            function formatTime(segundos) {
                                                const horas = Math.floor(segundos / 3600);
                                                const minutos = Math.floor((segundos % 3600) / 60);
                                                const segundosRestantes = segundos % 60;
                                                const formatoHoras = horas < 10 ? "0" + horas : horas;
                                                const formatoMinutos = minutos < 10 ? "0" + minutos : minutos;
                                                const formatoSegundos = segundosRestantes < 10 ? "0" + segundosRestantes : segundosRestantes;
                                                return formatoHoras + ":" + formatoMinutos + ":" + formatoSegundos;
                                            }

                                            // Función para iniciar el cronómetro
                                            function iniciarCronometro() {
                                                var boton1 = document.getElementById('inicio');
                                                var boton2 = document.getElementById('fin');
                                                var selectElement = document.getElementById('exampleFormControlSelect1');
                                                segundos = 0;
                                                boton1.style.display = 'none';
                                                boton2.style.display = 'block';
                                                //obtener referencia del usuario
                                                usuario = selectElement.value;
                                                console.log(usuario);
                                                cronometro = setInterval(function () {
                                                    document.getElementById('cronometro').value = formatTime(segundos);
                                                    
                                                    segundos++;
                                                }, 1000); // Actualiza cada segundo
                                            }

                                            // Función para detener el cronómetro
                                            function detenerCronometro() {
                                                var boton1 = document.getElementById('inicio');
                                                var boton2 = document.getElementById('fin');
                                                clearInterval(cronometro);
                                                //document.getElementById('cronometro').innerText = '00:00:00';
                                                boton1.style.display = 'block';
                                                boton2.style.display = 'none';
                                            }


    </script>
</body>

</html>
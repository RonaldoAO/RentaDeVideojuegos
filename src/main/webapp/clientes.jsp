<%@page import="datos.ClienteDAO"%>
<%@page import="java.util.List"%>
<%@page import="domain.Cliente"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    ClienteDAO dao = new ClienteDAO();
    List<Cliente> clientes = dao.listar();
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PÃ¡gina con Barra Superior</title>
        <!-- Agrega el enlace al archivo de estilo de Bootstrap -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">


        <style>
            /* Agrega tu estilo personalizado aquï¿½ si es necesario */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            header {
                background-color: #4CAF50;
                color: #fff;
                padding: 10px;
                text-align: center;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            header img {
                width: 50px; /* Ajusta el tamaï¿½o del logo segï¿½n sea necesario */
                vertical-align: middle;
            }

            nav {
                background-color: #333;
                overflow: hidden;
                text-align: right;
            }

            nav a {
                display: inline-block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

            nav a:hover {
                background-color: #45a049;
                color: white;
            }

            section {
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="WEB-INF/Jsps/header.jsp" />

        <section>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">
                Agregar
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Agregar cliente</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="${pageContext.request.contextPath}/cliente?accion=agregar" method="post" onsubmit="return validarFormulario()">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Nombre</label>
                                    <input type="text" class="form-control" id="exampleFormControlInput1" name="nombre">

                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Edad</label>
                                    <input type="number" class="form-control" id="edad" name="edad" oninput="validarEdad()">
                                    <p style="color: red" class="error-message" id="errorMensaje"></p>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Telefono</label>
                                    <input  maxlength="10" type="number" class="form-control" id="clientNumber" name="telefono" oninput="validarTelefono()">
                                    <p class="error-message" id="errorTelefono"></p>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Correo</label>
                                    <input type="email" class="form-control" id="clientEmail" name="correo" oninput="validarCorreo()">
                                    <p style="color: red" class="error-message" id="errorCorreo"></p>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismisbutonsubmitts="modal">Close</button>
                                <button type="submit" class="btn btn-success" id="butonsubmitt" >Guardar</button>
                            </div>
                        </form>
                    </div>  
                </div>
            </div>

            <!-- Lista de clientes registrados -->
            <h2>Listado de Clientes</h2>
            <ul id="clientList">
                <!-- Aquï¿½ se mostrarï¿½n los clientes registrados -->
            </ul>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Edad</th>
                        <th scope="col">Telefono</th>
                        <th scope="col">Correo</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="cliente" items="${clientes}" varStatus="status" >
                        <tr>
                            <th scope="row">${cliente.idcliente}</th>
                            <td>${cliente.nombre}</td>
                            <td>${cliente.edad}</td>
                            <td>${cliente.telefono}</td>
                            <td>${cliente.correo}</td>
                            <td>

                                <a href="${pageContext.request.contextPath}/cliente?accion=eliminar&idCliente=${cliente.idcliente}" class="btn btn-danger" role="button" style="margin:0px 0px 15px 15px; ">Eliminar</a>
                                <a href="${pageContext.request.contextPath}/cliente?accion=editar&idCliente=${cliente.idcliente}" class="btn btn-warning" role="button" style="margin:0px 0px 15px 15px; ">Editar</a>
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </section>

        <!-- Agrega el enlace al archivo de script de Bootstrap y jQuery -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        
        <script>
            
            
            function validarEdad() {
                var butonsubmitt = document.getElementById('butonsubmitt'); 
                // Obtener el valor del campo de entrada de edad
                var edad = document.getElementById("edad").value;

                // Convertir el valor a un número
                edad = parseInt(edad, 10);

                // Validar el rango de edad (mayor a 8 años y menor a 80 años)
                if (isNaN(edad) || edad <= 8 || edad >= 80) {
                    // Mostrar mensaje de error
                    document.getElementById("errorMensaje").innerText = "¡Error! La edad debe estar entre 8 y 80 años.";
                    butonsubmitt.disabled = 'true';
                    
                } else {
                    // Limpiar el mensaje de error si la edad es válida
                    document.getElementById("errorMensaje").innerText = "";
                    butonsubmitt.removeAttribute('disabled');
                }
            }
// validacion para el rango de edad

            
            function validarTelefono() {
                var butonsubmitt = document.getElementById('butonsubmitt');
                var telefono = document.getElementById("clientNumber").value;

                var digitosTelefono = telefono.replace(/\s|-/g, '');

                if (digitosTelefono.length !== 10 || isNaN(digitosTelefono)) {
                    butonsubmitt.disabled = 'true';
                    document.getElementById("errorTelefono").innerText = "¡Error! El número de teléfono debe tener 10 dígitos.";
                    
                } else {
                    document.getElementById("errorTelefono").innerText = "";
                    butonsubmitt.removeAttribute('disabled');
                }
            }

            function validarCorreo() {
                var butonsubmitt = document.getElementById('butonsubmitt');
                
                var correo = document.getElementById("clientEmail").value;


                var formatoValido = /^(.+)@(gmail\.com|hotmail\.com|outlook\.com)$/.test(correo);

                if (!formatoValido) {
                    butonsubmitt.disabled = 'true';
                    document.getElementById("errorCorreo").innerText = "¡Error! El formato del correo electrónico es incorrecto. Debe ser gmail, hotmail u outlook";
                } else {
                    butonsubmitt.removeAttribute('disabled');
                    document.getElementById("errorCorreo").innerText = "";
                }
            }
        </script>
    </body>
</html>

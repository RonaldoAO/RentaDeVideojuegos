<%@page import="datos.ProductoDAO"%>
<%@page import="java.util.List"%>
<%@page import="domain.Producto"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    ProductoDAO dao = new ProductoDAO();
    List<Producto> productos = dao.listar();


%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Página con Barra Superior</title>
        <!-- Agrega el enlace al archivo de estilo de Bootstrap -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <style>
            /* Agrega tu estilo personalizado aquí si es necesario */
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
                width: 50px; /* Ajusta el tamaño del logo según sea necesario */
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
        <div class="container mt-5">



            <!-- Button trigger modal -->
            <button type="button" class="btn btn-success mb-2" data-toggle="modal" data-target="#exampleModal">
                Agregar Producto
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Agregar producto</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="${pageContext.request.contextPath}/venta?accion=agregarATabla" method="POST" >
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="exampleFormControlSelect1">Producto</label>
                                    <select class="form-control" id="exampleFormControlSelect1"  name="exampleFormControlSelect1" onchange="actualizarMax()">
                                        <c:forEach var="producto" items="${productos}" varStatus="status" >
                                            <option value="${producto.nombre}" data-cantidad="${producto.cantidad}"  data-precio="${producto.precio}" data-id="${producto.idProducto}">${producto.nombre}</option>
                                        </c:forEach>
                                    </select>   
                                </div>

                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Cantidad</label>
                                    <input type="number" min="1" max="${productos.get(0).cantidad}" class="form-control" id="edad" name="edad" oninput="calcularPrecio()" >
                                    <p style="color: red" class="error-message" id="errorSize"></p>
                                </div>

                                <div class="form-group d-none">

                                    <input type="number"  class="form-control" id="rid" name="id"  value="${productos.get(0).idProducto}">
                                    <p style="color: red" class="error-message" id="errorMensaje"></p>
                                </div>

                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Precio Final</label>
                                    <div class="d-flex flex-row "> 
                                        <input class="form-control mr-auto" type="text" value='0' name="precio" readonly id="precio" style="width: 70%;" />
                                        <p style="width: 20%;" class="mb-0 mt-auto">Pesos</p>
                                    </div>
                                    <p style="color: red" class="error-message" id="errorMensaje"></p>
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

            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">nombre</th>
                        <th scope="col">cantidad</th>
                        <th scope="col">precio</th>
                        <th scope="col">Acciones</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="registro" items="${registros}" varStatus="status" >
                        <tr>
                            <th scope="row">${registro.idProducto}</th>
                            <td>${registro.nombre}</td>
                            <td>${registro.cantidad}</td>
                            <td>${registro.precio}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/venta?accion=eliminar&idproducto=${registro.idProducto}" class="btn btn-danger" role="button" style="margin:0px 0px 15px 15px; ">Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
            <form action="${pageContext.request.contextPath}/venta?accion=agregar" method="POST"> 

                <p style="font-size:medium;">Total: <p id="total">${pageContext.session.getAttribute("total")}</p></p>
                <div class="form-group d-flex flex-row align-items-start">
                    <label for="exampleFormControlInput1" class="mr-2 mt-auto">Efectivo Depositado</label>
                    <input type="number" min="1" class="form-control w-25" id="efectivo" name="efectivo" oninput="calcularCambio()" >
                </div>
                <p style="font-size:medium;">Cambio:<p id="cambio"></p></p>
                <p style="color: red" class="error-message" id="errorMensaje"></p>
                <div class="form-group d-none">

                    <input type="text"  class="form-control" id="total_inp" name="total"  value="">
                    <p style="color: red" class="error-message" id="errorMensaje"></p>
                </div>
                
                <div class="form-group d-none">

                    <input type="text"  class="form-control" id="cambio_inp" name="cambio"  value="">
                    <p style="color: red" class="error-message" id="errorMensaje"></p>
                </div>
                
                <button type="submit" class="btn btn-success">Generar venta</button>
            </form>
        </div>
        <!-- Agrega el enlace al archivo de script de Bootstrap y jQuery -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script>
                                        function actualizarMax() {
                                            // Obtener el elemento select y el elemento input
                                            var selectProducto = document.getElementById("exampleFormControlSelect1");
                                            var inputCantidad = document.getElementById("edad");



                                            // Obtener la cantidad asociada a la opción seleccionada
                                            var selectedOption = selectProducto.options[selectProducto.selectedIndex];
                                            var cantidadProducto = selectedOption.getAttribute("data-cantidad");

                                            // Actualizar el atributo max del input
                                            inputCantidad.max = cantidadProducto;
                                            calcularPrecio();

                                            var inputId = document.getElementById("rid");
                                            var dataid = selectedOption.getAttribute("data-id");
                                            inputId.value = dataid;

                                        }
                                        function calcularCambio() {
                                            var inputCantidad = document.getElementById("efectivo");
                                            var total = document.getElementById("total");
                                            var cambio = document.getElementById("cambio");

                                            //guardar en los input
                                            var inputTotal = document.getElementById("total_inp");
                                            var inputCambio = document.getElementById("cambio_inp");
                                            inputTotal.value = total.innerHTML;
                                            cambio.innerHTML = parseFloat(inputCantidad.value) - parseFloat(total.innerHTML);
                                            inputCambio.value = cambio.innerHTML;
                                        }
                                        function calcularPrecio() {
                                            var precio = document.getElementById("precio");
                                            var selectProducto = document.getElementById("exampleFormControlSelect1");
                                            var inputCantidad = document.getElementById("edad");
                                            
                                            var error = document.getElementById("errorSize");

                                            if(parseInt(inputCantidad.value) > parseInt(inputCantidad.max)){
                                                error.innerHTML = "El numero maximo a ingresar es: " + inputCantidad.max;
                                            }else{
                                                error.innerHTML = ""; 
                                            }
                                            // Obtener la cantidad asociada a la opción seleccionada
                                            var selectedOption = selectProducto.options[selectProducto.selectedIndex];
                                            var cantidadProducto = selectedOption.getAttribute("data-precio");

                                            
                                            precio.value = cantidadProducto * inputCantidad.value;
                                        }
        </script>
    </body>
</html>

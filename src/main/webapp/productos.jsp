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

    <section>
        <!-- Contenido de la página -->
       

        <!-- Formulario para agregar productos con Bootstrap -->
        <!-- Button trigger modal -->
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">
                Agregar
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
                        <form action="${pageContext.request.contextPath}/producto?accion=agregar" method="post" onsubmit="return validarFormulario()">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Nombre</label>
                                    <input type="text" class="form-control" id="exampleFormControlInput1" name="nombre">

                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Precio</label>
                                    <input type="number" class="form-control" id="precio" name="precio" oninput="validarPrecio()">
                                    <p style="color: red" class="error-precio" id="errorPrecio"></p>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Descripcion</label>                                   
                                   <input type="text" class="form-control" id="descripcion" name="descripcion" >
                                </div>
                                
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Gramaje</label>  
                                    <div class="d-flex flex-row">
                                    <input type="number" class="form-control w-50" id="gramaje" name="tamanio" >
                                    
                                    <select class="form-control w-25" style="margin-left:5px;" id="gramaje" name="unidad">
                                        <option value="g">Gramos</option>
                                        <option value="l">Litro</option>
                                        <option value="ml">Mililitro</option>
                                    </select>
                                    </div>
                                    <p style="color: red" class="error-precio" id="errorGramaje"></p>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Cantidad</label>           
                                    <input type="number" class="form-control" id="cantidad" name="cantidad" oninput="validarStock()">
                                    <p style="color: red" class="error-precio" id="errorCantidad"></p>
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


        <!-- Lista de productos -->
        <h2>Listado de Productos</h2>
        <ul id="productList">
            
            <!-- Aquí se mostrarán los productos agregados -->
        </ul>
         </ul>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Descripcion</th>
                        <th scope="col">Gramaje</th>
                        <th scope="col">Cantidad en existencia</th>
                        <th scope="col">Stock minimo</th>
                        
                        
                        <th scope="col">Accion</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="producto" items="${productos}" varStatus="status" >
                        <tr>
                            <th scope="row">${producto.idProducto}</th>
                            <td>${producto.nombre}</td>
                            <td>${producto.precio}</td>
                            <td>${producto.descripcion}</td>
                            <td>${producto.gramaje}</td>
                            <td>${producto.cantidad}</td>
                            <td>2</td>
                            
                            <td>

                                <a href="${pageContext.request.contextPath}/producto?accion=eliminar&idproducto=${producto.idProducto}" class="btn btn-danger" role="button" style="margin:0px 0px 15px 15px; ">Eliminar</a>
                                <a href="${pageContext.request.contextPath}/producto?accion=editar&idproducto=${producto.idProducto}" class="btn btn-warning" role="button" style="margin:0px 0px 15px 15px; ">Editar</a>
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

    <!-- Agrega tu script personalizado para manejar la lógica del formulario y la lista de productos -->
    <script>
            
            function validarStock(){
                var butonsubmitt = document.getElementById('butonsubmitt'); 
                // Obtener el valor del campo de entrada de edad
                var minimo = document.getElementById("stock_minimo").value;
                var actual = document.getElementById("cantidad").value;
               
                
                // Convertir el valor a un número
                minimo = parseInt(minimo, 10);
                actual = parseInt(actual, 10);
                
                // Validar el rango de edad (mayor a 8 años y menor a 80 años)
                if (isNaN(actual) || actual <= minimo) {
                    // Mostrar mensaje de error
                    document.getElementById("errorCantidad").innerText = "¡Error! La cantidad tiene que ser mayor al stock minimo";
                    butonsubmitt.disabled = 'true';
                    
                } else {
                    // Limpiar el mensaje de error si la edad es válida
                    document.getElementById("errorCantidad").innerText = "";
                    butonsubmitt.removeAttribute('disabled');
                }
            }
            
            
            function validarPrecio(){
                var butonsubmitt = document.getElementById('butonsubmitt'); 
                // Obtener el valor del campo de entrada de edad
                var precio = document.getElementById("precio").value;

                // Convertir el valor a un número
                precio = parseInt(precio, 10);

                // Validar el rango de edad (mayor a 8 años y menor a 80 años)
                if (isNaN(precio) || precio <= 0) {
                    // Mostrar mensaje de error
                    document.getElementById("errorPrecio").innerText = "¡Error! El precio tiene que ser entero";
                    butonsubmitt.disabled = 'true';
                    
                } else {
                    // Limpiar el mensaje de error si la edad es válida
                    document.getElementById("errorPrecio").innerText = "";
                    butonsubmitt.removeAttribute('disabled');
                }
            }
            
        </script>
</body>
</html>

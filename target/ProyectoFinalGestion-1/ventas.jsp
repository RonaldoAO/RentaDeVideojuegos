<%@page import="datos.VentaDAO"%>
<%@page import="java.util.List"%>
<%@page import="domain.Venta"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    VentaDAO dao = new VentaDAO();
    List<Venta> ventas = dao.listar();
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
        <h1>Ventas</h1>

        <a href="${pageContext.request.contextPath}/venta?accion=generarVenta" class="btn btn-outline-success" role="button" style="margin:0px 0px 15px 15px; ">Generar venta</a>

        <!-- Lista de ventas registradas -->
        <h2>Listado de Ventas</h2>
        <ul id="salesList">
            <!-- Aquí se mostrarán las ventas registradas -->
        </ul>
        <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Fecha</th>
                        <th scope="col">Total</th>
                        <th scope="col">Pago</th>
                        <th scope="col">Cambio</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="venta" items="${ventas}" varStatus="status" >
                        <tr>
                            <th scope="row">${venta.idVenta}</th>
                            <td>${venta.fecha}</td>
                            <td>${venta.total}</td>
                            <td>${venta.pago}</td>
                            <td>${venta.cambio}</td>
                           
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
    </section>

    <!-- Agrega el enlace al archivo de script de Bootstrap y jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Agrega tu script personalizado para manejar la lógica del formulario y la lista de ventas -->
    <script>
        // Agrega tu lógica de manejo de formularios y ventas aquí
        document.querySelector('.form').addEventListener('submit', function (event) {
            event.preventDefault();
            const productName = document.getElementById('productName').value;
            const quantity = document.getElementById('quantity').value;
            const price = document.getElementById('price').value;

            // Calcula el precio total
            const totalPrice = quantity * price;

            // Agrega la nueva venta a la lista
            const salesList = document.getElementById('salesList');
            const listItem = document.createElement('li');
            listItem.textContent = `Producto: ${productName}, Cantidad: ${quantity}, Precio Unitario: $${price}, Precio Total: $${totalPrice}`;
            salesList.appendChild(listItem);

            // Limpia los campos del formulario
            document.getElementById('productName').value = '';
            document.getElementById('quantity').value = '';
            document.getElementById('price').value = '';
        });
    </script>
</body>
</html>

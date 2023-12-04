<%-- 
    Document   : cliente
    Created on : 29/11/2023, 12:34:22 AM
    Author     : Ronaldo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Cliente</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <jsp:include page="../WEB-INF/Jsps/header.jsp" />
        <section>
        <form action="${pageContext.request.contextPath}/cliente?accion=actualizar&idCliente=${cliente.idcliente}" method="post">
            <div class="form-group">
                <label for="exampleFormControlInput1">Nombre</label>
                <input type="text" class="form-control" id="exampleFormControlInput1" name="nombre" value="${cliente.nombre}">
            </div>
            <div class="form-group">
                <label for="exampleFormControlInput1">Edad</label>
                <input type="number" class="form-control" id="exampleFormControlInput1" name="edad" value="${cliente.edad}">
            </div> 
            <div class="form-group">
                <label for="exampleFormControlInput1">Telefono</label>
                <input type="text" class="form-control" id="exampleFormControlInput1" name="telefono" value="${cliente.telefono}">
            </div>
            <div class="form-group">
                <label for="exampleFormControlInput1">Correo</label>
                <input type="email" class="form-control" id="exampleFormControlInput1" name="correo"value="${cliente.correo}">
            </div>
            <a href="${pageContext.request.contextPath}/cliente" class="btn btn-secondary" role="button" >Atras</a>
           
            <button type="submit" class="btn btn-success">Guardar</button>
        </form>
            </section>
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>

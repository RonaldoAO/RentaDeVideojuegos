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
        <title>Editar Producto</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <jsp:include page="../WEB-INF/Jsps/header.jsp" />
        <section>
        <form action="${pageContext.request.contextPath}/producto?accion=agregar" method="post" onsubmit="return validarFormulario()">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Nombre</label>
                                    <input type="text" class="form-control" id="exampleFormControlInput1" name="nombre" value="${producto.nombre}">

                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Precio</label>
                                    <input type="number" class="form-control" id="precio" name="precio" oninput="validarEdad()" value="${producto.precio}">
                                    <p style="color: red" class="error-precio" id="errorPrecio"></p>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Descripcion</label>                                   
                                   <input type="text" class="form-control" id="descripcion" name="descripcion" oninput="validarEdad()" value="${producto.descripcion}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Stock Minimo</label>           
                                    <input type="number" class="form-control" id="edad" name="stock" oninput="validarEdad()" value="${producto.stock}">
                                    <p style="color: red" class="error-precio" id="errorStock"></p>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Gramaje</label>           
                                    <input type="number" class="form-control" id="gramaje" name="gramaje" oninput="validarEdad()" value="${producto.gramaje}">
                                    <p style="color: red" class="error-precio" id="errorGramaje"></p>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Cantidad</label>           
                                    <input type="number" class="form-control" id="cantidad" name="cantidad" oninput="validarEdad()" value="${producto.cantidad}">
                                    <p style="color: red" class="error-precio" id="errorCantidad"></p>
                                </div>
                                
                            </div>
                            <div class="modal-footer">
                                <a href="${pageContext.request.contextPath}/producto" class="btn btn-secondary" role="button" >Atras</a>
                                <button type="submit" class="btn btn-success" id="butonsubmitt" >Guardar</button>
                            </div>
                        </form>
            </section>
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>

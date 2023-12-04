
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página con Barra Superior</title>
    <style>
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
    <header>
        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Luigi_emblem.svg/2048px-Luigi_emblem.svg.png" walt="Logo" width="200" height="50">

        <h1>Luigi's Gamezone</h1>
    </header>

    <nav>
        <a href="Principal.jsp">Inicio</a>
        <a href="test.jsp">Rentas</a>
        <a href="venta">Ventas</a>
        <a href="cliente">Clientes</a>
        <a href="producto">Productos</a> 
    </nav>

</body>
</html>
 
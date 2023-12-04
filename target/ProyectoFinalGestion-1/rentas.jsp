
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        .cronometro-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
        }

        .cronometro-btn:hover {
            background-color: #45a049;
        }

        .obtener-tiempo-btn {
            background-color: #333;
            color: white;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
        }

        .obtener-tiempo-btn:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <jsp:include page="WEB-INF/Jsps/header.jsp" />

    <section>
        <!-- Contenido de la página -->
        <h1>Bienvenido a mi página</h1>
        <p>Esta es una página de ejemplo con una barra superior y un menú.</p>

        <!-- Tabla de 5x7 -->
        <table>
            <thead>
                <tr>
                    <th>XBOX</th>
                    <th>Iniciar Cronometro</th>
                    <th>Tiempo Final</th>
                    <th>Costo</th>
                    <th>Cliente</th>
                </tr>
            </thead>
            <tbody>

                <tr>
                    <td>Consola 1</td>
                    <td id="cronometro-cell"><button class="cronometro-btn" onclick="iniciarCronometro()">Iniciar Cronómetro</button></td>
                    <td id="obtener-tiempo-cell"><button class="obtener-tiempo-btn" onclick="obtenerTiempo()">Obtener Tiempo</button></td>
                    <td id="calcular-cell"><button class="calcular-btn" onclick="calcularTiempoMultiplicado()">Calcular</button></td>
                    <td id="combobox-cell" class="styled-combobox">
                        <select>
                            <option value="opcion1">Opción 1</option>
                            <option value="opcion2">Opción 2</option>
                            <option value="opcion3">Opción 3</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Consola 2</td>
                    <td>Fila 2, Celda 2</td>
                    <td>Fila 2, Celda 3</td>
                    <td>Fila 2, Celda 4</td>
                    <td>Fila 2, Celda 5</td>
                </tr>

                <tr>
                    <td>Consola 3</td>
                    <td>Fila 3, Celda 2</td>
                    <td>Fila 3, Celda 3</td>
                    <td>Fila 3, Celda 4</td>
                    <td>Fila 3, Celda 5</td>
                </tr>

                <tr>
                    <td>Consola 4</td>
                    <td>Fila 4, Celda 2</td>
                    <td>Fila 4, Celda 3</td>
                    <td>Fila 4, Celda 4</td>
                    <td>Fila 4, Celda 5</td>
                </tr>

                <tr>
                    <td>Consola 5</td>
                    <td>Fila 5, Celda 2</td>
                    <td>Fila 5, Celda 3</td>
                    <td>Fila 5, Celda 4</td>
                    <td>Fila 5, Celda 5</td>
                </tr>

                <tr>
                    <td>Consola 6</td>
                    <td>Fila 6, Celda 2</td>
                    <td>Fila 6, Celda 3</td>
                    <td>Fila 6, Celda 4</td>
                    <td>Fila 6, Celda 5</td>
                </tr>

                <tr>
                    <td>Consola 7</td>
                    <td>Fila 7, Celda 2</td>
                    <td>Fila 7, Celda 3</td>
                    <td>Fila 7, Celda 4</td>
                    <td>Fila 7, Celda 5</td>
                </tr>
                
            </tbody>
        </table>
    </section>
    <script>
        let cronometro;
        let tiempo = 0;

        function iniciarCronometro() {
            cronometro = setInterval(function () {
                tiempo++;
                document.getElementById("cronometro-cell").innerHTML = tiempo + " segundos";
            }, 1000);
        }
        function obtenerTiempo() {
            let tiempoActual = (tiempo/60) + " minutos";
            let obtenerTiempoCell = document.getElementById("obtener-tiempo-cell");
            obtenerTiempoCell.innerHTML = `<p>Tiempo Final: ${tiempoActual}</p>`;
        }
        function calcularTiempoMultiplicado() {
            let tiempoMultiplicado = tiempo * 0.042;
            let calcularCell = document.getElementById("calcular-cell");
            calcularCell.innerHTML = `<p>Tiempo multiplicado: ${tiempoMultiplicado.toFixed(2)}</p>`;
        }
    </script>
</body>
</html>

<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                margin: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .list{
                list-style: none;
                font-size: xx-small;
            }
            .login-container {
                background-color: #ffffff;
                padding: 20px;
                border: 2px solid #4CAF50;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 300px;
                text-align: center;
            }

            .login-container img {

                width: 100px;
                margin-bottom: 15px;
            }

            .login-container input {
                width: 100%;
                padding: 10px;
                margin: 8px 0;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .login-container button {
                background-color: #4CAF50;
                color: #fff;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .login-container button:hover {
                background-color: #45a049;
            }
            #imagen{
                transition: top 0.2s ease-out;

            }
            label{
                font-size: small;
            }
        </style>
    </head>

    <body>
        <div class="login-container">
            <img src="./img/Luigi.png"
                 alt="Logo" id="imagen">
            <form action="${pageContext.request.contextPath}/user?accion=register" method="post">
                <label for="username">Nombre</label>
                <input type="text" id="username" name="username" required>

                <label for="email">Correo</label>
                <input type="email" id="clientEmail" name="email" required oninput="validarCorreo() ">
                <p style="color: red; font-size:x-small;" class="error-message" id="errorCorreo"></p>

                <label for="telefono">Telefono</label>
                <input type="number" id="clientNumber" name="telefono" maxlength="10" required oninput="validarTelefono()">
                <p style="font-size:x-small; color:red;" class="error-message" id="errorTelefono"></p><!-- comment -->


                


                <label for="registro_password">Password: </label>
                <input type="password" name="password" id="registro_password" oninput="validarPassword()" onfocus="validarPassword()" onblur="esconderprops()"  required>
                <div class="pass_list" id="pass_list">
                    <ul class="list" style="text-align:left ;">
                        <li id="pass_upper"></li>
                        <li id="pass_lower"></li>
                        <li id="pass_digit"></li>
                        <li id="size"></li>
                    </ul>
                </div>

                <button type="submit" class="btn btn-success" id="butonsubmitt" >Guardar</button>

            </form>
        </div>

        <script>
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
            
            function validarPassword() {

                var lista = document.getElementById('pass_list');
                lista.style.display = 'block';
                var pass_upper = document.getElementById('pass_upper');
                var pass_lower = document.getElementById('pass_lower');
                var pass_digit = document.getElementById('pass_digit');
                var size = document.getElementById('size');
                var data = document.getElementById('registro_password');
                (/[A-Z]/.test(data.value)) ? pass_upper.textContent = 'Minimo una letra mayuscula SI ' : pass_upper.textContent = 'Minimo una letra mayuscula NO ';
                (/[a-z]/.test(data.value)) ? pass_lower.textContent = 'Minimo una letra minuscula SI ' : pass_lower.textContent = 'Minimo una letra minuscula NO ';
                (/\d/.test(data.value)) ? pass_digit.textContent = 'Minimo un digito SI' : pass_digit.textContent = 'Minimo un digito NO ';
                (data.value.length >= 8) ? pass_digit.textContent = 'Minimo 8 caracteres SI' : pass_digit.textContent = 'Minimo 8 caracteres NO ';

            }
            function esconderprops() {
                var lista = document.getElementById('pass_list');
                lista.style.display = 'none';
            }
        </script>
    </body>

</html>
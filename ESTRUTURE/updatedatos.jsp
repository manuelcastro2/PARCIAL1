<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
</head>

<body>
    <form action="" method="post">
        <div>
            <div>
                <div>
                    <label for="">
                        <h1>ACTUALIZAR DATOS</h1>
                    </label>
                </div>
                <div>
                    <label for="Tipo">
                        <p>Tipo documento</p>
                        <select name="Tipo" id="Tipo">
                            <option value="R.C.">Registro civil</option>
                            <option value="T.I.">Targeta identida</option>
                            <option value="C.C.">Cedula</option>
                            <option value="C.E.">Cedula extrangera</option>
                        </select>
                    </label>
                </div>
                <div>
                    <label for="Documento">
                        <p>Documento</p>
                        <input type="text" placeholder="Digite Documento" name="Documento" id="Documento">
                    </label>
                </div>
                <div>
                    <label for="Nombre">
                        <p>Nombre</p>
                        <input type="text" placeholder="Digite Nombre" name="Nombre" id="Nombre">
                    </label>
                </div>
                <div>
                    <label for="Apellido">
                        <p>Apellido</p>
                        <input type="text" placeholder="Digite Apellido" name="Apellido" id="Apellido">
                    </label>
                </div>
                <div>
                    <label for="Expedicion_ced">
                        <p>Expedicion de cedula</p>
                        <input type="date" name="Expedicion_ced" id="Expedicion_ced">
                    </label>
                </div>
                <div>
                    <label for="Correo">
                        <p>Correo</p>
                        <input type="text" placeholder="Digite Correo" name="correo" id="Correo">
                    </label>
                </div>
                <div>
                    <label for="Telefono">
                        <p>Telefono</p>
                        <input type="number" placeholder="Digite Numero Telefonico" name="Telefono" id="Telefono">
                    </label>
                </div>
                <div>
                    <label for="password">
                        <p>Contraseña</p>
                        <input type="text" placeholder="Digite Contraseña" name="password" id="password">
                    </label>
                </div>
                <div>
                    <label for="fecha_nac">
                        <p>Fecha nacimiento</p>
                        <input type="date" name="fecha_nac" id="fecha_nac">
                    </label>
                </div>
                <div>
                    <label for="Afiliacion">
                        <p>Tipo de afiliacion</p>
                        <select name="Afiliacion" id="Afiliacion">
                            <option value="contributivo">Contributivo</option>
                            <option value="subcidiado">subcidiado</option>
                        </select>
                    </label>
                </div>
                <div>
                    <button type="submit" name="register" id="register">Actualizar</button>
                </div>
            </div>
        </div>
    </form>
</body>

</html>
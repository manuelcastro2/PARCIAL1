<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PRINCIPAL</title>
</head>

<body>
<%
Connection conexion=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver");
conexion = DriverManager.getConnection(
				"jdbc:mysql://localhost/parcial", "root",
				"");

PreparedStatement ps;
String cedula =  request.getParameter("Documento");
ps=conexion.PreparedStatement("select * from usuarios where Documento="+cedula);
rs=ps.executeQuery();

while(rs.next()){


%>
<form action="../BD/insertar.jsp" method="post">
        <div>
            <div>
                <div>
                    <label for="">
                        <h1>REGISTRO</h1>
                    </label>
                </div>
                <div>
                    <label for="Nombre">
                        <p>Nombre</p>
                        <input type="text" placeholder="Digite Nombre" name="Nombre" id="Nombre" value="<">
                    </label>
                </div>
                <div>
                    <label for="Apellido">
                        <p>Apellido</p>
                        <input type="text" placeholder="Digite Apellido" name="Apellido" id="Apellido">
                    </label>
                </div>
                <div>
                    <label for="Tipo">
                        <p>Tipo documento</p>
                        <input type="text" placeholder="Digite tipo" name="Tipo" id="Tipo" disabled>
                    </label>
                </div>
                <div>
                    <label for="Documento">
                        <p>Documento</p>
                        <input type="text" placeholder="Digite Documento" name="Documento" id="Documento" disabled>
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
                        <input type="text" placeholder="Digite Correo" name="Correo" id="Correo">
                    </label>
                </div>
                <div>
                    <label for="Telefono">
                        <p>Telefono</p>
                        <input type="text" placeholder="Digite Numero Telefonico" minlength="10" maxlength="10" name="Telefono" id="Telefono">
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
                       <input type="text" placeholder="Digite Afiliacion" name="Afiliacion" id="Afiliacion" disabled>
                    </label>
                </div>
                <div>
                    <button type="submit" name="register" id="INSERTAR">Registrar</button>
                </div>
            </div>
        </div>
    </form>
<%}%>
</body>

</html>
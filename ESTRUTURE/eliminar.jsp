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
    <title>ELIMINAR DATOS</title>
</head>

<body>
<%
Connection conexion=null;
Statement  sentencia=null;
int filas=0;
Class.forName("com.mysql.jdbc.Driver");
conexion = DriverManager.getConnection(
				"jdbc:mysql://localhost/parcial", "root",
				"");
sentencia= conexion.createStatement();
PreparedStatement ps;
String cedula =  request.getParameter("Documento");
String consulta="delete from usuarios where Documento="+cedula;
filas=sentencia.executeUpdate(consulta);
response.sendRedirect("principal.jsp");

%>
</body>
</html>
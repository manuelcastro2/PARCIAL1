<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insertar</title>
</head>
<body>

<%
String cedula =  request.getParameter("documento");
String  Tipo_doc=  request.getParameter("Tipo");
String Expedicion_ced =  request.getParameter("Expedicion_ced");
String Nombre =  request.getParameter("Nombre");
String Apellido=  request.getParameter("Apellido");
String Correo =  request.getParameter("Correo");
String Telefono =  request.getParameter("Telefono");
String password =  request.getParameter("password");
String fecha_nac =  request.getParameter("Fecha_nac");
String afiliacion=  request.getParameter("Afiliacion");

Connection conexion = null;
	Statement sentencia = null;
	
	int filas=0;
	try {

		Class.forName("com.mysql.jdbc.Driver");

	conexion = DriverManager.getConnection(
				"jdbc:mysql://localhost/parcial", "root",
				"");

		sentencia = conexion.createStatement();

		String consultaSQL = "INSERT INTO usuarios (Documento,tipo_doc,Nombre, Apellidos,Correo,Telefono,password,Fecha_Nac,Expediccion_ced,Tipos_Afiliacion ) values ";
		consultaSQL += "('" + cedula + "','" + Tipo_doc +"','"+Expediccion_ced+"','"+Nombre+"','"+Apellido+"','"+Correo+"','"+Telefono+"','"+password+"','"+fecha_Nac+"','" + afiliacion +"')";

		 filas = sentencia.executeUpdate(consultaSQL);
%><script>alert(<%out.println("se guardo el registro correctamente")%>);</script><%
		 response.sendRedirect("../index.html");

	} catch (ClassNotFoundException e) {

		out.println("Error en la carga del driver "
				+ e.getMessage());

	} catch (SQLException e) {

		out.println("Error accediendo a la base de datos"
				+ e.getMessage());

	} finally {

		if (sentencia != null) {

			try {sentencia.close();} 
			catch (SQLException e) 
			{out.println("Error cerrando la sentencia" +
					e.getMessage());}
			
		}
		if (conexion != null) {

			try {conexion.close();}
			catch (SQLException e) 
			{out.println("Error cerrando la conexion" +
					e.getMessage());}
		}
	}
%>
</body>
</html>
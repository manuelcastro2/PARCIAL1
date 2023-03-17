<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.*"%>
<%
//hago la conexion y recibo la informacion enviada atrevez de un jsp o html
String cedula =  request.getParameter("Usuario");
String password =  request.getParameter("password");

Connection conexion = null;
	Statement sentencia = null;
	
	int filas=0;
	try {

		Class.forName("com.mysql.jdbc.Driver");

	conexion = DriverManager.getConnection(
				"jdbc:mysql://localhost/parcial", "root",
				"");

		sentencia = conexion.createStatement();
ResultSet rs;
//hago la consulta de la base de datos pra hacer el inicio de sesion, la validacion
		rs=sentencia.executeQuery("SELECT * FROM usuarios WHERE Documento='"+cedula+"' and password='"+password+"'");
if(rs.next()){
session.setAttribute("Documento",cedula);
   response.sendRedirect("../ESTRUTURE/principal.jsp"); 
   rs.getInt("Documento");
}	 


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
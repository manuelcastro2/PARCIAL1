<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*"%>
<%
//creo la conexion y hago la eliminacion del usuario atrevez de la llave  principal
Connection conexion=null;
Statement  sentencia=null;
int filas=0;
Class.forName("com.mysql.jdbc.Driver");
conexion = DriverManager.getConnection(
				"jdbc:mysql://localhost/parcial", "root",
				"");
sentencia= conexion.createStatement();
PreparedStatement ps;
String ID =  request.getParameter("Asignacion");
if(ID!=null){
String consulta="delete from citas_medicas where Asignacion="+ID;
filas=sentencia.executeUpdate(consulta);
response.sendRedirect("../ESTRUTURE/principal.jsp");
}

%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ASIGNAR EXAMENES</title>
    <link rel="stylesheet" href="../CSS/styleexamenes.css">
</head>

<body>
<!--creo la conexion y hago la consulta-->
<%
Connection conexion=null;
Statement  sentencia=null;
ResultSet rs=null;
int filas=0;
	
Class.forName("com.mysql.jdbc.Driver");
conexion = DriverManager.getConnection("jdbc:mysql://localhost/parcial", "root","");
sentencia= conexion.createStatement();
PreparedStatement ps;
String consulta=null;
String tipo=request.getParameter("Tipo_cedula");
String cedula =  request.getParameter("Documento");
    if(cedula!=null){
consulta="SELECT * FROM usuarios WHERE Documento='"+cedula+"' and tipo_doc='"+tipo+"'";
    }
rs=sentencia.executeQuery(consulta);
while(rs.next()){

%>
<!--muestro la informacion y hay inputs modificables-->
    <form method="post" action="">
        <div class="contener-shadow">
            <div class="button2">
                <a href="../index.html">Regresar</a>
            </div>
            <div class="contener-mediun">
                <div>
                    <label for="">
                        <h1>ASIGNACION DE EXAMEN</h1>
                    </label>
                </div>
                <div class="contener-forward">
                    <div>
                        <label for="Documento">
                            <p>Documento</p>
                            <input type="text" name="Documento" id="Documento" value="<%=rs.getString("Documento")%>">
                        </label>
                    </div>
                    <div>
                        <label for="Nombre">
                            <p>Nombre</p>
                            <input type="text" placeholder="Digite Nombre" name="Nombre" id="Nombre"  value="<%=rs.getString("Nombre")%>">
                        </label>
                    </div>
                    <div>
                        <label for="Apellido">
                            <p>Apellido</p>
                            <input type="text" placeholder="Digite Apellido" name="Apellido" id="Apellido" value="<%=rs.getString("Apellido")%>">
                        </label>
                    </div>
                    <%}%>
                    <div>
                        <label for="Tipo">
                            <p>Cuidad</p>
                            <select name="Tipo" id="Tipo">
                                <option value="Bucaramanga">Bucaramanga</option>
                                <option value="Floridablanca">Floridablanca</option>
                                <option value="Pidiecuesta">Pidiecuesta</option>
                                <option value="Giron">Giron</option>
                            </select>
                        </label>
                    </div>
                      <div>
                        <label for="tipocita">
                            <p>Tipo de examen</p>
                            <select name="Tipocita" id="Tipocita">
                                <option value="Sangre">Sangre</option>
                                <option value="Orina">Orina</option>
                                <option value="Genetica">Genetica</option>
                                <option value="Prenatales">Prenatales</option>
                                <option value="Tiroides">Tiroides</option>
                                <option value="Rinones">Riñones</option>
                                <option value="Plaquetas">Plaquetas</option>
                                <option value="Tension">Tension</option>
                                <option value="Radiografia">Radiografia</option>
                            </select>
                        </label>
                    </div>
                    <div>
                        <label for="fecha_cita">
                            <p>Fecha Cita</p>
                            <input type="date" name="fecha_cita" id="fecha_cita">
                        </label>
                    </div>
                    <div>
                        <label for="Hora">
                            <p>Hora cita</p>
                            <input type="time" name="Hora" id="Hora">
                        </label>
                    </div>
                    <div>
                    <!--envio la informacion almacenada-->
                        <button type="submit" name="asignarcita" id="asignarcita">Examen</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>

</html>
<!--hago el envio a la base datos-->
<%
String ciudad =  request.getParameter("Tipo");
String Tcita =  request.getParameter("Tipocita");
String fecha_cita=  request.getParameter("fecha_cita");
String Hora=  request.getParameter("Hora");
if(ciudad!=null&&Tcita!=null&&fecha_cita!=null&&cedula!=null){
 consulta = "INSERT INTO citas_examenes (Fecha_Examen,Tipo_Examen,Hora,Ciudad,Ced) values ";
		consulta += "('" +fecha_cita+ "','" +Tcita+ "','"+Hora+"','"+ciudad+"','"+cedula+"')";
filas=sentencia.executeUpdate(consulta);

response.sendRedirect("../index.html");
}
%>
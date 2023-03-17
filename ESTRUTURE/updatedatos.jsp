<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ACTUALIZAR DATOS</title>
    <link rel="stylesheet" href="../CSS/styleupdate.css">
</head>

<body>
<!--creo la conexion y hago la consulta de los datos-->
<%
Connection conexion=null;
Statement  sentencia=null;
ResultSet rs=null;
int filas=0;
Class.forName("com.mysql.jdbc.Driver");
conexion = DriverManager.getConnection(
				"jdbc:mysql://localhost/parcial", "root",
				"");
sentencia= conexion.createStatement();
PreparedStatement ps;
String cedula =  request.getParameter("Documento");
String consulta="select * from usuarios where Documento="+cedula;
rs=sentencia.executeQuery(consulta);

while(rs.next()){


%>
<!--muestro los datos en diferentes inputs y creo varios contendor donde encierran la informacion-->
<!--ademas tmabien hay inputs bloqueas donde no se puede modificar la informacion-->
<form action="" method="post">
        <div class="contener-shadow">
        <div class="mv">
            <a class="button2" href="principal.jsp">Regresar</a>
            </div>  
            <div class="contener-mediun">
                <div>
                    <label for="">
                        <h1>ACTUALIZAR DATOS</h1>
                    </label>
                </div>
                <div class="contener-forward">
                    <div>
                        <label for="Nombre">
                            <p>Nombre</p>
                            <input type="text" placeholder="Digite Nombre" name="Nombre" id="Nombre" value="<%=rs.getString("Nombre")%>">
                        </label>
                    </div>
                    <div>
                        <label for="Apellido">
                            <p>Apellido</p>
                            <input type="text" placeholder="Digite Apellido" name="Apellido" id="Apellido" value="<%=rs.getString("Apellido")%>">
                        </label>
                    </div>
                    <div>
                        <label for="Tipo">
                            <p>Tipo documento</p>
                            <input type="text" placeholder="Digite tipo" name="Tipo" id="Tipo" disabled value="<%=rs.getString("tipo_doc")%>">
                        </label>
                    </div>
                    <div>
                        <label for="Documento">
                            <p>Documento</p>
                            <input type="text" placeholder="Digite Documento" name="Documento" id="Documento" disabled value="<%=rs.getString("Documento")%>">
                        </label>
                    </div>
                    <div>
                        <label for="Expedicion_ced">
                            <p>Expedicion de cedula</p>
                            <input type="date" name="Expedicion_ced" id="Expedicion_ced"value="<%=rs.getString("Expediccion_Ced")%>">
                        </label>
                    </div>
                    <div>
                        <label for="Correo">
                            <p>Correo</p>
                            <input type="text" placeholder="Digite Correo" name="Correo" id="Correo" value="<%=rs.getString("Correo")%>">
                        </label>
                    </div>
                    <div>
                        <label for="Telefono">
                            <p>Telefono</p>
                            <input type="text" minlength="10" maxlength="10" name="Telefono" id="Telefono" value="<%=rs.getString("Telefono")%>">
                        </label>
                    </div>
                    <div>
                        <label for="password">
                            <p>Contraseña</p>
                            <input type="text" placeholder="Digite Contraseña" name="password" id="password" value="<%=rs.getString("Password")%>">
                        </label>
                    </div>
                    <div>
                        <label for="fecha_nac">
                            <p>Fecha nacimiento</p>
                            <input type="date" name="fecha_nac" id="fecha_nac" value="<%=rs.getString("Fecha_Nac")%>">
                        </label>
                    </div>
                    <div>
                        <label for="Afiliacion">
                            <p>Tipo de afiliacion</p>
                           <input type="text" placeholder="Digite Afiliacion" name="Afiliacion" id="Afiliacion" disabled value="<%=rs.getString("Tipos_Afiliacion")%>">
                        </label>
                    </div>
                </div>
            </div>
            <div>
                <button class="button1" type="submit" name="register" id="INSERTAR">Actualizar</button>
            </div>
        </div>
    </form>
<%}%>
</body>

</html>
<!--aqui almaceno la informacion modiificada y la envio a la base de datos para que actulize la informacion-->
<%
String Expedicion_ced =  request.getParameter("Expedicion_ced");
String Nombre =  request.getParameter("Nombre");
String Apellido=  request.getParameter("Apellido");
String Correo =  request.getParameter("Correo");
String telefono =  request.getParameter("Telefono")	;
String password =  request.getParameter("password");
String fecha_nac =  request.getParameter("fecha_nac");

if(Expedicion_ced!=null&&Nombre!=null&&Apellido!=null&&Correo!=null&&telefono!=null&&password!=null&&fecha_nac!=null){
consulta="update usuarios set Nombre='"+Nombre+"',Apellido='"+Apellido+"',Correo='"+Correo+"',Telefono='"+telefono+"',Password='"+password+"',Fecha_Nac='"+fecha_nac+"',Expediccion_Ced='"+Expedicion_ced+"'where Documento="+cedula;
filas=sentencia.executeUpdate(consulta);

response.sendRedirect("principal.jsp");
}
%>
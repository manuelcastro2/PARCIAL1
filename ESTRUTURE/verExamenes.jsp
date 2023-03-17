<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
 <%@ page import="java.sql.PreparedStatement" %>
 <%@ page import="java.sql.*" %>
                        <!DOCTYPE html>
                        <html lang="en">

                        <head>
                            <meta charset="UTF-8">
                            <meta http-equiv="X-UA-Compatible" content="IE=edge">
                            <meta name="viewport" content="width=device-width,
                                    initial-scale=1.0">
                            <title>ELIMINAR EXAMENES</title>
                            <style>
                               @import '../CSS/styleverexamenes.css';
                            </style>
                        </head>

                        <body>
                        <!--creo la conexion y la consulta de datos-->
                            <% Connection conexion=null; 
                            Statement sentencia=null; 
                            ResultSet rs=null;
                             int filas=0;
                                Class.forName("com.mysql.jdbc.Driver");
                                conexion=DriverManager.getConnection( "jdbc:mysql://localhost/parcial" , "root" , "" );
                                sentencia=conexion.createStatement(); 
                                PreparedStatement ps; 
                                String cedula=request.getParameter("Documento");
                                 String consulta="select Asignacion,Fecha_Examen,Tipo_Examen,Hora,Ciudad from citas_examenes where Ced=" +cedula;
                                  rs=sentencia.executeQuery(consulta);
                                   %>
                                   <!--contenedor que encierra todo-->
                                <div class="contener-shadow">
                                <!--contenedor que encierra un div-->
                                    <div class="contener-mediun">
                                        <div>
                                            <label for="">
                                                <h1>VER Y ELIMINAR EXAMENES</h1>
                                            </label>
                                        </div>
                                        <!--input donde me muesta el documento-->
                                        <div class="div-input">
                                            <label class="bal" for="Documento">
                                                <p>Documento</p>
                                                <input type="text" placeholder="Digite
                                                        Documento" name="Documento" id="Documento" disabled
                                                    value="<%out.println(cedula);%>">
                                            </label>
                                        </div>
                                        <!--creo una tabla donde mostrare informacion y la llamado con rs.getString-->
                                        <div class="contener-forward">
                                            <table class="tabla">
                                                <tr class="cabezado">
                                                    <td>ID</td>
                                                    <td>Fecha cita</td>
                                                    <td>Tipo de Examen </td>
                                                    <td>Hora Examen</td>
                                                    <td>Ciudad</td>
                                                    <td>Eliminar</td>
                                                </tr>
                                                    <% while(rs.next()){ %>
                                                        <form action="" method="post">
                                                                <tr>
                                                                    <td>
                                                                        <%=rs.getString("Asignacion")%>
                                                                    </td>
                                                                    <td>
                                                                        <%=rs.getString("Fecha_Examen")%>
                                                                    </td>
                                                                    <td>
                                                                        <%=rs.getString("Tipo_Examen")%>
                                                                    </td>
                                                                    <td>
                                                                        <%=rs.getString("Hora")%>
                                                                    </td>
                                                                    <td>
                                                                        <%=rs.getString("Ciudad")%>
                                                                    </td>
                                                                    <!--boton dondde redirecciona al eliminar el examen-->
                                                                    <td><a class="botonenvio" href="../BD/eliminarexamenes.jsp?Asignacion=<%=rs.getString("Asignacion")%>">Delete</a></td>
                                            <% }%>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <!--boton donde me redireciona  a la pagina anterior-->
                            <div class="button2">
                            <a href="principal.jsp">Regresar</a>
                            </div>
                        </div>
                    </form>
                </body>
            </html>
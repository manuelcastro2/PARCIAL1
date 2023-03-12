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
                            <title>ELIMINAR CITAS</title>
                        </head>

                        <body>
                            <% Connection conexion=null; 
                            Statement sentencia=null; 
                            ResultSet rs=null;
                             int filas=0;
                                Class.forName("com.mysql.jdbc.Driver");
                                conexion=DriverManager.getConnection( "jdbc:mysql://localhost/parcial" , "root" , "" );
                                sentencia=conexion.createStatement(); 
                                PreparedStatement ps; 
                                String cedula=request.getParameter("Documento");
                                 String consulta="select Asignacion,Fehca_cita,Tipo_cita,Hora,Ciudad from citas_medicas where Ced=" +cedula;
                                  rs=sentencia.executeQuery(consulta);
                                   %>
                                <div>
                                    <table>
                                        <tr>
                                            <td>ID</td>
                                            <td>Fecha cita</td>
                                            <td>Tipo de cita </td>
                                            <td>Hora cita</td>
                                            <td>Ciudad</td>
                                        </tr>
                                        <div>
                                            <label for="">
                                                <h1>REGISTRO</h1>
                                            </label>
                                        </div>
                                        <div>
                                            <label for="Documento">
                                                <p>Documento</p>
                                                <input type="text" placeholder="Digite
                                                        Documento" name="Documento" id="Documento" disabled
                                                    value="<%out.println(cedula);%>">
                                            </label>
                                        </div>
                                        <div>
                                            <% while(rs.next()){ %>
                                                <form action="" method="post">
                                                    <div>
                                                        <tr>
                                                            <td>
                                                                <%=rs.getString("Asignacion")%>
                                                            </td>
                                                            <td>
                                                                <%=rs.getString("Fehca_cita")%>
                                                            </td>
                                                            <td>
                                                                <%=rs.getString("Tipo_cita")%>
                                                            </td>
                                                            <td>
                                                                <%=rs.getString("Hora")%>
                                                            </td>
                                                            <td>
                                                                <%=rs.getString("Ciudad")%>
                                                            </td>
                                                    </div>
                                                    <% }%>
                                                        </tr>
                                    </table>
                                    <div>
                                        <button type="submit" name="register" id="INSERTAR">Registrar</button>
                                    </div>
                                    </form>
                        </body>

                        </html>
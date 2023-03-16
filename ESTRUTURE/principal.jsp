<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.*"%>
					<!DOCTYPE html>
					<html lang="en">

						<head>
							<meta charset="UTF-8">
							<meta http-equiv="X-UA-Compatible" content="IE=edge">
							<meta name="viewport" content="width=device-width, initial-scale=1.0">
							<title>PRINCIPAL DATOS</title>
							<style>
                               @import '../CSS/styleprincipal.css';
                            </style>
						</head>

						<body>
							<%
								Connection conexion=null;
								Statement sentencia=null;
								ResultSet rs=null;
								try {
								Class.forName("com.mysql.jdbc.Driver");

								conexion= DriverManager.getConnection("jdbc:mysql://localhost/parcial", "root","");
								sentencia= conexion.createStatement();

								String consultaSQL="select Documento,tipo_doc,Nombre,Apellido,Tipos_Afiliacion from usuarios";
								rs=sentencia.executeQuery(consultaSQL);

								%><h1>DATOS DE LOS USUARIOS</h1>
								<div class="contener-shadow">
									<div class="contener-mediun">
										<div class="contener-forward">
											<table class="tabla"> 
												<tr class="cabezado">
											<td>Documento</td><td>Tipo de documento</td><td>Nombre</td><td>Apellido</td><td>Afiliacion</td><td>Actualizar Datos</td><td>Eliminar Usuario</td>
											<td>Eliminar citas</td><td>Eliminar examenes</td>
										</tr><%
											while(rs.next()) { %>
											<tr><td><%=rs.getString("Documento")%></td>
													<td><%=rs.getString("tipo_doc")%></td>
														<td><%=rs.getString("Nombre")%></td>
															<td><%=rs.getString("Apellido")%></td>
																<td><%=rs.getString("Tipos_Afiliacion")%></td>
																	<td><a class="botonenvio"href="updatedatos.jsp?Documento=<%=rs.getString("Documento")%>"
																			>Actualizar</a></td>
																	<td><a class="botonenvio" href="../BD/eliminar.jsp?Documento=<%=rs.getString("Documento")%>">eliminar</a></td>
																	<td><a class="botonenvio"  href="vercitasMedicas.jsp?Documento=<%=rs.getString("Documento")%>"
																			>Eliminar</a></td>
																	<td><a class="botonenvio"  href="verExamenes.jsp?Documento=<%=rs.getString("Documento")%>"
																			>Eliminar</a></td>
																	<% }%></tr></table><%

																	}catch (ClassNotFoundException e) {

																	out.println(" Error en la carga del driver"
																	+ e.getMessage());

																	}catch (SQLException e) {

																	out.println(" Error accediendo a la base de datos"
																	+ e.getMessage());

																	}
																	finally {
																	if (rs != null) {

																	try {rs.close();} catch (SQLException e)
																	{out.println(" Error cerrando el resultset" + e.getMessage());}
																	}

																	if (sentencia != null) {

																	try {sentencia.close();} catch (SQLException e)
																	{out.println(" Error cerrando la sentencia" + e.getMessage());}
																	}
																	if (conexion != null) {

																	try {conexion.close();} catch (SQLException e)
																	{out.println(" Error cerrando la conexion" + e.getMessage());}
																	}
																	}
																	%>
																</div>
																</div>
																<a class="botonenvio2"  href="../index.html">Regresar</a>
															</div>
																</body>

															</html>
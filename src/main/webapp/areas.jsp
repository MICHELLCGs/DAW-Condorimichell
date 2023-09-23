<%-- 
    Document   : areas
    Created on : 18/09/2023, 04:30:56 PM
    Author     : Michell
--%>
<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" 
              href="webjars/bootstrap/5.1.0/css/bootstrap.min.css" type="text/css" />
        <title>JSP Page</title>
    </head>
    <%--validacion de sesion--%>
<%
HttpSession misession= (HttpSession) request.getSession();
String usuario= (String) misession.getAttribute("usuario");  

if(misession == null || misession.getAttribute("usuario") == null){
      out.print("<link rel=\"stylesheet\" \n"
                + "              href=\"webjars/bootstrap/5.1.0/css/bootstrap.min.css\" type=\"text/css\" />");
      out.println("<center>");           
      out.println("<h3>Primero debe estar identificado para poder ver el contenido</h3>");
      out.println("<a class='btn btn-primary' href='/WebJava04/close.jsp'>Cerrar sesión</a>");
      out.println("</center>");
      return;
  }    
%>


<%
  String driver = "com.mysql.cj.jdbc.Driver";
  String url   = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC";
  String user   = "root";
  String pass   = "123456";
  
  Class.forName(driver);
  Connection xcon = DriverManager.getConnection(url, user, pass);
  
  String sql = "select * from areas";
  Statement stm = xcon.createStatement();
  ResultSet rs = stm.executeQuery(sql);
%>
 
<!DOCTYPE html>
<html>
<head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" 
              href="webjars/bootstrap/5.1.0/css/bootstrap.min.css" type="text/css" />
        <title>JSP Page</title
    <style>

        .even-row {
            background-color: #EF7E87; 
        }

        .odd-row {
            background-color: #DCDCCD; 
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>Usuario Logeado: <b><% out.print(usuario); %></b></h3>
        <h3><a class='btn btn-danger' href="/WebJava04/ServletSesion">Cerrar Sesion</a></h3>

        <h1>Listado de Areas</h1>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">CODIGO</th>
                    <th scope="col">NOMBRE</th>
                    <th scope="col">ESTADO</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int rowCount = 0; 
                    while (rs.next()) {
                       
                        String rowClass = (rowCount % 2 == 0) ? "even-row" : "odd-row";
                        
                        out.print("<tr class='" + rowClass + "'>");
                        out.print("<td>" + rs.getString(1) + "</td>");
                        out.print("<td>" + rs.getString(2) + "</td>");
                        out.print("<td>" + rs.getString(3) + "</td>");
                        out.print("</tr>");
                        
                        rowCount++; 
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>



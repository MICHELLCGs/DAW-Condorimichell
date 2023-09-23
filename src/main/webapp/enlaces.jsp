<%-- 
    Document   : enlaces
    Created on : 23/09/2023, 01:41:54 AM
    Author     : Michell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
HttpSession misession= (HttpSession) request.getSession();
String usuario= (String) misession.getAttribute("usuario");
String estado= (String) misession.getAttribute("estado"); 
if(misession == null || misession.getAttribute("usuario") == null){
      out.print("<link rel=\"stylesheet\" \n"
                + "              href=\"webjars/bootstrap/5.1.0/css/bootstrap.min.css\" type=\"text/css\" />");
      out.println("<center>");           
      out.println("<h3>Primero debe estar identificado para poder ver el contenido</h3>");
      out.println("<a class='btn btn-primary' href='/WebJava04/login.jsp'>Ir a pagina de acceso</a>");
      out.println("</center>");
      return;
  }    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
               <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" 
              href="webjars/bootstrap/5.1.0/css/bootstrap.min.css" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
         <center>
        <h1> ENLACES</h1>
        <a href="areas.jsp" class="btn btn-dark">Areas</a>
        <a href="cargos.jsp" class="btn btn-dark">Cargos</a>

         </center>
    </body>
</html>

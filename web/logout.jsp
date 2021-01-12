<%-- 
    Document   : locacao
    Created on : 11/12/2020, 08:36:49
    Author     : Rubia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Area restrita</h1>
        <p>Voce precisa estar logado para acessar esta area</p>
        
        <%
          String usuario = (String) session.getAttribute("usuario");
              if (usuario == null) {
              response.sendRedirect("login.jsp");
          }
          out.print(usuario);
        %>
        <hr />
        <a href="logout.jsp">Logout</a>
    </body>
</html>
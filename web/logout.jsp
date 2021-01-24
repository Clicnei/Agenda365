<%-- 
   
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <style>
        section {
            display: block;
        }
    </style>
    <body>
        
        <p>Você finalizou o programa</p>
        
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
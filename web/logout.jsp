<%-- 
Document   : locacao
Created on : 11/12/2020, 08:36:49
Author     : Volnei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        section { 
            display: block;
        }
    </style>
    <body>

        <p>Voce  finalizou o programa</p>

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

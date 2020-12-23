<%-- 
    Document   : consultausuario
    Created on : 22 de dez de 2020, 11:58:56
    Author     : A
--%>

<%@page import="java.util.List"%>
<%@page import="modelos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AGENDA 365</title>
          <link rel="stylesheet" href="styles/estilos.css"> 
    </head>
    <body>
        <script src="scripts/menu.js"></script>
        <h1>Consulta Usuario</h1>
        <hr />
        <%
          Usuario usuario = new Usuario();
          List<Usuario> usuarios = usuario.consultar();
        %>
        <table>
            <thead>
              <th>Nome</th>
              <th>CPF</th>
              <th>Usuario</th>
              <th>Senha</th>
              <th> Editar </th>
              <th> Excluir </th>
            </thead>
            <tbody>
                <% for(Usuario u : usuarios) {%>
                   <tr>
                       <td><% out.write(""+u.getNome()); %></td>
                        <td><% out.write(u.getCpf()); %></td>
                        <td><% out.write(u.getUsuario()); %></td>
                        <td><% out.write(u.getSenha()); %></td>
                         <td><%out.write("<a href=editarusuario.jsp?cpf="+u.getCpf()+">Editar</a>");%></td> 
                         <td><%out.write("<a href=excluirusuario.jsp?cpf="+u.getCpf()+">Excluir</a>");%></td>                         
                   </tr> 
                   
                <%}%>
            </tbody>
        </table>
    </body>
</html>

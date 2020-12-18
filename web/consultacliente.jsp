<%-- 
    Document   : consultaCliente
    Created on : 30 de out de 2020, 08:35:53
    Author     : entra21
--%>

<%@page import="java.util.List"%>
<%@page import="modelos.Cliente"%>
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
        <h1>Consulta Cliente</h1>
        <hr />
        <%
          Cliente cliente = new Cliente();
          List<Cliente> clientes = cliente.consultar();
        %>
        <table>
            <thead>
              <th>CPF</th>
              <th>Nome</th>
              <th>Email</th>
              <th>Fone</th>
              <th> Editar </th>
              <th> Excluir </th>
            </thead>
            <tbody>
                <% for(Cliente c : clientes) {%>
                   <tr>
                       <td><% out.write(""+c.getCpf()); %></td>
                        <td><% out.write(c.getNome()); %></td>
                        <td><% out.write(c.getEmail()); %></td>
                        <td><% out.write(c.getFone()); %></td>
                         <td><%out.write("<a href=editarcliente.jsp?cpf="+c.getCpf()+">Editar</a>");%></td> 
                         <td><%out.write("<a href=excluircliente.jsp?cpf="+c.getCpf()+">Excluir</a>");%></td>                         
                   </tr> 
                   
                <%}%>
            </tbody>
        </table>
    </body>
</html>

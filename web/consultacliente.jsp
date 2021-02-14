<%-- 
    Document   : consultaCliente
    Created on : 30 de Jan de 2021, 08:35:53
    Author     : Volnei
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
        <style>

            a{
                background-color: #4682B4;
                color: white;
                display: block;
                text-decoration: none;
                padding: 1px;
                border-radius: 10px;
                font-weight: bolder;
                margin-top: 1px;
                width: 80px;
                
                text-align: center;
                margin-left: 2px;
            }
            
            td, th {
                border: 2px solid #dddddd;
                text-align: center;
                padding: 1px;
            }

            tr:nth-child(even) {
                background-color: #dddddd;
            }
        </style>

        <header>
            <h2>CONSULTA CLIENTE</h2>
            
         <div class="menu">
             <a href="inicio.jsp">VOLTAR</button></a> &nbsp; &nbsp;
            
        </div>
        </header>
        
        <%
            Cliente cliente = new Cliente();
            List<Cliente> clientes = cliente.consultar();
        %>
        <table>
            <thead>
            <th>id</th>
            <th>nome</th>
            <th>cpf</th>
            <th>cnpj</th>
            <th>rua</th>
            <th>numero</th>
            <th>complemento</th>
            <th>bairro</th>
            <th>cep</th>
            <th>cidade</th>
            <th>estado</th>
            <th>telefone</th>
            <th>email</th>
            <th> Editar </th>
            <th> Excluir </th>
        </thead>
        <tbody>
            <% for (Cliente c : clientes) {%>
            <tr>
                <td><% out.write(String.valueOf(c.getId())); %></td>
                <td><% out.write(c.getNome()!=null ? c.getNome():"");%></td>
                
                <td><% out.write(c.getCpf()!=null ? c.getCpf():""); %></td>
                <td><% out.write(c.getCnpj()!=null ? c.getCnpj():""); %></td>
                <td><% out.write(c.getRua()!=null ? c.getRua():""); %></td>
                <td><% out.write(c.getNumero()!=null ? c.getNumero():""); %></td>
                <td><% out.write(c.getComplemento()!=null ? c.getComplemento():""); %></td>
                <td><% out.write(c.getBairro()!=null ? c.getBairro():""); %></td>
                <td><% out.write(c.getCep()!=null ? c.getCep():""); %></td>
                <td><% out.write(c.getCidade()!=null ? c.getCidade():""); %></td>
                <td><% out.write(c.getEstado()!=null ? c.getEstado():""); %></td>
                <td><% out.write(c.getTelefone()!=null ? c.getTelefone():""); %></td>
                <td><% out.write(c.getEmail()!=null ? c.getEmail():""); %></td>
                <td><%out.write("<a href=editarcliente.jsp?cpf=" + c.getCpf() + ">Editar</a>");%></td> 
                <td><%out.write("<a href=excluircliente.jsp?cpf=" + c.getCpf() + ">Excluir</a>");%></td>                         
            </tr> 

            <%}%>
        </tbody>
    </table>
</body>
</html>
<%-- 
    Document   : consultaequipamentos
    Created on : 18 de jan de 2021, 08:35:53
    Author     : Volnei     
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Equipamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AGENDA 365</title>
    <a href="consultaequipamento.jsp"></a>
</head>
<body>
    <h1>Consulta Equipamentos</h1>
    <hr />
    <script src="scripts/menu.js"></script>
    <link rel="stylesheet" href="styles/estilos.css"> 

    <%
        List<Equipamento> equip = Equipamento.consultar();
              
    %>

    <table>
        <thead>
        <th>Id</th>
        <th>Marca</th>
        <th>Modelo</th>
        <th>PotenciaBtus</th>
        <th>Litragem</th>
        <th>Tensao</th>
        <th>Aparelho</th>

        <th> Editar </th>
        <th> Excluir </th>
        
    </thead>
    <tbody>
        <% for (Equipamento e : equip) {%>
        <tr>
            <td><% out.write(String.valueOf(e.getId())); %></td>
            <td><% out.write(e.getMarca()!=null ? e.getMarca():"");%></td>
            <td><% out.write(e.getModelo()!=null ? e.getModelo():"");%></td>
            <td><% out.write(e.getPotenciaBtus()!=null ? e.getPotenciaBtus():"");%></td>
            <td><% out.write(e.getLitragem()!=null ? e.getLitragem():"");%></td>
            <td><% out.write(e.getTensao()!=null ? e.getTensao():"");%></td>
            <td><% out.write(e.getAparelho() !=null ? e.getAparelho() :"");%></td>

            <td><%out.write("<a href='editarequipamento.jsp?idequipamento=" + e.getId() + "'>Editar</a>");%></td> 
            <td><%out.write("<a href='excluirequipamento.jsp?idequipamento=" + e.getId() + "'>Excluir</a>");%></td>                         
        </tr> 

        <%}%>
    </tbody>
</table>
</body>
</html>
<%-- 
    Document   : consultaequipamentos
    Created on : 30 de out de 2020, 08:35:53
    Author     : entra21
--%>

<%@page import="java.util.ArrayList"%>
<a href="consultaequipamento.jsp"></a>
<%@page import="java.util.List"%>
<%@page import="modelos.Equipamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AGENDA 365</title>

    </head>
    <body>
        <h1>Consulta equipamentos</h1>
        <hr />
        <script src="scripts/menu.js"></script>



        <%
            List<Equipamento> equipamento = new ArrayList<>();
            Equipamento eq = new Equipamento();
            //listaEquipamento = eq.consultarAll();
            String modelo = request.getParameter("modelo");

        %>
        <table>
            <thead>
            <th>Id</th>
            <th>Marca</th>
            <th>Modelo</th>
            <th>PotenciaBtus</th>
            <th>Litragem</th>

            <th> Editar </th>
            <th> Excluir </th>
        </thead>
        <tbody>
            <% for (Equipamento e : equipamento) {%>
            <tr>
                <td><% out.write("" + e.getId()); %></td>
                <td><% out.write(e.getMarca()); %></td>
                <td><% out.write(e.getModelo()); %></td>
                <td><% out.write(e.getPotenciaBtus()); %></td>
                <td><% out.write("" + e.getLitragem()); %></td>

                <td><%out.write("<a href=editarequipamentos.jsp?idequipamentos=" + e.getId() + ">Editar</a>");%></td> 
                <td><%out.write("<a href=excluirequipamentos.jsp?idequipamentos=" + e.getId() + ">Excluir</a>");%></td>                         
            </tr> 

            <%}%>
        </tbody>
    </table>
    
</body>

</html>

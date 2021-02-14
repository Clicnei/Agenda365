
<%-- 
    Document   : excluiragendamento
    Created on : 18 de jan de 2021, 09:37:56
    Author     : Volnei
--%>

<%@page import="modelos.Agendamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Agendamento</title>
    </head>
    <body>
    
        <%
          String idagendamento = request.getParameter("idagendamento");
          Agendamento agendamento = new Agendamento();
          if (idagendamento != null){
              agendamento = agendamento.consultar(Integer.parseInt(idagendamento));
              if(agendamento.excluir()){
              out.write("Agendamento excluído com sucesso");
          }
          else
          {
              out.write("Problemas ao excluir agendamento");
          }
          }          
        %>
        <hr />
       <a href="consultaagendamento.jsp">Consulta Agendamento</a>               
    </body>
</html>

<html>
<%-- 
    Document   : recebeDadosEvento
    Created on : 21/01/2021, 01:01:31
    Author     : A
--%>

<%@page import="modelos.Evento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

</html>
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script src="scripts/menu.js"></script>
        <br/>
        
        <%
           //recebe os valores da tela HTML
          String titulo = request.getParameter("titulo");
          String criticidade = request.getParameter("criticidade");
          String dataInicio = request.getParameter("dataInicio");
          String dataFim = request.getParameter("dataFim");
          
          
          
          //instancia o evento
          Evento evento = new Evento();
          evento.setTitulo(titulo);
          evento.setCriticidade(criticidade);
          evento.setDatainicio(dataInicio);
          evento.setDatafim(dataFim);
          
          
           if( evento.salvar()){
              out.write("Evento salvo com sucesso");
          }
          else
          {
              out.write("Problemas ao salvar Evento");
          }
         
          
        %>
    </body>
</html>

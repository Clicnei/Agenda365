<%@page import="modelos.Equipamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script src="scripts/menu.js"></script>
        <br/>
        
        <%
           //recebe os valores da tela HTML
          String marca = request.getParameter("marca");
          String modelo = request.getParameter("modelo");
          String potenciaBtus = request.getParameter("potenciaBtus");
          String litragem = request.getParameter("litragem");
          String tensao = request.getParameter("tensao");
          
          
          //instancia o equipamento
          Equipamento equipamento = new Equipamento();
          equipamento.setModelo(modelo);
          equipamento.setMarca(marca);
          equipamento.setPotenciaBtus(potenciaBtus);
          equipamento.setLitragem(litragem);
          equipamento.setTensao(tensao);
          
           if( equipamento.salvar()){
              out.write("Equipamento salvo com sucesso");
          }
          else
          {
              out.write("Problemas ao salvar Equipamento");
          }
         
          
        %>
    </body>
</html>

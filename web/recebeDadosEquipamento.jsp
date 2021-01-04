<%-- 
    Document   : recebeDadosCarro
    Created on : 30 de out de 2020, 09:08:39
    Author     : entra21
--%>

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
        <h1>Agenda</h1>
        <%
          //recebe os valores da tela HTML  
          String id = request.getParameter("id");
          String marca = request.getParameter("marca");
          String modelo = request.getParameter("modelo");
          String potenciaBtus = request.getParameter("potenciaBtus");
          String litragem = request.getParameter("litragem");
          String tensao = request.getParameter("tensao");
          
          //instancia o equipamento
          Equipamento equipamento = new Equipamento();
          equipamento.setId(Integer.parseInt(id));
          equipamento.setModelo(modelo);
          equipamento.setMarca(marca);
          equipamento.setPotenciaBtus(potenciaBtus);
          equipamento.setLitragem(litragem);
          equipamento.setTensao(tensao);
     /*     
     <%-- 
          if(!km.equals(""))
             equipamento.setKm(Integer.parseInt(km));            
         
          if (arcondicionado != null)
             equipamento.setArcondicionado(true);
          
          if(direcaohidraulico != null)
            equipamento.setDirecaoHidraulico(true);
          -->
*/
          if(equipamento.salvar()){
              out.write("Equipamento salvo com sucesso");
          }
          else
          {
              out.write("Problemas ao salvar equipamento");
          }
          
        %>
    </body>
</html>

<%-- 
    Document   : recebeDadosCarro
    Created on : 30 de out de 2020, 09:08:39
    Author     : entra21
--%>

<%@page import="modelos.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Clientes</title>
    </head>
    <body>
        <script src="scripts/menu.js"></script>
        <h1>Cadastro de Clientes</h1>
               
        
        <%
          //recebe os valores da tela HTML  
          String cpf = request.getParameter("cpf");
          String nome = request.getParameter("nome");
          String email = request.getParameter("email");
          String numerocartao = request.getParameter("numerocartao");
          
          //instancia o carro
          Cliente cliente = new Cliente();
          cliente.setCpf(cpf);
          cliente.setNome(nome);
          cliente.setEmail(email);
          cliente.setNumeroCartao(numerocartao);
         
          if(cliente.salvar()){
              out.write("Cliente salvo com sucesso");
          }
          else
          {
              out.write("Problemas ao salvar Cliente");
          }
          
        %>
        
        
             }
             }   
        </script>
        
    </body>
</html>

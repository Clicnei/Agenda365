<%-- 
    Document   : recebeDadosUsuario
    Created on : 22 de dez de 2020, 16:35:55
    Author     : A
--%>

<%@page import="modelos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Usuario</title>
    </head>
    <body>
        <script src="scripts/menu.js"></script>
        <h1>Cadastro de Usuario</h1>
               
        
        <%
          //recebe os valores da tela HTML  
          String nome = request.getParameter("nome");
          String cpf = request.getParameter("cpf");
          String usuario = request.getParameter("usuario");
          String senha = request.getParameter("senha");
          
          //instancia o carro
          Usuario usuario = new Usuario();
          usuario.setNome(nome);
           usuario.setCpf(cpf);
           usuario.setUsuario(usuario);
           usuario.setSenha(senha);
         
          if( usuario.salvar()){
              out.write("Usuario salvo com sucesso");
          }
          else
          {
              out.write("Problemas ao salvar Usuario");
          }
          
        %>
        
        
             }
             }   
        </script>
        
    </body>
</html>

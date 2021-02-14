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
            
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");

            //instancia o usuario
          Usuario usuario = new Usuario();
        
           
          usuario.setNome(login);
           usuario.setSenha(senha);
                  
          if( usuario.salvar()){
              out.write("Usuario salvo com sucesso");
              response.sendRedirect("inicio.jsp");
          }
          else
          {
              out.write("Problemas ao salvar Usuario");
          }
        %>

        
        
              
    
</body>
</html>

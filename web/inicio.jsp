<%-- 
    Document   : inicio
    Created on : 4 de jan de 2021, 16:08:49
    Author     : A
--%>

<%@page import="modelos.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                background-image: url("imagens/agendaAberta.png");
                background-position: center;  
                background-repeat: no-repeat;
            }
            div{
                display: block;
                width: 300px;
                margin-left: auto;
                margin-right: auto;
            }
        </style>
    </head>
    <body>
        <div>
            <h1>Tela de Login</h1>
            <form action="login.jsp" method="POST">
                <label>Usuário</label><br/>
                <input typ="text" name="usuario" /> <br/>
                <label>Senha</label><br/>
                <input type="password" name="senha" /> <br/> <br/>
                <input type="submit" value="Logar" />                 
            </form>  
        </div>   
        <%
          String usuario = request.getParameter("usuario");
          String senha = request.getParameter("senha");
          
          if((usuario != null) && (senha != null) && !(usuario.isEmpty())
                  && !(senha.isEmpty()) ){
            //crie a seção 
           
            //if(Cliente.podeLogar(usuario,senha)){
            session.setAttribute("usuario", usuario);
            response.sendRedirect("cadastrausuario.jsp");  
          }      
            
        %>
    </body>
</html>


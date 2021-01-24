<%-- 
    Document   : login
    Created on : 09/12/2020, 15:46:18
    Author     : User
--%>

<%@page import="modelos.Usuario"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>TELA DE LOGIN</title>
        <style>
            img{
                display: block;
                position: relative;
                margin-left: auto;
                margin-right: auto;
                width: 300px;
                height: 300px;
            }

            .imgcentral{
                transition: all 0.5s;
                cursor: pointer;
            }

            .imgcentral:hover{
                -webkit-transform: scale(1.5);
                transform: scale(1.5);
            }

            hr{
                margin: 30px;
                height: 10px;
                background-color: cornflowerblue; 
            } 

            .a{
                border-radius: 5px;  
            } 
            div{
                display: block;
                margin-left: auto;
                margin-right: auto;
                width: 400px;
                border: blue solid 2px;
                margin-bottom: 10px;
                padding: 20px;
            }

        </style>
    </head>
    <body>
        <hr/>
        <div>
            <h1>Tela de Login</h1>
            <form action="login.jsp" method="POST">
                <label>Usuário</label><br/>
                <input typ="text" name="usuario" /> <br/>
                <label>Senha</label><br/>
                <input type="password" name="senha" /> <br/> <br/>
                <input type="submit" value="Logar" />  
                <a href="cadastracliente.jsp"><input type="button" value="logar"/></a>
            </form>  
        </div>   
      
        <%
          String usuario = request.getParameter("usuario");
          String senha = request.getParameter("senha");
          
          if((usuario != null) && (senha != null) && !(usuario.isEmpty())
                  && !(senha.isEmpty()) ){
            //crie a seção 
            if(Usuario.podeLogar(usuario,senha)){            
              session.setAttribute("usuario", usuario);
              response.sendRedirect("inicio.jsp"); 
            }  
          }          
        %>
        <hr/>
    </body>
</html>

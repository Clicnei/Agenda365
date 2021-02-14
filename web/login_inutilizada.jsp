<%-- 
    Document   : login
    Created on : 09/12/2020, 15:46:18
    Author     : User
--%><%@page import="modelos.Usuario"%>

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
        <div></div>
        <hr/>
        
        <img class="imgcentral" src="imagens/Doutor.png" alt="imagem"/>
        <img class="img1" src="imagens/Logo2.png" alt="imagem"/>
        <div>
                <form action="login.jsp" method="POST">
                <label>Usuario</label><br/>
                <input type="text" name="login" /> <br/>
                <label>Senha</label><br/>
                <input type="password" name="senha" /> <br/> <br/>
                <%
          String nome = request.getParameter("nome");
          String senha = request.getParameter("senha");
          
          if((nome != null) && (senha != null) && !(nome.isEmpty())
                  && !(senha.isEmpty()) ){
            //crie a seção 
           if (!Usuario.existeUsuario(nome))
              out.write("Usuario precisa se cadastrar");
          // if(Usuario.podeLogar(usuario,senha))
         
          
          if(Usuario.logar(nome, senha))
          {
            session.setAttribute("login", nome);
            response.sendRedirect("inicio.jsp");  
          }  else
           {
               out.write("Usuario e senha inválidos");
           }
            }
        %>
                <input type="submit" value="ENTRAR" />
                
        </div>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>
    </body>
</html>
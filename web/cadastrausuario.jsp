

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agenda365 - Cadastro usuario</title>
        <link rel="stylesheet" href="styles/estilos.css"> 
        <style>

            input[type=checkbox]{
                display: block;
                position: absolute;
                margin-left: 130px;
            }        
            input[type=button],[type=reset]{
                display:block;
                width: 60px;
                margin-left:  auto;
                margin-right: auto;
                margin-top: 10px
            }
            input[type=text]:focus{
                background-color: white;

            }
            input[type=text]{
                position: relative;
                background-color: silver;
                margin-left: 130px;
                width: 250px;            
            }
            label{
                display: block;
                position: absolute;
                margin-left: 10px;
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
        <script src="scripts/menu.js"></script>
        <h1>Cadastro usuario</h1>
        <hr />
        <form action="recebeDadosUsuario.jsp" method="POST">
            <label>Informe o nome</label>
            <input type="text" name="cpf" /> 

            <br />
            <label>Informe o cpf</label>
            <input type="text" name="nome" />

            <br />
            <label>Informe o usuario</label>
            <input type="text" name="email" />

            <br />
            <label>Informe a senha</label>
            <input type="text" name="fone" />

            <hr />
            <input type="button" value="Salvar" onclick="enviaForm()" />
            <input type="reset" value="Cancelar" onclick="enviaForm()/>
           </form>
       </body>                
    </html>

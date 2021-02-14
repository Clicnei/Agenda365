

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Cadastro usuario</title>
        <link rel="stylesheet" href="styles/estilos.css"> 

        <style>



        </style>
    </head>
    <body>
        <%--<script src="scripts/menu.js"></script>--%>
        <h1>Cadastro usuario</h1>
        <hr />
        <form action="recebeDadosUsuario.jsp" method="POST">

            <label>Informe o login</label>
            <input type="text" name="login" />

            <br />
            <label>Informe a senha</label>
            <input type="password" name="senha" />
            <input type="button" value="Salvar" onclick="enviaForm()" />
            <input type="reset" value="Cancelar" />

        </form>
    </div>

    <script>
        function enviaForm() {

            var login = document.getElementsByName("login");
            if (login[0].value === "") {
                login[0].focus();
                alert("Informe o login");
                exit();
            }
            var senha = document.getElementsByName("senha");
            if (senha[0].value === "") {
                senha[0].focus();
                alert("Informe o senha");
                exit();
            }
            document.forms[0].submit();
        }

    </script>

</body>                
</html>

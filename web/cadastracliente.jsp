<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CADASTROCLIENTE</title>
        <link rel="stylesheet" href="styles/estilos.css">

        <style> 

            a{
                background-color: #4682B4;
                color: white;
                display: block;
                text-decoration: none;
                padding: 10px;
                border-radius: 10px;
                font-weight: bolder;
                margin-top: 50px;
                width: 150px;
                text-align: center;
                margin-left: 20px;
            }   

            a:hover{
                background-color: #5F9EA0;
            }

            a.active {
                background-color: #4169E1;
                cursor:no-drop;
            }
            
            .sair{
                display: inline;
                margin-left: 550px;
            }
            
            .menu{
                clear: none;
                float: left;
            }

            * {
                box-sizing: border-box;
            }

            input[type=text], select, textarea {
                width: 100%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                resize: vertical;
                left: 50px;
            }

            input[type=button] {
                background-color: #4682B4;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 10px;
                font-weight: bolder;
                cursor: pointer;
                float: start;
                text-align: center;
                width: 150px;
            }

            input[type=button]:hover {
                background-color: #5F9EA0;
            }

            input[type=reset] {
                background-color: #4682B4;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 10px;
                font-weight: bolder;
                cursor: pointer;
                float: start;
                text-align: center;
                width: 150px;
            }

            input[type=reset]:hover {
                background-color: #5F9EA0;
            }*

            .container {
                border-radius: 5px;
                padding: 10px;
                margin-left: 400px;
                margin-top: 0;
            }

            .col-25 {
                float: left;
                width: 15%;
                margin-top: 6px;
            }

            .col-75 {
                float: left;
                width: 60%;
                margin-top: 6px;
            }

            /* Clear floats after the columns */
            .row:after {
                content: "";
                display: block;
                clear: both;
            }

            /* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
            @media screen and (max-width: 600px) {
                .col-25, .col-75, input[type=submit] {
                    width: 100%;
                    margin-top: 0;
                }
            }
        </style>
    </head>
    <body>
        <header>
            <h2>CADASTRO CLIENTE</h2>
        </header>
        <div class="menu"> 
            <a href="cadastracliente.jsp" class="active">Cliente</a>
            <a href="cadastroequipamento.jsp">Equipamento</a>
            <a href="cadastraordemservico.jsp">Notificações</a>
        </div>

        <div class='container'>
            <form action="recebeDadosCliente.jsp" method="POST">
                <label for="PessoaFisica">Pessoa Fisica</label>
                <input type="radio" name="isPessoaFisica" id="isPessoaFisica" onclick="changePessoaFisica()"/>
                <label for="PessoaJuridica">Pessoa Juridica</label>
                <input type="radio" name="PessoaJuridica" id="pessoaJuridica" onclick="changePessoaJuridica()"/>
                <br />

                <div class="row">
                    <div class="col-75">
                        <input type="text" id="infnome" name="nome" placeholder="Digite Nome" />
                        <input type="text" id="divCpf" name="cpf" placeholder="Digite CPF" />
                        <input type="text" id="divCnpj" name="cnpj" placeholder="Digite o CNPJ" />
                        <input type="text" id="infrua" name="rua" placeholder="Digite a Rua" />
                        <input type="text" id="infnumero" name="numero" placeholder="Digite o Numero" />
                        <input type="text" id="infcomplemento" name="complemento" placeholder="Digite o Complemento" />
                        <input type="text" id="infbairro" name="bairro" placeholder="Digite o Bairro" />
                        <input type="text" id="infcel" name="cep" placeholder="Digite o Cep" />
                        <input type="text" id="infcidade" name="cidade" placeholder="Digite a Cidade" />
                        <input type="text" id="infestado" name="estado" placeholder="Digite o Estado" />
                        <input type="text" id="infixo" name="telefone" placeholder="Digite o Telefone" />                       
                        <input type="text" id="infemail" name="email" placeholder="Digite o email" />
                    </div>
                </div>

               <br />
               

                <input type="button" value="Salvar" onclick="enviaForm()" />
                <input type="reset" value="Cancelar" onclick="enviaForm()" />
                <a href="index.jsp" class= "sair">Sair</a>
            </form>
        </div>

        <script>
            function changePessoaFisica() {
                document.getElementById("isPessoaFisica").checked = true;
                document.getElementById("pessoaJuridica").checked = false;
                document.getElementById("divCpf").hidden = false;
                document.getElementById("divCnpj").hidden = true;
            }

            function changePessoaJuridica() {
                document.getElementById("isPessoaFisica").checked = false;
                document.getElementById("pessoaJuridica").checked = true;
                document.getElementById("divCpf").hidden = true;
                document.getElementById("divCnpj").hidden = false;
            }

            function enviaForm() {
               

                var nome = document.getElementsByName("nome");
                if (nome[0].value === "") {
                    nome[0].focus();
                    alert("Informe o nome");
                    exit();
                }


                var rua = document.getElementsByName("rua");
                if (rua[0].value === "") {
                    rua[0].focus();
                    alert("Informe a rua");
                    exit();
                }

                var numero = document.getElementsByName("numero");
                if (numero[0].value === "") {
                    numero[0].focus();
                    alert("Informe o numero");
                    exit();
                }


                var bairro = document.getElementsByName("bairro");
                if (bairro[0].value === "") {
                    bairro[0].focus();
                    alert("Informe o bairro");
                    exit();
                }

                var telefone = document.getElementsByName("telefone");
                if (telefone[0].value === "") {
                    telefone[0].focus();
                    alert("Informe o telefone");
                    exit();
                }

                document.forms[0].submit();
            }
        </script>
    </body>   
</html>

<%-- 
    Document   : cadastroequipamentos
    Created on : 27 de JAN de 2021, 08:34:09
    Author     : Volnei
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agenda365- cadastro equipamentos</title>
        <link rel="stylesheet"href="styles/estilos.css">


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
                margin-top: 200px;
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

            <h1>Cadastro de Equipamentos </h1> 
        </header>

        <div class="menu"> 
            <a href="cadastracliente.jsp" >Cliente</a>
            <a href="cadastroequipamento.jsp" class="active">Equipamento</a>
            <a href="cadastraordemservico.jsp">Notificações</a>
        </div>
        <div class='container'>
            <form action="recebeDadosEquipamento.jsp" method="POST">
            <div class="row">
                <div class="col-75">
                    <br />
                    <br />
                    <input type="text" id="infmodelo" name="modelo" placeholder="Digite Modelo" />
                    <input type="text" id="infmarca" name="marca" placeholder="Digite a Marca" />
                    <input type="text" id="infpotenciaBtus" name="potenciaBtus" placeholder="Digite a Potencia em Btus" />
                    <input type="text" id="inflitragem" name="litragem" placeholder="Digite a litragem " />
                    <input type="text" id="inftensao" name="tensao" placeholder="Digite a tensão" />
                    <input type="text" id="infaparelho" name="aparelho" placeholder="Digite o tipo de Aparelho" />
                </div>
            </div> 


            <input type="button" value="Salvar" onclick="enviaForm()" />
            <input type="reset" value="Cancelar" />
            <a href="index.jsp" class= "sair">Sair</a>

        </form>
    </div>



    <script>
        function enviaForm() {              // validação de dados 
            debugger;
            var modelo = document.getElementsByName("modelo"); // coletando dados atravez do name
            if (modelo[0].value === "") {     //se modelo for igual  a vizio   (alert)
                modelo[0].focus();            // se modelo  for igual a zero   (alert)
                alert("Informe o modelo");    //alert pedindo para preencher  o campo modelo
                exit();
            }
            var marca = document.getElementsByName("marca");
            if (marca[0].value === "") {
                marca[0].focus();
                alert("Informe a marca");
                exit();

            }
            var potenciaBtus = document.getElementsByName("potenciaBtus");
            if (potenciaBtus[0].value === "") {
                potenciaBtus[0].focus();
                alert("Informe a potenciaBtus");
                exit();
            }
            var litragem = document.getElementsByName("litragem");
            if (litragem[0].value === "") {
                litragem[0].focus();
                alert("Informe a litragem");
                exit();
            }
            var tensao = document.getElementsByName("tensao");
            if (tensao[0].value === "") {
                tensao[0].focus();
                alert("Informe a tensao");
                exit();

            }
            var aparelho = document.getElementsByName("aparelho");
            if (aparelho[0].value === "") {
                aparelho[0].focus();
                alert("Informe o aparelho");
                exit();
            }
            document.forms[0].submit();     //envia dados para endereço registrado no action
        }

    </script>
</body>   
</html>
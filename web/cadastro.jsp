<%-- 
    Document   : cadastro
    Created on : 4 de jan de 2021, 16:09:43
    Author     : A
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>365</title>

        <style> 
            body {
                background-color: #C4C4C4;
                margin: 0;
            }
            /* Style the header */
            .header {
                background-color:blueviolet;                
                padding: 10px;
                text-align: center;
            }
            /* Style the top navigation bar */
            .topnav {
                overflow: hidden;
                background-color: border-box;
                border-style: ridge;
            }
            /* Navbar links */
            .topnav a {
                float: left;
                display: block;
                color: #2D68DB;
                text-align: center;
                padding: 24px 106px;
                text-decoration: none;
            }
            /* Links - change color on hover */
            .topnav a:hover {
                background-color: #ddd;
                color: #2D68DB;
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
            }

            label {
                padding: 12px 12px 12px 0;
                display: inline-block;
                font-stretch: cursive;
                color: white;
            }

            input[type=submit] {
                background-color: blueviolet;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                float: start;
            }

            input[type=submit]:hover {
                background-color: #2D68DB;
            }
            input[type=reset] {
                background-color: blueviolet;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                float: start;
            }

            input[type=reset]:hover {
                background-color: #2D68DB;
            }

            .container {
                border-radius: 5px;
                background-color: #C4C4C4;
                padding: 20px;

            }

            .col-25 {
                float: left;
                width: 25%;
                margin-top: 6px;
            }

            .col-75 {
                float: left;
                width: 75%;
                margin-top: 6px;
            }

            /* Clear floats after the columns */
            .row:after {
                content: "";
                display: table;
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
        <div class="header">
            <h1> Cadastro de Equipamentos</h1>
        </div>
        <div class="topnav  <hr/>">
            <a href="cadastracliente.jsp">CLIENTE</a>
            <a href="cadastroequipamento.jsp">EQUIPAMENTO</a>
            <a href="cadastraordemservico.jsp">ORDEM DE SERVIÇO</a>
        </div>

        <div class='container'>
            <form action="recebeDadosEquipamento.jsp" method="post">


                <div class="row">
                    <div class="col-25">
                        <label for="inftipo">Informe o Tipo</label>
                    </div>
                    <div class="col-25">
                        <input type="text" id="inftipo" name="tipo" placeholder="Tipo" />
                    </div>
                </div>


                <div class="row">
                    <div class="col-25">
                        <label for="infmarca">Informe a Marca</label>
                    </div>
                    <div class="col-25">
                        <input type="text" id="infmarca" name="marca" placeholder="Marca" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-25">
                        <label for="infmod">Informe o modelo</label>
                    </div>
                    <div class="col-25">
                        <input type="text" id="infmod" name="modelo" placeholder="Modelo" /> 
                    </div>
                </div>

                <div class="row">
                    <div class="col-25">
                        <label for="inftensao">Informe a Tensao</label>
                    </div>
                    <div class="col-25">
                        <select id="inftensao" name="tensao">
                            <option value="110">110 </option>
                            <option value="220">220 </option>

                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col-25">
                        <label for="infvol">Informe o Volume</label>
                    </div>
                    <div class="col-25">
                        <input type="text" id="infvol" name="litragem" placeholder="Volume" />
                    </div>
                </div>


                <div class="row">
                    <div class="col-25">
                        <label for="infpot">Informe a Potência</label>
                    </div>
                    <div class="col-25">
                        <input type="text" id="infpot" name="potencia" placeholder="Potência" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-25">
                        <label for="infobs">Observações</label>
                    </div>
                    <div class="col-75">
                        <textarea id="infobs" name="observacoes" placeholder="Observações..." style="height:80px"></textarea>
                    </div>
                </div>


 <hr />


                <div class="row">
                    <input type="submit" value="Salvar" onclick="enviarForm()"/>
                    <input type="reset" value="Cancelar" />

                </div>

                <hr />
            </form>

        </div>

        <script>
            function enviaForm() {              // validação de dados 

                var modelo = document.getElementsByName("modelo"); // coletando dados atravez do name
                if (modelo[0].value === "") {     //se modelo for igual  a vizio   (alert)
                    modelo[0].focus();            // se modelo  for igual a zero   (alert)
                    // alert("Informe o modelo");    //alert pedindo para preencher  o campo modelo

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
                document.forms[0].submit();      //envia dados para endereço registrado no action
            }

        </script>

    </body>

</html>

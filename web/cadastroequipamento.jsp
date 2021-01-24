<%-- 
    Document   : cadastroequipamentos
    Created on : 30 de out de 2020, 08:34:09
    Author     : entra21
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agenda365- cadastro equipamentos</title>
        <link rel="stylesheet"href="styles/estilos.css">

        <style>

            header {
                background-color: #F1F1F1;
                text-align: center;
                padding: 10px;
            }


            label{
                display: block;
                margin-left: 10px;
                position: absolute;
            }

            div{

                position: absolute;
                width: 1440px;
                height: 904px;
                left: 0px;
                top: 62px;

                background: #C4C4C4;
                border: 1px solid #000000;
                box-sizing: border-box;
            }
            input[type=checkbox]{
                display: block;
                position: absolute;
                margin-left: 130px;
            }
            input[type=button],[type=reset]{
                display: block;
                width: 70px;
                margin-right: auto;
                margin-left: auto;
                margin-top: 10px;
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
            input[type=text][name="modelo"]{
                position: absolute;
                 background-image: url('searchicon.png');
                width: 480px;
                height: 58px;
                left: 240px;
                top: 316px;

                background: #FFFFFF;
                border: 1px solid #000000;
                box-sizing: border-box;
            }
            input[type=text][name="litragem"]{
                position: absolute;
                width: 374px;
                height: 66px;
                left: 957px;
                top: 412px;

                background: #FFFFFF;
                border: 1px solid #000000;
                box-sizing: border-box;
            }


        </style>
    </head>
    <body>

        <header>
            <script src="scripts/cabecalho.js"></script>  
            <h3>Cadastro de Equipamentos </h3>  
        </header>

        <nav>
            <script src="scripts/menu.js"></script>
        </nav>

        <section>
            <form action="recebeDadosEquipamento.jsp" method="post">
          
                    <br />
                <label>Informe o modelo</label>
                <input type="text" name="modelo" /> 

                <br />
                <label>Informe a marca</label>
                <input type="text" name="marca" />

                <br />
                <label>Informe a potenciaBtus</label>
                <input type="text" name="potenciaBtus" />

                <br />
                <label>Informe litragem</label>
                <input type="text" name="litragem" />

                <br />
                <label>Informe tensao</label>
                <input type="text" name="tensao" />

                <br />
                <label>Informe o aparelho</label>
                <input type="text" name="aparelho">                  

                <hr />
                <input type="button" value="Salvar" onclick="enviaForm()" />
                <input type="reset" value="Cancelar" />
               
            </form>

        </section>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>
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

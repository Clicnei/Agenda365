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

            label{
                display: block;
                margin-left: 10px;
                position: absolute;
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
            input[type=text]:focus{
                background-color: white;      
            }
            input[type=text]{
                position: relative;
                background-color: silver;
                margin-left: 130px;
                width: 250px;
            }
        </style>
    </head>
    <body>

        <header>
            <script src="scripts/cabecalho.js"></script>  
        </header>
        <section>
            <nav>
                <script src="scripts/menu.js"></script>
            </nav>
            <article>
                <h1>Cadastro equipamentos</h1>
                <hr />
            </article>

            <form action="recebeDadosCarro.jsp" method="POST">
                <div
                    
                    <label>Informe id</label>
                    <input type="text" name="id" /> 
                    
                    <br />
                    <label>Informe a modelo</label>
                    <input type="text" name="modelo" /> 
                    
                    <br />
                    <label>Informe a marca</label>
                    <input type="text" name="marca" />

                    <br />
                    <label>Informe potenciaBtus</label>
                    <input type="text" name="modelo" />

                    <br />
                    <label>Informe litragem</label>
                    <input type="text" name="km" />
                    
                    <hr />
                    <input type="button" value="Salvar" onclick="enviaForm()" />
                    <input type="reset" value="Cancelar" onclick="enviaForm()" />
                </div> 
            </form>
        </article>
    </section>
    <footer>
        <script src="scripts/rodape.js"></script>
    </footer>
    <script>
                        function enviaForm() {
                            var id = document.getElementsByName("id");
                            if (id[0].value === "") {
                                id[0].focus();
                                alert("Informe id");
                                exit();
                            }

                            var marca = document.getElementsByName("modelo");
                            if (modelo[0].value === "") {
                                modelo[0].focus();
                                alert("Informe o modelo");
                                exit();
                            }

                            var marca = document.getElementsByName("marca");
                            if (marca[0].value === "") {
                                marca[0].focus();
                                alert("Informe a marca");
                                exit();

                            }



                            var modelo = document.getElementsByName("potenciaBtus");
                            if (modelo[0].value === "") {
                                modelo[0].focus();
                                alert("Informe a potenciaBtus");
                                exit();
                            }


                            var litragem = document.getElementsByName("litragem");
                            if (litragem[0].value === "") {
                                litragem[0].focus();
                                alert("Informe a litragem");
                                exit();
                            }

                            document.forms[0].submit();
                        }
    </script>
</body>   
</html>

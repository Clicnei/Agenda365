<%-- 
    Document   : evento
    Created on : 21/01/2021, 00:51:41
    Author     : A
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agenda365- cadastro eventos</title>
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
                width: 420px;
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
                margin-left: 165px;
                width: 250px;
            }
        </style>
    </head>
    <body>

        <header>
            < src="s/cabecalho.js"></>  
        </header>
        <section>
            <nav>
                < src="s/menu.js"></>
            </nav>
            <article>
                <h1>Cadastro eventos</h1>
                <hr />
            </article>

            <form action="recebeDadosEventos.jsp" method="POST">
                <div
                    
                   
                    
                    <br />
                    <label>Informe o titulo</label>
                    <input type="text" name="titulo" /> 
                    
                    <br />
                    <label>Informe a criticidadade</label>
                    <input type="text" name="criticidade" />

                    <br />
                    <label>Informe a dataInicio</label>
                    <input type="text" name="dataInicio" />

                    <br />
                    <label>Informe a dataFim</label>
                    <input type="text" name="dataFim" />
                    
                    <br />
                    
                    
                    
                    <hr />
                    <input type="button" value="Salvar" onclick="enviaForm()" />
                    <input type="reset" value="Cancelar" onclick="enviaForm()" />
                </div> 
            </form>
        </article>
    </section>
    <footer>
        < src="s/rodape.js"></>
    </footer>
    <>
        
        //Função de cadastro de evento
                        function enviaForm() {
                          /*  var id = document.getElementsByName("id");//envia para o atributo na posição 0 o valor, cadastrado
                            if (id[0].value === "") {
                                id[0].focus();
                                alert("Informe id");
                                exit();
                            }
                        */
                            var titulo = document.getElementsByName("titulo");
                            if (titulo[0].value === "") {
                                titulo[0].focus();
                                alert("Informe o titulo");
                                exit();
                            }

                            var criticidade = document.getElementsByName("criticidade");
                            if (criticidade[0].value === "") {
                                criticidade[0].focus();
                                alert("Informe a criticidade");
                                exit();
                            }

                            var dataInicio = document.getElementsByName("dataInicio");
                            if (dataInicio[0].value === "") {
                                dataInicio[0].focus();
                                alert("Informe a dataInicio");
                                exit();
                            }

                            var dataFim = document.getElementsByName("dataFim");
                            if (dataFim[0].value === "") {
                                dataFim[0].focus();
                                alert("Informe a dataFim");
                                exit();
                            }

                            
                            document.forms[0].submit();
                        }
    </>
</body>   
</html>

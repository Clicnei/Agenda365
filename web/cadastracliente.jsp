<%-- 
    Document   : cadastracliente
    Created on : 9 de nov de 2020, 10:28:34
    Author     : entra21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agenda365 - Cadastro cliente</title>
        <link rel="stylesheet" href="styles/estilos.css"> 
        <style>

            input[type=checkbox]{
                display: block;
                position: absolute;
                margin-left: 120px;
            }        
            input[type=button],[type=reset]{
                display:block;
                width: 60px;
                margin-left: auto;
                margin-right: auto;
                margin-top: 10px
            }
            input[type=text]:focus{
                background-color: white;

            }
            input[type=text]{
                position: relative;
                background-color: silver;
                margin-left: 180px;
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
        <h1>Cadastro de cliente</h1>
        <hr />
        <form action="recebeDadosCliente.jsp" method="POST">
            <label>Informe o nome</label>
            <input type="text" name="nome" /> 

            <br />
            <label>Informe o cpf</label>
            <input type="text" name="cpf" />

            <br />
            <label>Informe o cnpj</label>
            <input type="text" name="cnpj" />

            <br />
            <label>Informe o fone</label>
            <input type="text" name="fone" />

            <br />
            <label>Informe o fonefixo</label>
            <input type="text" name="fonefixo" />

            <br />
            <label>Informe a rua</label>
            <input type="text" name="rua" />

            <br />
            <label>Informe o numero</label>
            <input type="text" name="numero" />

            <br />
            <label>Informe o complemento</label>
            <input type="text" name="complemento" />

            <br />
            <label>Informe o bairro</label>
            <input type="text" name="bairro" />

            <br />
            <label>Informe o cep</label>
            <input type="text" name="cep" />

            <br />
            <label>Informe a cidade</label>
            <input type="text" name="cidade" />

            <br />
            <label>Informe o estado</label>
            <input type="text" name="estado" />


            <hr />
            
            <input type="submit" value="Gravar"/>
            
            <input type="button" value="Salvar" onclick="enviaForm()" />
            <input type="reset" value="Cancelar" onclick="enviaForm()" />
        </form>
    </body>
</html>
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

                    var nome = document.getElementsByName("nome");
                    if (nome[0].value === "") {
                        nome[0].focus();
                        alert("Informe o nome");
                        exit();
                    }

                    var cpf = document.getElementsByName("cpf");
                    if (cpf[0].value === "") {
                        cpf[0].focus();
                        alert("Informe o cpf");
                        exit();
                    }

                    var cnpj = document.getElementsByName("cnpj");
                    if (cnpj[0].value === "") {
                        cnpj[0].focus();
                        alert("Informe o cnpj");
                        exit();
                    }

                    var fone = document.getElementsByName("fone");
                    if (fone[0].value === "") {
                        fone[0].focus();
                        alert("Informe o fone");
                        exit();
                    }

                    var foneFixo = document.getElementsByName("fonefixo");
                    if (foneFixo[0].value === "") {
                        fonefixo[0].focus();
                        alert("Informe o fone fixo");
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

                    var complemento = document.getElementsByName("complemento");
                    if (complemento[0].value === "") {
                        complemento[0].focus();
                        alert("Informe o complemento");
                        exit();
                    }

                    var bairro = document.getElementsByName("bairro");
                    if (bairro[0].value === "") {
                        bairro[0].focus();
                        alert("Informe o bairro");
                        exit();
                    }

                    var cep = document.getElementsByName("cep");
                    if (cep[0].value === "") {
                        cep[0].focus();
                        alert("Informe o cep");
                        exit();
                    }

                    var cidade = document.getElementsByName("cidade");
                    if (cidade[0].value === "") {
                        cidade[0].focus();
                        alert("Informe a cidade");
                        exit();
                    }

                    var estado = document.getElementsByName("estado");
                    if (estado[0].value === "") {
                        estado[0].focus();
                        alert("Informe o estado");
                        exit();
                    }


                    document.forms[0].submit();
                }
</script>
</body>   
</html>

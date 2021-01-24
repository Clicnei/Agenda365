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
        <title>Cadastro cliente</title>
        <link href="styles/estilos.css" type="text/css"/>
        <style>

            input.button{
                width: 10px;
            }
            img{
                display: block;
                position: relative;
                margin-left: auto;
                margin-right: auto;
                width: 500px;
                height: 300px;
            }
            hr{
                margin: 30px;
                height: 10px;
                background-color: cornflowerblue;
            }

        </style>
    </head>
    <body>
        
            <h1>Cadastro de Clientes</h1>

            <section>
                <nav>
                    <%-- < src="s/menu.js"></>--%>
                </nav>


                <form action="recebeDadosCliente.jsp" method="POST">
                    <div>
                        <label for="PessoaFisica">Pessoa Fisica</label>
                        <input type="radio" name="isPessoaFisica" id="isPessoaFisica" onclick="changePessoaFisica()"/>
                        <label for="PessoaJuridica">Pessoa Juridica</label>
                        <input type="radio" name="PessoaJuridica" id="pessoaJuridica" onclick="changePessoaJuridica()"/>
                        <br /><!-- comment -->

                        <label>Informe o nome</label>
                        <input type="text" name="nome" /> 

                        <br />
                        <div id="divCpf">
                            <label>Informe o cpf</label>
                            <input type="text" name="cpf" />
                            <br />
                        </div>

                        <div id="divCnpj">
                            <label>Informe o cnpj</label>
                            <input type="text" name="cnpj" />
                            <br />
                        </div>

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

                        <br />
                        <label>Informe o telefoneFixo</label>
                        <input type="text" name="telefoneFixo" />


                        <br />
                        <label>Informe o telefoneCelular</label>
                        <input type="text" name="telefoneCelular" />


                        <br />
                        <label>Informe o email</label>
                        <input type="text" name="email" />

                        <hr />

                        <input class="button" type="button" value="Salvar" onclick="enviaForm()" />
                        <input class="button" type="reset" value="Cancelar" onclick="enviaForm()" />
                    </div>

                </form>
               
            </section>
            <footer>
                <%--< src="s/rodape.js"></>--%>

            </footer>



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
                    /*var id = document.getElementsByName("id");
                     if (id[0].value === "") {
                     id[0].focus();
                     alert("Informe id");
                     exit();
                     }*/

                    debugger;
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

                    var telefoneFixo = document.getElementsByName("telefoneFixo");
                    if (telefoneFixo[0].value === "") {
                        telefoneFixo[0].focus();
                        alert("Informe o telefone Fixo");
                        exit();
                    }

                    var telefoneCelular = document.getElementsByName("telefoneCelular");
                    if (telefoneCelular[0].value === "") {
                        telefoneCelular[0].focus();
                        alert("Informe o telefone Celular");
                        exit();

                    }
                    var email = document.getElementsByName("email");
                    if (email[0].value === "") {
                        email[0].focus();
                        alert("Informe o email");
                        exit();
                    }

                    document.forms[0].submit();
                }
            </script>
    </body>   
</html>



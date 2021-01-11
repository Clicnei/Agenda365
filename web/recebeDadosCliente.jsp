<%-- 
    Document   : recebeDadosCarro
    Created on : 30 de out de 2020, 09:08:39
    Author     : entra21
--%>

<%@page import="modelos.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recebe Dados Cliente</title>
    </head>
    <body>
        <script src="scripts/menu.js"></script>
        <h1>Recebe Dados Cliente</h1>
               
        
        <%
          //recebe os valores da tela HTML  
          String nome = request.getParameter("nome");
          String cpf = request.getParameter("cpf");
          String cnpj = request.getParameter("cnpj");
          String email = request.getParameter("email");
          String fone = request.getParameter("fone");
          String fonefixo = request.getParameter("fonefixo");
          String rua = request.getParameter("rua");
          String numero = request.getParameter("numero");
          String complemento = request.getParameter("complemento");
          String bairro = request.getParameter("bairro");
          String cep = request.getParameter("cep");
          String cidade = request.getParameter("cidade");
          String estado = request.getParameter("estado");
          
          
          
          
          //instancia o cliente
          Cliente cliente = new Cliente();
          //cliente.setId(id);
          cliente.setNome(nome);
          cliente.setCpf(cpf);
          cliente.setCnpj(cnpj);
          cliente.setEmail(email);
          cliente.setFone(fone);
          cliente.setFonefixo(fonefixo);
          cliente.setRua(rua);
          cliente.setNumero(numero);
          cliente.setComplemento(complemento);
          cliente.setBairro(bairro);
          cliente.setCep(cep);
          cliente.setCidade(cidade);
          cliente.setEstado(estado);
         
         
          if(cliente.salvar()){
              out.write("Cliente salvo com sucesso");
          }
          else
          {
              out.write("Problemas ao salvar Cliente");
          }
          
        %>
        
        
             }
             }   
        </script>
        
    </body>
</html>

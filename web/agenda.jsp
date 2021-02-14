<%-- 
   Agenda(calendário) - 02/02 - Erikson

--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="modelos.Agendamento"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Cliente"%>
<!DOCTYPE html>
<html lang='pt-br'>
    <head>
        <meta charset='utf-8' />
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.1/main.css" />
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.1/main.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.1/locales/pt-br.js"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--<link rel="stylesheet" href="styles/estilos.css">-->
        <%
            Agendamento agendamento = new Agendamento();
            Gson gson = new Gson();
            List<Agendamento> agendamentos = agendamento.consultar();            
            request.setAttribute("agendamentos", gson.toJson(agendamentos));
        %>
        <script> 
            var events = '<%=(request.getAttribute("agendamentos"))%>';
            var eventos = JSON.parse(events);
            var mapping = eventos.map(item => 
                new Object({
                    title: item.tipo,
                    start: '2020-02-07T09:00',
                    end: '2020-02-07T10:30'
                })   
            );
            document.addEventListener('DOMContentLoaded', function () {
                var calendarEl = document.getElementById('calendar');
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    headerToolbar: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
                    },
                    locale: 'pt-br',
                    initialView: 'dayGridMonth',
                    showNonCurrentDates: false,
                    buttonText: {
                        today: 'Hoje',
                        month: 'Mes',
                        week: 'Semana',
                        day: 'Dia',
                        list: 'Lista'
                    },
                    initialDate: '2020-02-01',
                    navLinks: true, // can click day/week names to navigate views
                            // businessHours: true, // display business hours
                            //editable: true,
                            //selectable: true,   
                    events: mapping
                });
                calendar.render();
            });
        </script>

        <style>

            body {
                background-image: linear-gradient(cornflowerblue, lightblue);               
            }

            /*Estilo do calendário*/
            #top {
                background: #eee;
                border-bottom: 1px solid #ddd;
                padding: 0 10px;
                line-height: 40px;
                font-size: 12px;
            }

            #calendar {
                max-width: 900px;
                margin-left: 380px;
                font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
                font-size: 12px;
                margin-top: 30px

            }

            /*Estilo dos botões*/
            .dropbtn {
                background-color: #4682B4;
                color: white;
                font-weight: bolder;
                padding: 12px 30px;
                font-size: 16px;
                border: none;
                cursor: pointer;
                border-radius: 15px;
                margin-top: 10px;                
                margin-bottom: 140px;
                text-align: center;
            }

            .dropdown {
                position: relative;
                display: block;
                float: left;
                clear: both;
                font-family: verdana;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                width: 200px;
                z-index: 1;
            }

            .dropdown-content a {
                color: white;
                background-color: #4682B4;
                padding: 8px 15px;
                text-decoration: none;
                display: block;
                border-radius: 15px;
                margin-bottom: 15px;
                margin-top: 12px;
                margin-left: 15px;
                text-align: center;
                font-family: verdana;
                font-weight: bolder;
                font-size: 14px;
            }

            .dropdown:hover .dropdown-content {
                display: inline-block;
            }

            .dropdown:hover .dropbtn {
                background-color: #5F9EA0;
            }

            .modal-body {
                background-color: #4682B4;
                color: white;
                font-weight: bolder;
                padding: 12px 20px;
                font-size: 16px;
                border: none;
                cursor: pointer;
                border-radius: 15px;                
            } 

        </style>    
    </head>

    <body>
        <div class="dropdown">
            <button class="dropbtn">Cadastrar</button>
            <div class="dropdown-content">
                <a href="cadastracliente.jsp"> <i class="material-icons">&#xe7fd;</i>Cliente</a>
                <a href="cadastroequipamento.jsp"> <i class="material-icons">&#xe63c;</i> Equipamento</a>
                <a href="cadastraordemservico.jsp"> <i class="material-icons">&#xe85d;</i> Ordem de Serviço</a>
            </div>
        </div>

        <div class="dropdown">
            <button class="dropbtn">Consultar</button>
            <div class="dropdown-content">
                <a href="consultacliente.jsp"> <i class="material-icons">&#xe7fd;</i> Cliente</a>
                <a href="consultaequipamento.jsp"> <i class="material-icons">&#xe63c;</i> Equipamento</a>
                <a href="consultaordemservico.jsp"> <i class="material-icons">&#xe85d;</i> Ordem de Serviço</a>
            </div>
        </div>

        <div class="dropdown">
            <button class="dropbtn">Notificações</button>
            <div class="dropdown-content">
                <a href="index.html"> <i class="material-icons">&#xe52e;</i>Index</a>
            </div>
        </div>
       
    </div>


    <%--<div id='calendar'></div>--%>    

    <div class="container">
        <div id='calendar' class="mt-4 mb-4"></div>
    </div>

    <div class="modal fade" id="modalExemplo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <!--<h5 class="modal-title" id="exampleModalLabel">Criar Evento</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                        <span aria-hidden="true">&times;</span>-->                            
                </div>
                <div class="modal-body">
                    <input type="button" onclick="cadastroEvento()" value="Criar Evento">
                </div>
            </div>
        </div>

        <div id='top'>

            <div id='calendar'></div>

            <dialog id="modalCadastroEvento">
                <div>
                    <form action="recebeDadosAgendamento.jsp" method="POST">
                        <div>
                            <label>Cliente</label>
                            <select>
                                <%
                                    Cliente cliente = new Cliente();
                                    List<Cliente> clientes = cliente.consultar();
                                %> 
                            </select>
                            <%--  <option>Erikson</option>
                                                <option>Lene</option>
                                                <option>Rafael</option>
                                                <option>Volnei</option>
                                            </select>--%>
                            <br />
                            <label>Equipamento</label>
                            <select>

                                <option>Ar-Condicionado</option>
                                <option>Geladeira</option>
                                <option>Microondas</option>
                                <option>Máquina de Lavar</option>  
                            </select>

                            <br />
                            <label>Serviço</label>
                            <select>
                                <option>Orçamento</option>
                                <option>Manutenção</option>
                                <option>Coleta</option>
                                <option>Entrega</option>  
                            </select>

                            <br />
                            <label>Criticidadade</label>
                            <select>
                                <option>Alta</option>
                                <option>Media</option>
                                <option>Baixa</option> 
                            </select>

                            <br />
                            <label>Data Inicio</label>
                            <input type="datetime-local" name="dataInicio" />

                            <br />
                            <label>Data Fim</label>
                            <input type="datetime-local" name="dataFim" />

                            <br />

                            <hr />
                            <div style="text-align: right">
                                <input type="reset" value="Cancelar" onclick="fechar modal()" />
                                <input type="button" value="Salvar" onclick="enviaForm()" />
                            </div>

                        </div> 
                    </form>
                </div>
            </dialog>
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script type="text/javascript">
                                    function cadastroEvento() {
                                        document.getElementById("modalCadastroEvento").show();
                                    }
    </script>
</body>


</html>



<%--  h2{
    position: absolute;
    width: 250px;
    height: 50px;                   ATENÇÃO
    left: 1230px;        NAO USAR DÁ CONFLITO COM O CALENDARIO
    top: 300px;

            }--%>



<%--
<body>

    <div class="main">
        <div class="dropdown">
            <div class="modal-body">
                <input type="button" onclick="cadastrarEvento()" value="Criar Evento"/>
                <div class="dropdown-content">

                </div>
            </div>

        </div>

    </div>


    <div id='top'>

        <div id='calendar'></div>

        <dialog id="modalCadastroEvento">
            <div>
                <form action="recebeDadosEventos.jsp" method="POST">
                    <div>
                        <label>Cliente</label>
                        <select>
                            <option>Erikson</option>
                            <option>Lene</option>
                            <option>Rafael</option>
                            <option>Volnei</option>
                        </select>
                        <br />
                        <label>Equipamento</label>
                        <select>
                            <option>Ar-Condicionado</option>
                            <option>Geladeira</option>
                            <option>Microondas</option>
                            <option>Máquina de Lavar</option>  
                        </select>

                        <br />
                        <label>Serviço</label>
                        <select>
                            <option>Orçamento</option>
                            <option>Manutenção</option>
                            <option>Coleta</option>
                            <option>Entrega</option>  
                        </select>

                        <br />
                        <label>Criticidadade</label>
                        <select>
                            <option value="Alta">Alta</option>
                            <option>Media</option>
                            <option>Baixa</option> 
                        </select>

                        <br />
                        <label>Data Inicio</label>
                        <input type="datetime-local" name="dataInicio" />

                        <br />
                        <label>Data Fim</label>
                        <input type="datetime-local" name="dataFim" />

                        <br />

                        <hr />
                        <div style="text-align: right">
                            <input type="reset" value="Cancelar" onclick="fecharModal()" />
                            <input type="button" value="Salvar" onclick="enviaForm()" />
                        </div>

                    </div> 
                </form>
            </div>
        </dialog>
--%>
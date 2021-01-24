<%-- 
    Document   : agenda
    Created on : 4 de jan de 2021, 16:09:14
    Author     : A
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset='utf-8' />
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.1/main.min.css" rel='stylesheet' />
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.1/main.min.js"></script>



<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      initialDate: '2020-09-12',
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      selectable: true,
      events: [
        {
          title: 'Business Lunch',
          start: '2020-09-03T13:00:00',
          constraint: 'businessHours'
        },
        {
          title: 'Meeting',
          start: '2020-09-13T11:00:00',
          constraint: 'availableForMeeting', // defined below
          color: '#257e4a'
        },
        {
          title: 'Conference',
          start: '2020-09-18',
          end: '2020-09-20'
        },
        {
          title: 'Party',
          start: '2020-09-29T20:00:00'
        },

        // areas where "Meeting" must be dropped
        {
          groupId: 'availableForMeeting',
          start: '2020-09-11T10:00:00',
          end: '2020-09-11T16:00:00',
          display: 'background'
        },
        {
          groupId: 'availableForMeeting',
          start: '2020-09-13T10:00:00',
          end: '2020-09-13T16:00:00',
          display: 'background'
        },

        // red areas where no events can be dropped
        {
          start: '2020-09-24',
          end: '2020-09-28',
          overlap: false,
          display: 'background',
          color: '#ff9f89'
        },
        {
          start: '2020-09-06',
          end: '2020-09-08',
          overlap: false,
          display: 'background',
          color: '#ff9f89'
        }
      ]
    });

    calendar.render();
  });
  
  function cadastrarEvento(){
    document.getElementById("modalCadastroEvento").showModal();
  }
  
  function fecharModal(){
      document.getElementById("modalCadastroEvento").close();
  }
  
  function enviaForm(){
      alert("Você clicou em enviarForm");
  }
  
</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body>

      <div class="modal-body">
        <input type="button" onclick="cadastrarEvento()" value="Criar Evento"/>
          
      </div>
    <div id='calendar'>
          
    </div>
    
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
</body>
</html>






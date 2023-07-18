<%@page import="Classes.Consulta"%>
<%@page import="Classes.Paciente"%>
<%@page import="Classes.Medico"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
  <title>Agendamneto de Consulta</title>
  <meta charset="utf-8"/>
  <script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="crossorigin="anonymous" ></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
  <script src="controller.js"> </script>
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <!-- Latest compiled and minified JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
</head>

<body  ng-controller="myCtrl">
  <div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title"><center>AGENDAMENTO DE CONSULTAS</center></h3>
    </div>
    <div class="panel-body">
        <form action="RecebeDadosConsulta.jsp" method="POST">

        <div class="row">
          <div class="col-md-12">
            <h3>Dados do Agendamento</h3>
          </div>
            
                <!<!-- MENSAGEM DE RETORNO DE EXECUÇÃO  -->
                <label class="cabecalho" id="msg"> 
                        <%
                            if(request.getParameter("pmensagem") != null)         
                                out.write(request.getParameter("pmensagem"));
                        %>
                </label>
                
                <!<!-- captura para campo select da tela  -->
                <%
                Paciente pac = new Paciente();
                List<Paciente> lovPacientes = pac.consultarTodosPacientes();
                Medico med = new Medico();
                List<Medico> lovMedicos = med.consultarTodosMedicos();
                %>       

                <!<!-- PACIENTE -->
                
                    <div class="form-group col-md-3">
                        <label for="cod_paci">Paciente</label>
                        <select class="form-control" required="required" name="cod_paci">
                            <%for(Paciente p: lovPacientes){ %>
                                <option value="<%out.write(""+ p.getCod_Paci());%>">
                                               <% out.write(p.getNome_Paci()); %>
                                </option>
                            <%}%>
                        </select>
                    </div>
                
               
                
                <!<!-- MEDICO -->
                        <div class="form-group col-md-3">
                        <label for="cod_med">Médico</label>
                        <select class="form-control" required="required" name="cod_med">
                            <%for(Medico m: lovMedicos){ %>
                                <option value="<%out.write(""+ m.getCod_Med());%>">
                                               <% out.write(m.getNome_Med()); %>
                                </option>
                            <%}%>
                        </select> 
                        </div>
<!--          <div class="form-group col-md-3">
            <input name="nome_paci" type="text" class="form-control" placeholder="Paciente" ng-model="consulta.codpaci"/>
          </div>

          <div class="form-group col-md-3">
            <input name="nome_med" type="text" class="form-control" placeholder="Médico" ng-model="consulta.codmed"/>
          </div>-->
          
          <div class="form-group col-md-3">
            <label for="data_consulta">Data da Consulta</label>
            <input name="data_consulta" type="date" required="required" class="form-control" placeholder="Data da Consulta" ng-model="consulta.dataconsulta"/>
          </div>
          
          <div class="form-group col-md-3">
            <label for="horario_consulta">Horário da Consulta</label>
            <input name="horario_consulta" type="time" required="required" class="form-control" placeholder="Horário" ng-model="consulta.horario"/>
          </div>
            
          <div class="form-group col-md-3">
            <label for="fone_paciente">Telefone do Paciente</label>
            <input name="fone_paciente" type="tel" maxlength="15" required="required" onkeypress="$(this).mask('(00) 00000-0000')" class="form-control" placeholder="Telefone do Paciente" ng-model="consulta.fonepaci"/>
          </div>
        </div>
      
          <div class="row">
                   <div class="form-group col-md-1">
                       <input type="submit" value="Cadastrar" class="btn btn-primary "/>
                   </div>
                   <div class="form-group col-md-1">                                 
                       <input type="reset"  value="Cancelar" class="btn btn-danger"/>                        
                   </div>
               </div>
        </form>
  </div>
</body>

</html>

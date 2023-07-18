<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Classes.Paciente"%>
<%@page import="Classes.Medico"%>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
  <title>Anamnese</title>
  <meta charset="utf-8"/>
  <script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="crossorigin="anonymous" ></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
  <script src="controller.js"> </script>
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <!-- Latest compiled and minified JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> 
</head>

<body  ng-controller="myCtrl">
  <div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title"><center>CADASTRA ANAMNESE</center></h3>
    </div>
    <div class="panel-body">
        <form action="RecebeDadosAnamnese.jsp" method="POST">

            <div class="row">
                <div class="col-md-12">
                    <h3>Dados da Anamnese</h3>
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
                <!<!-- DATA -->

                <div class="form-group col-md-3">
                    <label for="data_consulta">Data Consulta</label>
                    <input name="data_consulta" type="date" required="required" class="form-control" placeholder="Data da Consulta" ng-model="consulta.codpaci"/>
                </div>

                <!<!-- DESCRICAO -->
                <div class="form-group col-md-10">
                  <label for="descricao">Descrição do Médico</label>
                  <input name="descricao" type="text" required="required" maxlength="200"  class="form-control" placeholder="Descrição" ng-model="anamnese.descricao"/>
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
            </div>
        </form>
        </div>
    </div>
  </div>
</body>

</html>

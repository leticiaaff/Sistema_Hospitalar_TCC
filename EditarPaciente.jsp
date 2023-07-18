<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Classes.Paciente"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <script
        src="https://code.jquery.com/jquery-3.2.1.js"
        integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
        crossorigin="anonymous" ></script>

        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>

        <script src="controller.js"> </script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
    </head>
    
   <body  ng-controller="myCtrl">

        <%
            int paciente = Integer.parseInt(request.getParameter("cod_paci"));
            Paciente p = new Paciente();
            p = p.consultarPaciente(paciente);
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String dtNascimento = sdf.format(p.getData_Nasc_Paci());
                        

        %>
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><center>EDITAR PACIENTE</center></h3>
            </div>

            <div class="panel-body">
              <form action="RecebeEditaPaciente.jsp" method="POST">
                <div class="row">

                        <div class="col-md-12">
                          <h3>Dados Pessoais </h3>
                        </div>

                        <div class="form-group col-md-3" >
                            <label for="cod_paci">Código do Pacienre</label>
                              <input id="cod_Paci" name="cod_paci" type="text" class="form-control" placeholder="Código do Paciente" readonly="readonly" value="<%out.write("" +p.getCod_Paci());%>"/>
                            </div> 

                        <div class="form-group col-md-3">
                            <label for="nome_paci">Nome do Paciente</label>
                          <input type="text"   name="nome_paci" class="form-control" placeholder="Nome"  maxlength="100" required="required" ng-model="paciente.nome" value="<%out.write("" +p.getNome_Paci());%>"/>
                        </div>

                        <div class="form-group col-md-3">
                            <label for="sexo_paci">Sexo do Paciente</label>
                          <select class="form-control" name="sexo_paci" required="required" ng-model="paciente.sexo" >
                            <option value="" >Sexo</option>
                             <option value="M" <% if ("M".equals(p.getSexo_Paci())) {%>selected <% } %> >Masculino</option>
                             <option value="F"<% if ("F".equals(p.getSexo_Paci())) {%>selected <% } %> >Feminino</option>
                          </select>
                        </div>

                        <div class="form-group col-md-3">
                            <label for="data_nasc_paci">Data de Nascimento</label>
                          <input type="date" name="data_nasc_paci" class="form-control" placeholder="Data de Nascimento" required="required" ng-model="paciente.datanascpaci" value="<%out.write("" +p.getData_Nasc_Paci());%>"/>
                        </div>

                        <div class="form-group col-md-3">
                            <label for="cpf_paci">CPF do Paciente</label>
                          <input type="text" name="cpf_paci" class="form-control" placeholder="Cpf" maxlength="14"  required="required" onkeypress="$(this).mask('000.000.000-00');" ng-model="paciente.cpf" value="<%out.write("" +p.getCpf_Paci());%>"/>
                        </div>

                         <div class="form-group col-md-3">
                             <label for="rg_paci">RG do Paciente</label>
                          <input type="text" name="rg_paci" class="form-control" placeholder="RG" maxlength="9" required="required" onkeypress="$(this).mask('0.000.000');" ng-model="paciente.rg" value="<%out.write("" +p.getRG_Paci());%>"/>
                        </div>

                        <div class="form-group col-md-3">
                            <label for="email_paci">E-mail do Paciente</label>
                          <input type="text" name="email_paci" class="form-control" placeholder="E-mail" maxlength="100" ng-model="paciente.email" value="<%out.write("" +p.getEmail_Paci());%>"/>
                        </div>

                        <div class="form-group col-md-3" >
                            <label for="fone_paci">Telefone do Paciente</label>
                          <input type="text" name="fone_paci" class="form-control" placeholder="Telefone do Paciente" maxlength="15" required="required"  onkeypress="$(this).mask('(00) 00000-0000')" ng-model="paciente.telefonepaci" value="<%out.write("" +p.getFone_Paci());%>"/>
                        </div>

                        <div class="form-group col-md-3" >
                            <label for="fone_resp">Telefone do Responsável</label>
                          <input type="text"  name="fone_resp" class="form-control" placeholder="Telefone do Responsável"  maxlength="15"  onkeypress="$(this).mask('(00) 00000-0000')" ng-model="paciente.telefoneresp" value="<%out.write("" +p.getFone_Resp());%>"/>
                        </div>

                        <div class="col-md-12">
                          <h3>Endereço </h3>
                        </div>

                        <div class="form-group col-md-3">
                            <label for="cidade_paci">Cidade do Paciente</label>
                          <input type="text" name="cidade_paci" class="form-control" placeholder="Cidade" maxlength="45"  required="required" ng-model="paciente.cidade" value="<%out.write("" +p.getCidade_Paci());%>"/>
                        </div>

                        <div class="form-group col-md-3">
                            <label for="bairro_paci">Bairro do Paciente</label>
                          <input type="text" name="bairro_paci" class="form-control" placeholder="Bairro" maxlength="255" required="required" ng-model="paciente.bairro" value="<%out.write("" +p.getBairro_Paci());%>"/>
                        </div>

                        <div class="form-group col-md-3">
                            <label for="cep_paci">CEP do Paciente</label>
                          <input type="text" name="cep_paci" class="form-control" placeholder="CEP" maxlength="10" required="required" onkeypress="$(this).mask('00.000-000')"   ng-model="paciente.endereco.cep" value="<%out.write("" +p.getCep_Paci());%>"/>
                        </div>

                        <div class="form-group col-md-3">
                            <label for="estado_paci">Estado do Paciente</label>
                          <select class="form-control" name="estado_paci" required="required"  ng-model="paciente.uf" value="<%out.write("" +p.getEstado_Paci());%>">
                            <option value="">UF</option>
                            <option value="0" <% if ("M".equals(p.getEstado_Paci())) {%>selected <% } %> >AC</option>
                            <option value="1" <% if ("1".equals(p.getEstado_Paci())) {%>selected <% } %> >AL</option>
                            <option value="2" <% if ("2".equals(p.getEstado_Paci())) {%>selected <% } %> >AP</option>
                            <option value="3" <% if ("3".equals(p.getEstado_Paci())) {%>selected <% } %> >AM</option>
                            <option value="4" <% if ("4".equals(p.getEstado_Paci())) {%>selected <% } %> >BA</option>
                            <option value="5" <% if ("5".equals(p.getEstado_Paci())) {%>selected <% } %> >CE</option>
                            <option value="6" <% if ("6".equals(p.getEstado_Paci())) {%>selected <% } %> >DF</option>
                            <option value="7" <% if ("7".equals(p.getEstado_Paci())) {%>selected <% } %> >ES</option>
                              <option value="8" <% if ("8".equals(p.getEstado_Paci())) {%>selected <% } %> >GO</option>
                              <option value="9" <% if ("9".equals(p.getEstado_Paci())) {%>selected <% } %> >MA</option>
                              <option value="10" <% if ("10".equals(p.getEstado_Paci())) {%>selected <% } %> >MT</option>
                              <option value="11" <% if ("11".equals(p.getEstado_Paci())) {%>selected <% } %> >MS</option>
                              <option value="12" <% if ("12".equals(p.getEstado_Paci())) {%>selected <% } %> >MG</option>
                              <option value="13" <% if ("13".equals(p.getEstado_Paci())) {%>selected <% } %> >PA</option>
                              <option value="14" <% if ("14".equals(p.getEstado_Paci())) {%>selected <% } %> >PB</option>
                              <option value="15" <% if ("15".equals(p.getEstado_Paci())) {%>selected <% } %> >PR</option>
                              <option value="16" <% if ("16".equals(p.getEstado_Paci())) {%>selected <% } %> >PE</option>
                              <option value="17" <% if ("17".equals(p.getEstado_Paci())) {%>selected <% } %> >PI</option>
                              <option value="18" <% if ("18".equals(p.getEstado_Paci())) {%>selected <% } %> >RJ</option>
                              <option value="19" <% if ("19".equals(p.getEstado_Paci())) {%>selected <% } %> >RN</option>
                              <option value="20" <% if ("20".equals(p.getEstado_Paci())) {%>selected <% } %> >RS</option>
                              <option value="21" <% if ("21".equals(p.getEstado_Paci())) {%>selected <% } %> >RO</option>
                              <option value="22" <% if ("22".equals(p.getEstado_Paci())) {%>selected <% } %> >RR</option>
                              <option value="23" <% if ("23".equals(p.getEstado_Paci())) {%>selected <% } %> >SC</option>
                              <option value="24" <% if ("24".equals(p.getEstado_Paci())) {%>selected <% } %> >SP</option>
                              <option value="25" <% if ("25".equals(p.getEstado_Paci())) {%>selected <% } %> >SE</option>
                              <option value="26" <% if ("26".equals(p.getEstado_Paci())) {%>selected <% } %> >TO</option>

                          </select>
                        </div>
                   </div>

                <div class="row">
                      <div class="form-group col-md-1">
                          <input type="submit" value="Cadastrar" class="btn btn-primary "/>
                      </div>
                    
                      <div class="form-group col-md-1">                                                            
                        <a href="ConsultaPaciente.jsp" target="janela_prog">                           
                            <input  value="Cancelar" class="btn btn-danger"/>                           
                        </a>
                    </div>  
                 </div>
                </form> 
            </div>   
                                
        </div>         
 </body>
 </html>

<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Classes.Medico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
<html ng-app="myApp">
<head>    
  <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
  <meta charset="utf-8"/>
  <script
    src="https://code.jquery.com/jquery-3.2.1.js"
    integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
    crossorigin="anonymous" ></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
  <script src="controller.js"> </script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">  <!-- Latest compiled and minified JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
  <!--   <script>
    function mascara(i){
      var v = i.value;
      if(isNaN(v[v.length-1])){ // impede entrar outro caractere que não seja número
         i.value = v.substring(0, v.length-1);
         return;
      }

      i.setAttribute("maxlength", "14");
      if (v.length == 3 || v.length == 7) i.value += ".";
      if (v.length == 11) i.value += "-";

   }   
 
 </script>
 -->
</head>

<body  ng-controller="myCtrl">   
    <%
        int medico = Integer.parseInt(request.getParameter("cod_med"));
        Medico m = new Medico();
        m = m.consultarMedico(medico);
        
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        String dtNascimento = sdf.format(m.getData_Nasc_Med());
    %>

    <div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title"><center>EDITAR MÉDICO</center></h3>
    </div>

    <div class="panel-body">
        <form action="RecebeEditaMedico.jsp" method="POST">
            <div class="row">

              <div class="col-md-12">
                <h3>Dados Pessoais </h3>
              </div>

              <div class="form-group col-md-3" >
                <label for="codigo">Código do Médico</label>
                <input name="codigo" type="text" class="form-control" readonly="readonly" placeholder="Código do Médico" ng-model="medico.codigo" value="<%out.write("" +medico);%>"/>
              </div>  
                           

              <div class="form-group col-md-3">
                <label for="nome_med">Nome do Médico</label>
                <input name="nome_med" type="text" class="form-control" placeholder="Nome" maxlength="45"  required="required"  ng-model="medico.nome" value="<%out.write("" +m.getNome_Med());%>"/>
              </div>

              <div class="form-group col-md-3">
                <label for="sexo_med">Sexo do Médico</label>
                <select name="sexo_med"  class="form-control"  required="required"  ng-model="medico.sexo">
                  <option value="" >Sexo</option>
                  <option value="M" <% if ("M".equals(m.getSexo_Med())) {%>selected <% } %> >Masculino</option>
                  <option value="F"<% if ("F".equals(m.getSexo_Med())) {%>selected <% } %> >Feminino</option>
                </select>
              </div>

              <div class="form-group col-md-3">
                <label for="data_nasc_med">Data de Nascimento</label>
                <input name="data_nasc_med" type="date" class="form-control" required="required" placeholder="Data de Nascimento" ng-model="medico.datanascmed" value="<%out.write("" +m.getData_Nasc_Med());%>"/>
              </div>

              <div class="form-group col-md-3">
                <label for="cpf_med">CPF do Médico</label>
                <input name="cpf_med" type="text" class="form-control" placeholder="Cpf" maxlength="14" required="required" onkeypress="$(this).mask('000.000.000-00');" ng-model="medico.cpf" value="<%out.write("" +m.getCpf_Med());%>"/>
              </div>

               <div class="form-group col-md-3">
                <label for="rg_med">RG do Médico</label>
                <input name="rg_med" type="text" class="form-control" placeholder="RG" maxlength="9"  required="required" ng-model="medico.rg" onkeypress="$(this).mask('0.000.000');" value="<%out.write("" +m.getRG_Med());%>"/>
              </div>

              <div class="form-group col-md-3" >
                <label for="fone_med">Telefone do Médico</label>
                <input name="fone_med" type="text" class="form-control" placeholder="Telefone do Médico" maxlength="15" required="required" ng-model="medico.telefonemed"  value="<%out.write("" +m.getFone_Med());%>"/>
              </div>

              <div class="form-group col-md-3" >
                <label for="cod_espec_med">Código de Especialização Médica</label>
                <input name="cod_espec_med" type="text" class="form-control" placeholder="Código Especialização Médica" ng-model="medico.codespemed" value="<%out.write("" +m.getCod_Espec_Med());%>"/>
              </div>

               <div class="form-group col-md-3" >
                <label for="cod_registro">Código de Registro</label>
                <input  name="cod_registro" type="text" class="form-control" placeholder="Código de Registro" maxlength="12" required="required" ng-model="medico.codresgistro"  value="<%out.write("" +m.getCod_Registro());%>"/>
              </div>  

              <div class="col-md-12">
                <h3>Endereço </h3>
              </div>

              <div class="form-group col-md-3">
                <label for="cidade_med">Cidade do Médico</label>
                <input name="cidade_med" type="text" class="form-control" placeholder="Cidade" maxlength="45" required="required" ng-model="medico.cidade" value="<%out.write("" +m.getCidade_Med());%>"/>
              </div>

              <div class="form-group col-md-3">
                <label for="bairro_med">Bairro do Médico</label>
                <input name="bairro_med" type="text" class="form-control" placeholder="Bairro" maxlength="255" required="required" ng-model="medico.bairro" value="<%out.write("" +m.getBairro_Med());%>"/>
              </div>
              
              <div class="form-group col-md-3">
                <label for="cep_med">CEP do Médico</label>
                <input name="cep_med" type="text" class="form-control" placeholder="CEP" maxlength="10" required="required" onkeypress="$(this).mask('00.000-000')"   ng-model="medico.endereco.cep" value="<%out.write("" +m.getCep_Med());%>"/>
              </div>

              <div class="form-group col-md-3">
                <label for="estado_med">Estado do Médico</label>
                <select name="estado_med" class="form-control" required="required"  ng-model="medico.uf">                 
                  <option value="">UF</option>
                  <option value="0" <% if ("M".equals(m.getEstado_Med())) {%>selected <% } %> >AC</option>
                  <option value="1" <% if ("1".equals(m.getEstado_Med())) {%>selected <% } %> >AL</option>
                  <option value="2" <% if ("2".equals(m.getEstado_Med())) {%>selected <% } %> >AP</option>
                  <option value="3" <% if ("3".equals(m.getEstado_Med())) {%>selected <% } %> >AM</option>
                  <option value="4" <% if ("4".equals(m.getEstado_Med())) {%>selected <% } %> >BA</option>
                  <option value="5" <% if ("5".equals(m.getEstado_Med())) {%>selected <% } %> >CE</option>
                  <option value="6" <% if ("6".equals(m.getEstado_Med())) {%>selected <% } %> >DF</option>
                  <option value="7" <% if ("7".equals(m.getEstado_Med())) {%>selected <% } %> >ES</option>
                  <option value="8" <% if ("8".equals(m.getEstado_Med())) {%>selected <% } %> >GO</option>
                  <option value="9" <% if ("9".equals(m.getEstado_Med())) {%>selected <% } %> >MA</option>
                  <option value="10" <% if ("10".equals(m.getEstado_Med())) {%>selected <% } %> >MT</option>
                  <option value="11" <% if ("11".equals(m.getEstado_Med())) {%>selected <% } %> >MS</option>
                  <option value="12" <% if ("12".equals(m.getEstado_Med())) {%>selected <% } %> >MG</option>
                  <option value="13" <% if ("13".equals(m.getEstado_Med())) {%>selected <% } %> >PA</option>
                  <option value="14" <% if ("14".equals(m.getEstado_Med())) {%>selected <% } %> >PB</option>
                  <option value="15" <% if ("15".equals(m.getEstado_Med())) {%>selected <% } %> >PR</option>
                  <option value="16" <% if ("16".equals(m.getEstado_Med())) {%>selected <% } %> >PE</option>
                  <option value="17" <% if ("17".equals(m.getEstado_Med())) {%>selected <% } %> >PI</option>
                  <option value="18" <% if ("18".equals(m.getEstado_Med())) {%>selected <% } %> >RJ</option>
                  <option value="19" <% if ("19".equals(m.getEstado_Med())) {%>selected <% } %> >RN</option>
                  <option value="20" <% if ("20".equals(m.getEstado_Med())) {%>selected <% } %> >RS</option>
                  <option value="21" <% if ("21".equals(m.getEstado_Med())) {%>selected <% } %> >RO</option>
                  <option value="22" <% if ("22".equals(m.getEstado_Med())) {%>selected <% } %> >RR</option>
                  <option value="23" <% if ("23".equals(m.getEstado_Med())) {%>selected <% } %> >SC</option>
                  <option value="24" <% if ("24".equals(m.getEstado_Med())) {%>selected <% } %> >SP</option>
                  <option value="25" <% if ("25".equals(m.getEstado_Med())) {%>selected <% } %> >SE</option>
                  <option value="26" <% if ("26".equals(m.getEstado_Med())) {%>selected <% } %> >TO</option>
                </select>
              </div>
            </div>

    <!--      <div class="form-group col-md-1">
            <button  type="submit"  class="btn btn-success form-control" ng-click=salvar()>Salvar</button>
          </div>-->

            <div class="row">
                   <div class="form-group col-md-1">
                       <input type="submit" value="Cadastrar" class="btn btn-primary "/>
                   </div>
                  
                    <div class="form-group col-md-1">                                 
                       <a href="ConsultaMedico.jsp" target="janela_prog">                           
                           <input value="Cancelar" class="btn btn-danger"/>                           
                       </a>                                              
                   </div>
            </div>
     </form>
  </div>
</body>

</html>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="myApp">
<head>

  <title>Cadastro de Paciente</title>

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


  <div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title"><center>CADASTRA PACIENTE</center></h3>
    </div>


    <div class="panel-body">
        <form action="RecebeDadosPaciente.jsp" method="POST">

        <div class="row">

          <div class="col-md-12">
            <h3>Dados Pessoais </h3>
          </div>

          <div class="form-group col-md-3">
            <label for="nome_paci">Nome do Paciente</label>
            <input name="nome_paci" type="text" class="form-control" placeholder="Nome" maxlength="100" required="required" ng-model="paciente.nome"/>
          </div>

<!--          <div class="form-group col-md-3">
            <input type="text" class="form-control" placeholder="Sobrenome" ng-model="paciente.sobrenome"/>
          </div>-->

          <div class="form-group col-md-3">
            <label for="sexo_paci">Sexo do Paciente</label>
            <select name="sexo_paci" required="required" class="form-control" ng-model="pessoa.sexo">
              <option value="" >Sexo</option>
              <option value="M">Masculino</option>
              <option value="F">Feminino</option>
            </select>
          </div>
          
          <div class="form-group col-md-3">
              <label for="data_nasc_paci">Data de Nascimento</label>
            <input name="data_nasc_paci" type="date" class="form-control" placeholder="Data de Nascimento"  required="required"ng-model="paciente.datanascpaci"/>
          </div>
          
          <div class="form-group col-md-3">
              <label for="cpf_paci">CPF do Paciente</label>
            <input name="cpf_paci" type="text" class="form-control" placeholder="Cpf" maxlength="14"  required="required" onkeypress="$(this).mask('000.000.000-00');" ng-model="paciente.cpf"/>
          </div>
          
           <div class="form-group col-md-3">
               <label for="rg_paci">RG do Paciente</label>
            <input name="rg_paci" type="text" class="form-control" placeholder="RG" maxlength="9"  required="required" onkeypress="$(this).mask('0.000.000');" ng-model="paciente.rg"/>
          </div>

          <div class="form-group col-md-3">
              <label for="email_paci">Email do Paciente</label>
            <input name="email_paci" type="email" class="form-control" placeholder="E-mail" maxlength="100" ng-model="pessoa.email"/>
          </div>

          <div class="form-group col-md-3" >
              <label for="fone_paci">Telefone do Paciente</label>
            <input name="fone_paci" type="tel" class="form-control" placeholder="Telefone do Paciente" maxlength="15"  required="required"  onkeypress="$(this).mask('(00) 00000-0000')" ng-model="paciente.telefonepaci"/>
          </div>
          
          <div class="form-group col-md-3" >
              <label for="fone_resp">Telefone do Responsável</label>
            <input name="fone_resp" type="tel" class="form-control" placeholder="Telefone do Responsável" maxlength="15"   onkeypress="$(this).mask('(00) 00000-0000')" ng-model="paciente.telefoneresp"/>
          </div>

          <div class="col-md-12">
            <h3>Endereço </h3>
          </div>

          <div class="form-group col-md-3">
              <label for="cidade_paci">Cidade do Paciente</label>
            <input name="cidade_paci" type="text" class="form-control" placeholder="Cidade" maxlength="45"  required="required"  ng-model="paciente.cidade"/>
          </div>
          
          <div class="form-group col-md-3">
              <label for="bairro_paci">Bairro do Paciente</label>
            <input name="bairro_paci" type="text" class="form-control" placeholder="Bairro" maxlength="255"  required="required"  ng-model="paciente.bairro"/>
          </div>

          <div class="form-group col-md-3">
              <label for="cep_paci">CEP do Paciente</label>
            <input name="cep_paci" type="text" class="form-control" placeholder="CEP" maxlength="10" required="required" onkeypress="$(this).mask('00.000-000')"   ng-model="pessoa.endereco.cep"/>
          </div>
          
          <div class="form-group col-md-3">
              <label for="estado_paci">Estado do Paciente</label>
            <select name="estado_paci" class="form-control" required="required"  ng-model="pessoa.uf">
              <option value="">UF</option>
              <option value="0">AC</option>
              <option value="1">AL</option>
              <option value="2">AP</option>
              <option value="3">AM</option>
              <option value="4">BA</option>
              <option value="5">CE</option>
              <option value="6">DF</option>
              <option value="7">ES</option>
              <option value="8">GO</option>
              <option value="9">MA</option>
              <option value="10">MT</option>
              <option value="11">MS</option>
              <option value="12">MG</option>
              <option value="13">PA</option>
              <option value="14">PB</option>
              <option value="15">PR</option>
              <option value="16">PE</option>
              <option value="17">PI</option>
              <option value="18">RJ</option>
              <option value="19">RN</option>
              <option value="20">RS</option>
              <option value="21">RO</option>
              <option value="22">RR</option>
              <option value="23">SC</option>
              <option value="24">SP</option>
              <option value="25">SE</option>
              <option value="26">TO</option>
 
            </select>
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

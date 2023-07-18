<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Classes.Medico"%>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
  <title>Cadastro de Médico</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <script
    src="https://code.jquery.com/jquery-3.2.1.js"
    integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
    crossorigin="anonymous" >    
  </script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
  <script src="controller.js"> </script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
  
<!--  <script>
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
 
 </script>-->
  
</head>

<body  ng-controller="myCtrl">


  <div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title"><center>CADASTRA MÉDICO</center></h3>
    </div>

    <div class="panel-body">

        <form action="RecebeDadosMedico.jsp" method="POST">
            <div class="row">
                
              <div class="col-md-12">
                <h3>Dados Pessoais </h3>
              </div>

              <div class="form-group col-md-3">
                <label for="nome_med">Nome do Médico</label>
                <input name="nome_med" type="text" class="form-control"  maxlength="45"  required="required" placeholder="Nome do Médico" ng-model="medico.nome"/>
              </div>

              <div class="form-group col-md-3">
                <label for="sexo_med">Sexo do Médico</label>
                <select name="sexo_med" class="form-control"  required="required"  ng-model="pessoa.sexo">
                  <option value="0">Sexo</option>
                  <option value="M">Masculino</option>
                  <option value="F">Feminino</option>
                </select>
                  
              </div>

              <div class="form-group col-md-3">
                  <label for="data_nasc_med">Data de Nascimento</label>
                <input name="data_nasc_med" type="date" class="form-control"  required="required" placeholder="Data de Nascimento" ng-model="medico.datanascmed"/>
              </div>

              <div class="form-group col-md-3">
                  <label for="cpf_med">CPF do Médico</label>
                <input name="cpf_med" type="text" class="form-control" placeholder="Cpf"  maxlength="14"  required="required" onkeypress="$(this).mask('000.000.000-00');" ng-model="medico.cpf"/>
              </div>

               <div class="form-group col-md-3">
                   <label for="rg_med">RG do Médico</label>
                <input name="rg_med" type="text" class="form-control" maxlength="9"  required="required" placeholder="RG" onkeypress="$(this).mask('0.000.000');" ng-model="medico.rg"/>
              </div>

              <div class="form-group col-md-3" >
                  <label for="fone_med">Telefone do Médico</label>
                <input name="fone_med" type="tel" class="form-control"  maxlength="15" required="required" placeholder="Telefone do Médico"  onkeypress="$(this).mask('(00) 00000-0000')" "ng-model="medico.telefonemed"/>
              </div>

              <div class="form-group col-md-3" >
                  <label for="cod_espec_med">Código de Especialização Médica</label>
                <input name="cod_espec_med" type="text" class="form-control" placeholder="Código Especialização Médica" ng-model="medico.codespemed"/>
              </div>

              <div class="form-group col-md-3" >
                <label for="cod_registro">Código de Registro</label>
                <input name="cod_registro" type="text" class="form-control" placeholder="Código de Registro"  maxlength="12" required="required"ng-model="medico.codresgistro"/>
              </div>

              <div class="col-md-12">
                <h3>Endereço </h3>
              </div>

              <div class="form-group col-md-3">
                <label for="cidade_med">Cidade do Médico</label>
                <input name="cidade_med" type="text" class="form-control" placeholder="Cidade" maxlength="45" required="required" ng-model="medico.cidade"/>
              </div>

              <div class="form-group col-md-3">
                <label for="bairro_med">Bairro do Médico</label>
                <input name="bairro_med" type="text" class="form-control" placeholder="Bairro" maxlength="255" required="required" ng-model="medico.bairro"/>
              </div>

              <div class="form-group col-md-3">
                <label for="cep_med">CEP do Médico</label>
                <input name="cep_med" type="text" class="form-control" placeholder="CEP"  maxlength="10" required="required" onkeypress="$(this).mask('00.000-000')" ng-model="medico.endereco.cep"/>
              </div>

              <div name="estado_med" class="form-group col-md-3">
                <label for="estado_med">Estado do Médico</label>
                <select name="estado_med"  class="form-control" required="required"  ng-model="pessoa.uf">
                  <option value="">UF</option>
                  <option value="AC">AC</option>
                  <option value="AL">AL</option>
                  <option value="AP">AP</option>
                  <option value="AM">AM</option>
                  <option value="BA">BA</option>
                  <option value="CE">CE</option>
                  <option value="DF">DF</option>
                  <option value="ES">ES</option>
                  <option value="GO">GO</option>
                  <option value="MA">MA</option>
                  <option value="MT">MT</option>
                  <option value="MS">MS</option>
                  <option value="MG">MG</option>
                  <option value="PA">PA</option>
                  <option value="PB">PB</option>
                  <option value="PR">PR</option>
                  <option value="PE">PE</option>
                  <option value="PI">PI</option>
                  <option value="RJ">RJ</option>
                  <option value="RN">RN</option>
                  <option value="RS">RS</option>
                  <option value="RO">RO</option>
                  <option value="RR">RR</option>
                  <option value="SC">SC</option>
                  <option value="SP">SP</option>
                  <option value="SE">SE</option>
                  <option value="TO">TO</option>

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

  </div>
</body>

</html>


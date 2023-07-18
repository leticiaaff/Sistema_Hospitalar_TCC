<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="myApp">
<head>

  <title>Cadastro de Usuário</title>

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

  
</head>

<body  ng-controller="myCtrl">


  <div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title"><center>CADASTRA USUÁRIO</center></h3>
    </div>


    <div class="panel-body">

        <form action="RecebeDadosUsuario.jsp" method="POST">

        <div class="row">

          <div class="col-md-12">
            <h3>Dados do Usuário </h3>
          </div>

          <div class="form-group col-md-4">
            <label for="usuario">Usuário</label>
            <input name="usuario" type="text" class="form-control" required="required" placeholder="Usuário" ng-model="usuario"/>
          </div>

          <div class="form-group col-md-4">
            <label for="senha">Senha</label>
            <input name="senha" type="password" class="form-control" maxlength="8"  required="required" placeholder="Senha" ng-model="senha"/>
          </div>
          
          <div class="form-group col-md-4">
            <label for="nome_user">Nome do Usuário</label>
            <input name="nome_user" type="text" class="form-control" maxlength="45" required="required" placeholder="Nome do Usuário" ng-model="nomedousuario"/>
          </div>

          <div class="form-group col-md-4">
            <label for="email_usuario">E-mail do Usuário</label>
            <input name="email_usuario" type="email" class="form-control" required="required" placeholder="E-mail" ng-model="pessoa.email"/>
          </div>

          <div class="form-group col-md-4" >
            <label for="niv_usuario">Nível de Acesso</label>
            <input name="niv_usuario" type="text" class="form-control" maxlength="3" required="required"  placeholder="Nivel de Acesso" ng-model="nivusuario"/>
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


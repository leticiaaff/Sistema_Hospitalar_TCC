<%@page import="Classes.Usuario"%>
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

<body>
   <%
            String nr_sequencia = request.getParameter("nr_sequencia");
            Usuario usu = new Usuario();
            usu = usu.consultarUsuario(Integer.parseInt(nr_sequencia));
    %>


  <div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title"><center>EDITAR USUÁRIO</center></h3>
    </div>


    <div class="panel-body">

        <form action="RecebeEditaUsuario.jsp" method="POST">

        <div class="row">

          <div class="col-md-12">
            <h3>Dados do Usuário </h3>
          </div>

          <div class="form-group col-md-3" >
              <label for="cod_usuario">Códido do Usuário</label>
            <input id="cod_Med" name="nr_sequencia" type="text" class="form-control" placeholder="Código" readonly="readonly" value="<%out.write("" +usu.getNr_sequencia());%>"/>
          </div>  
                        
            
          <div class="form-group col-md-3">
              <label for="usuario">Usuário</label>
            <input name="usuario" type="text" class="form-control" placeholder="Usuário"  required="required" ng-model="usuario" value="<%out.write("" +usu.getUsuario());%>"/>
          </div>

          <div class="form-group col-md-3">
              <label for="senha">Senha</label>
            <input name="senha" type="password" class="form-control" placeholder="Senha"  maxlength="8"  required="required" ng-model="senha" value="<%out.write("" +usu.getSenha());%>"/>
          </div>
          
          <div class="form-group col-md-3">
              <label for="nome_user">Nome do Usuário</label>
            <input name="nome_user" type="text" class="form-control" placeholder="Nome do Usuário" maxlength="45" required="required" ng-model="nomedousuario" value="<%out.write("" +usu.getNome_User());%>"/>
          </div>

          <div class="form-group col-md-3">
              <label for="email_usuario">E-mail do Usuário</label>
            <input name="email_usuario" type="text" class="form-control" placeholder="E-mail" required="required" ng-model="pessoa.email" value="<%out.write("" +usu.getEmail_usuario());%>"/>
          </div>

          <div class="form-group col-md-3" >
              <label for="niv_usuario">Nível de Acesso</label>
            <input name="niv_usuario" type="text" class="form-control" placeholder="Nivel do Usuário" maxlength="3" required="required"  ng-model="nivusuario" value="<%out.write("" +usu.getNiv_usuario());%>"/>
          </div>

    </div>
    <div class="row">
        <div class="form-group col-md-1">
            <input type="submit" value="Cadastrar" class="btn btn-primary "/>
        </div>
        <div class="form-group col-md-1">                                                            
            <a href="ConsultaUsuario.jsp" target="janela_prog">                           
                <input type="reset"  value="Cancelar" class="btn btn-danger"/>                           
            </a>
        </div>
    </div>
    </form>
          
  </div>
</body>

</html>



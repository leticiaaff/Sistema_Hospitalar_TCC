<%@page import="java.util.List"%>
<%@page import="Classes.Usuario"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Time"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/padraotelagrid.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet"/>        
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>    </head>
    <style>

    .msg-popup2 {
        z-index: 10;
        width: 30%;
        height: 20vh;
        margin-left:  500px;
        margin-right: 400px;
        top: 250px;
        background-color: rgb(9, 117, 167);
        display: none;
        position: absolute;
        border: 2px solid #b2b2b2;
        -webkit-border-radius: 15px;
        border-radius: 15px;
        -webkit-box-shadow: 0px 1px 4px 0px rgba(43, 40, 40, 0.6) inset;
        box-shadow: 0px 1px 4px 0px rgba(43, 40, 40, 0.6) inset;
        -webkit-transition: all 0.2s linear;
        transition: all 0.2s linear;       
        }
    </style>    
    
    <body>
      
      <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title"><center>CONSULTAR USUÁRIO</center></h3>
        </div>
      </div>
      <%
        Usuario usu = new Usuario();
        List<Usuario> Usuario = usu.consultarTodosUsuario();
      %>
        
      <%-- label para lançar mensagem de feedback da atualização --%>
        <label class="cabecalho" id="msg"> 
            <%
                if(request.getParameter("pmensagem") != null)         
                out.write(request.getParameter("pmensagem"));
            %>
        </label>
            <table class="table">
                <thead>
                    <tr>        
                        <th scope="col">Usuário</th>
                        <th scope="col">Senha</th>
                        <th scope="col">Nome do Usuário</th>
                        <th scope="col">E-mail do Usuário</th>
                        <th scope="col">Nível do Usuário</th>
                        <th scope="col">Editar</th>
                        <th scope="col">Excluir</th>
                    </tr>                        
                </thead>                    

                <tbody>
                    <% for (Usuario l : Usuario) {%>
                    <tr>                    
                        <td><% out.write(l.getUsuario()); %></td>
                        <td><% out.write("  " + l.getSenha());%></td>
                        <td><% out.write(l.getNome_User()); %></td>
                        <td><% out.write(l.getEmail_usuario()); %></td>
                        <td><% out.write(l.getNiv_usuario()); %></td>
                       <td><% out.write("<a href=EditarUsuario.jsp?nr_sequencia=" + l.getNr_sequencia() + ">" + "<i class='far fa-edit' style='color:blue'></i>" + "</a>");%></td>                        
                       <td><% out.write("<a href=ExcluirUsuario.jsp?nr_sequencia=" + l.getNr_sequencia() + ">" + "<i class='far fa-trash-alt' style='color:red'></i>" + "</a>");%></td>                         
<!--                       <td>
                            <button type="button" id="botaoexcluir" 
                                    onclick="mostrarExclusao(<%out.write("" + l.getSenha()+ "," + l.getUsuario());%>)">
                                <i class='far fa-trash-alt' style='color:red'></i> 
                            </button>
                        </td>-->
                        
                        
                    </tr> 
                    <%}%>
                </tbody>
            </table>
 <!-- POPUP DE CONFIRMAÇÃO DE EXCLUSÃO -->                
        
            <div class="msg-popup2">
                <h5 class="text-center" style="color: #ffffff; font-family: arial-bold ">EXCLUSÃO</h5>
                <h5 class="text-center" style="color: #ffffff;">Confirma a <b>exclusão</b> do registro ?</h5>
                <div class="text-center">                
                    <a href=""><button class="btn btn-dark" click="cancela()"> Não </button></a>
                    <a id="exclui" href="#"><button class="btn btn-danger" id="excluir"> Sim </button></a>                    
                </div>
            </div>                
                
            <script>
                function cancela() {
                    document.getElementsByClassName("msg-popup2")[0].style.display = "none";
                }

                function mostrarExclusao(Usuario) {
                    document.getElementsByClassName("msg-popup2")[0].style.display = "block";
                    var link = document.getElementById("exclui");
                    link.href = "ExcluirUsuario.jsp?usuario=" + Usuario;
                }
            </script>                       
              
    </body>    
 </html>


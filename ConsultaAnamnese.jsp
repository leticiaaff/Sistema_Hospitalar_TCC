<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="Classes.Anamnese"%>
<%@page import="Classes.Paciente"%>
<%@page import="Classes.Medico"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/padraotelagrid.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet"/>        
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
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
        <!-- 
            Monta a lista que vai conter as anamneses do paciente vinculado ao médico informado
            Quando abrir a tela sem informar paciente e médico os argumetno ficarão nulos e vai mostrar
            uma tela em branco.
            Quando clicar na janela do Paciente vai abrir um SELECT e a mesma coisa vai ocorrer quando clicar
            na janela do médico.
            Informados os valores a rotina vai instanciar a classe Anamnese e chamar a consulta das Anamneses
            por paciente e medico
       -->
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><center>CONSULTAR ANAMNESE</center></h3>
            </div>
        </div>
        <%
        List<Anamnese> anamneses = new ArrayList();
        String codpaciente = request.getParameter("idpaciente");
        String codmedico   = request.getParameter("idmedico");
        int vCod_Paci = 0;
        int vCod_Med = 0;
        
        if(codpaciente != null && codmedico != null){
            Anamnese anam = new Anamnese();
            vCod_Paci = Integer.parseInt(codpaciente);
            vCod_Med  = Integer.parseInt(codmedico);
            anamneses = anam.consultarAnamnesePacMed(vCod_Paci,vCod_Med);
            for (Anamnese anam1 : anamneses) {
                    if (anam1.getData_Consulta() != null) {                    
                    } else {
                       response.sendRedirect("ConsultaAnamnese.jsp?pmensagem=Registro não Encontrado ou Erro no Acesso");
                    }
            }
        }
        %>
        <form action="ConsultaAnamnese.jsp" method="POST">
            <!-- 
            Instanciando a classe Paciente para consultar a lista de Pacientes cadastrados
            que vai servir de base para montar o SELECT (HTML)
            -->
            <%
            Paciente paciente = new Paciente();
            List<Paciente> pacientes = paciente.lovPacientes();
           %>
            <!-- 
            Instanciando a classe Medico para consultar a lista de Pacientes cadastrados
            que vai servir de base para montar o SELECT (HTML)
            -->
           <%
            Medico medico = new Medico();
            List<Medico> medicos = medico.lovMedicos();
           %>
            
                <%-- label para lançar mensagem de feedback da atualização --%>
                <label class="cabecalho" id="msg"> 
                    <%
                        if (request.getParameter("pmensagem") != null)
                            out.write(request.getParameter("pmensagem"));
                    %>
                </label>            
                
                
                   <!-- 
                    Select para os pacientes
                   -->
                  <!--<div class="form-group col-md-3 h-1">-->
                    <div class="form-group col-md-3">
                    <label for="codpaciente">Nome do Paciente</label>
                    <select class="form-control" name="idpaciente">
                        <% for(Paciente p: pacientes){ %>
                           <option value="<%out.write(""+p.getCod_Paci());%>">
                                          <% out.write(p.getNome_Paci()); %>
                           </option>
                        <%}%>
                    </select> 
                    </div>
                <!--</div>-->  
                    
                    <!-- 
                    Select para os medicos
                    --> 
                   <!--<div class="form-group col-md-3 h-1">>-->
                    <div class="form-group col-md-3">
                    <label for="codmedico">Nome do Médico</label>
                    <select class="form-control" name="idmedico">
                        <% for(Medico m: medicos){ %>
                           <option value="<%out.write(""+m.getCod_Med());%>">
                                          <% out.write(m.getNome_Med()); %>
                           </option>
                        <%}%>
                    </select> 
                    </div>
                    <!--</div>-->  
                
                    <!--<diCv class="form-group col-md-3 h-1">-->
                    <center><input type="submit" value="Consultar" class="btn btn-primary"/></center>
                 
                     <!--</div>-->
                
                    
        <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Data da Consulta</th>
                        <th scope="col">Descrição</th>
                        <th scope="col">Editar</th>
                        <th scope="col">Excluir</th>
                    </tr>                        
                </thead> 

<!--        <table id="config">
        <thead>
                <th>Data Consulta</th>
                <th> Editar </th>
                <th> Excluir </th>
        </thead>-->
        <tbody>
            <% for (Anamnese a : anamneses) {%>
            <tr>
               <%
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                String data_consulta = sdf.format(a.getData_Consulta());
               %>
                <td><% out.write(data_consulta); %></td>
                <td><% out.write(a.getDescricao());%></td>
                <td><%out.write("<a href=EditarAnamnese.jsp?cod_paci="  + codpaciente + "&" + "cod_med=" + codmedico +  "&" + "nr_sequencia=" + a.getNr_sequencia()+ ">" + "<i class='far fa-edit' style='color:blue'></i>" + "</a>");%></td> 
               <td><% out.write("<a href=ExcluirAnamnese.jsp?cod_paci="  + codpaciente + "&" + "cod_med=" + codmedico +  "&" + "nr_sequencia=" + a.getNr_sequencia()+ ">" + "<i class='far fa-trash-alt' style='color:red'></i>" + "</a>");%></td>                         
<!--                <td>
                    <button type="button" id="botaoexcluir" 
                            onclick="mostrarExclusao(<%out.write("" + codpaciente);%>,<%out.write("" + codmedico);%>,<%out.write(data_consulta);%>)">
                        <i class='far fa-trash-alt' style='color:red'></i> 
                    </button>
                </td>-->
            </tr> 
            <%}%>
        </tbody>
    </table>
    </form>
 <!-- POPUP DE CONFIRMAÇÃO DE EXCLUSÃO -->                
        
        <div class="msg-popup2">
            <h5 class="text-center" style="color: #ffffff; font-family: arial-bold ">EXCLUSÃO</h5>
            <h5 class="text-center" style="color: #ffffff;">Confirma a <b>exclusão</b> do registro ?</h5>
            <div class="text-center">                
                <a href=""><button class="btn btn-dark" onclick="cancela()"> Não </button></a>
                <a id="exclui" href="#"><button class="btn btn-danger" id="excluir"> Sim </button></a>                    
            </div>
        </div>                
                
        <script>
            function cancela() {
                document.getElementsByClassName("msg-popup2")[0].style.display = "none";
            }
        
            function mostrarExclusao(codpaciente, codmedico, data_consulta) {
                debugger;
                document.getElementsByClassName("msg-popup2")[0].style.display = "block";
                var link = document.getElementById("exclui");
                Date Data_Consulta = Date.valueOf(data_consulta);
                link.href = "ExcluirAnamnese.jsp?cod_paci=" + codpaciente + "&" + "cod_med=" + codmedico +  "&" + "data_consulta=" + Data_Consulta;                
            }
        </script>                               
</body>
</html>
<%@page import="Classes.Paciente"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%
     //recebe os valores da tela HTML  
     String nome_paci      = request.getParameter("nome_paci");
     String cpf_paci       = request.getParameter("cpf_paci");
     String rg_paci        = request.getParameter("rg_paci");
     String sexo_paci      = request.getParameter("sexo_paci");
     String Data_Nasc_Paci = request.getParameter("data_nasc_paci");
     String fone_paci      = request.getParameter("fone_paci");
     String fone_resp      = request.getParameter("fone_resp");
     String email_paci     = request.getParameter("email_paci");
     String estado_paci    = request.getParameter("estado_paci");
     String cidade_paci    = request.getParameter("cidade_paci");
     String bairro_paci    = request.getParameter("bairro_paci");
     String cep_paci       = request.getParameter("cep_paci");
     String endereco_paci  = request.getParameter("endereco_paci");

     Paciente paciente = new Paciente();  
     paciente.setNome_Paci                  (nome_paci);
     paciente.setCpf_Paci                   (cpf_paci);
     paciente.setRG_Paci                    (rg_paci);
     paciente.setSexo_Paci                  (sexo_paci);
     paciente.setData_Nasc_Paci(Date.valueOf(Data_Nasc_Paci));
     paciente.setFone_Paci                  (fone_paci);
     paciente.setFone_Resp                  (fone_resp);
     paciente.setEmail_Paci                 (email_paci);
     paciente.setEstado_Paci                (estado_paci);
     paciente.setCidade_Paci                (cidade_paci);
     paciente.setBairro_Paci                (bairro_paci);
     paciente.setCep_Paci                   ((cep_paci));
     paciente.setEndereco_Paci              (endereco_paci);
     
     if(paciente.incluirPaciente()){
         response.sendRedirect("CadastraPaciente.jsp?pmensagem=Paciente Salvo");
     } else {
         response.sendRedirect("CadastraPaciente.jsp?pmensagem=Erro ao Salvar Paciente");
     }
     %>
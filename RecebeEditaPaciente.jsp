<%@page import="java.sql.Date"%>
<%@page import="Classes.Paciente"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<%
    int cod_paci          = Integer.parseInt(request.getParameter("cod_paci"));
    String nome_paci      = request.getParameter("nome_paci");
    String cpf_paci       = request.getParameter("cpf_paci");
    String rg_paci        = request.getParameter("rg_paci");
    String sexo_paci      = request.getParameter("sexo_paci");
    String data_nasc_paci = request.getParameter("data_nasc_paci");
    String fone_paci      = request.getParameter("fone_paci");
    String fone_resp      = request.getParameter("fone_resp");
    String email_paci     = request.getParameter("email_paci");
    String estado_paci    = request.getParameter("estado_paci");
    String cidade_paci    = request.getParameter("cidade_paci");
    String bairro_paci    = request.getParameter("bairro_paci");
    String cep_paci       = request.getParameter("cep_paci");
    String endereco_paci  = request.getParameter("endereco_paci");
    
    Paciente paci = new Paciente();
    paci.setNome_Paci                  (nome_paci);
    paci.setCod_Paci                   (cod_paci);
    paci.setCpf_Paci                   (cpf_paci);
    paci.setRG_Paci                    (rg_paci);
    paci.setSexo_Paci                  (sexo_paci);
    paci.setData_Nasc_Paci(Date.valueOf(data_nasc_paci));
    paci.setFone_Paci                  (fone_paci);
    paci.setFone_Resp                  (fone_resp);
    paci.setEmail_Paci                 (email_paci);
    paci.setEstado_Paci                (estado_paci);
    paci.setCidade_Paci                (cidade_paci);
    paci.setBairro_Paci                (bairro_paci);
    paci.setCep_Paci                   (cep_paci);
    paci.setEndereco_Paci              (endereco_paci);
    
    if (paci.alterarPaciente()) {
        response.sendRedirect("ConsultaPaciente.jsp?pmensagem=Paciente alterada com sucesso");
    } else {
        response.sendRedirect("ConsultaPaciente.jsp?pmensagem=Problemas ao alterar o Paciente");
    }
%>

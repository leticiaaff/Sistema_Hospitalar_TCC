<%@page import="java.sql.Date"%>
<%@page import="Classes.Medico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%
    int cod_med          = Integer.parseInt(request.getParameter("codigo"));
    String nome_med      = request.getParameter("nome_med");
    String cpf_med       = request.getParameter("cpf_med");
    String rg_med        = request.getParameter("rg_med");
    String sexo_med      = request.getParameter("sexo_med");
    String data_nasc_med = request.getParameter("data_nasc_med");
    String fone_med      = request.getParameter("fone_med");
    int cod_espec_med    = Integer.parseInt(request.getParameter("cod_espec_med"));
    String cod_registro  = request.getParameter("cod_registro");
    String estado_med    = request.getParameter("estado_med");
    String cidade_med    = request.getParameter("cidade_med");
    String bairro_med    = request.getParameter("bairro_med");
    String cep_med       = request.getParameter("cep_med");
    String endereco_med  = request.getParameter("endereco_med");
    
    Medico med = new Medico();
    med.setCod_Med                   (cod_med);
    med.setNome_Med                  (nome_med);
    med.setCpf_Med                   (cpf_med);
    med.setRG_Med                    (rg_med);
    med.setSexo_Med                  (sexo_med);
    med.setData_Nasc_Med(Date.valueOf(data_nasc_med));     
    med.setFone_Med                  (fone_med);
    med.setCod_Espec_Med             (cod_espec_med);
    med.setCod_Registro              (cod_registro);
    med.setEstado_Med                (estado_med);
    med.setCidade_Med                (cidade_med);
    med.setBairro_Med                (bairro_med);
    med.setCep_Med                   (cep_med);
    med.setEndereco_Med              (endereco_med);
    if (med.alterarMedico()) {
        response.sendRedirect("ConsultaMedico.jsp?pmensagem=Medico alterada com sucesso");
    } else {
        response.sendRedirect("ConsultaMedico.jsp?pmensagem=Problemas ao alterar o Medico");
    }
%>
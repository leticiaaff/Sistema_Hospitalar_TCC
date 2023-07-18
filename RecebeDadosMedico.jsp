<%@page import="java.sql.Date"%>
<%@page import="Classes.Medico"%>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
     //recebe os valores da tela HTML  
     String nome_med      = request.getParameter("nome_med");
     String cpf_med       = request.getParameter("cpf_med");
     String rg_med        = request.getParameter("rg_med");
     String sexo_med      = request.getParameter("sexo_med");
     String data_nasc_med = request.getParameter("data_nasc_med");
     String fone_med      = request.getParameter("fone_med");
     String cod_espec_med = request.getParameter("cod_espec_med");
     String cod_registro  = request.getParameter("cod_registro");
     String estado_med    = request.getParameter("estado_med");
     String cidade_med    = request.getParameter("cidade_med");
     String bairro_med    = request.getParameter("bairro_med");
     String cep_med       = request.getParameter("cep_med");
     String endereco_med  = request.getParameter("endereco_med");

     Medico medico = new Medico();  
     medico.setNome_Med     (nome_med);
     medico.setCpf_Med      (cpf_med);
     medico.setRG_Med       (rg_med);
     medico.setSexo_Med     (sexo_med);
     medico.setData_Nasc_Med(Date.valueOf(data_nasc_med));     
     medico.setFone_Med     (fone_med);
     medico.setCod_Espec_Med(Integer.parseInt(cod_espec_med));
     medico.setCod_Registro (cod_registro);
     medico.setEstado_Med   (estado_med);
     medico.setCidade_Med   (cidade_med);
     medico.setBairro_Med   (bairro_med);
     medico.setCep_Med      (cep_med);
     medico.setEndereco_Med (endereco_med);
     if(medico.incluirMedico()){
         response.sendRedirect("CadastraMedico.jsp?pmensagem=Médico Salvo");
     } else {
         response.sendRedirect("CadastraMedico.jsp?pmensagem=Erro ao Salvar Médico");
     }
     %>
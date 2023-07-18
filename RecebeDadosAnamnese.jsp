<%@page import="Classes.Anamnese"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
     //recebe os valores da tela HTML  
     String cod_paci       = request.getParameter("cod_paci");
     String cod_med        = request.getParameter("cod_med");
     String data_consulta  = request.getParameter("data_consulta");
     String descricao      = request.getParameter("descricao");
     
     Anamnese anamnese = new Anamnese();  
     anamnese.setCod_Paci(Integer.parseInt(cod_paci));
     anamnese.setCod_Med(Integer.parseInt(cod_med));
     anamnese.setData_Consulta(Date.valueOf(data_consulta));
     anamnese.setDescricao(descricao);
     
     if(anamnese.incluirAnamnese()){
         response.sendRedirect("CadastraAnamnese.jsp?pmensagem=Anamnese Salvo");
     } else {
         response.sendRedirect("CadastraAnamnese.jsp?pmensagem=Erro ao Salvar Anamnese");
     }
     %>
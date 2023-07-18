<%@page import="Classes.Consulta"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
     //recebe os valores da tela HTML  
     String cod_paci         = request.getParameter("cod_paci");
     String cod_med          = request.getParameter("cod_med");
     String data_consulta    = request.getParameter("data_consulta");
     String horario_consulta = request.getParameter("horario_consulta");
     String fone_paciente    = request.getParameter("fone_paciente");
     
     Consulta con = new Consulta();
     con.setCod_Paci(Integer.parseInt(cod_paci));
     con.setCod_Med(Integer.parseInt(cod_med));
     con.setData_Consulta(Date.valueOf(data_consulta));
     con.setHorario_Consulta(horario_consulta);
     con.setFone_Paciente(fone_paciente);
     
     if(con.incluirConsulta()){
         response.sendRedirect("CadastraConsulta.jsp?pmensagem=Consulta Salvo");
     } else {
         response.sendRedirect("CadastraConsulta.jsp?pmensagem=Erro ao Salvar Consulta");
     }
     %>
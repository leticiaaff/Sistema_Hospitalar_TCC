<%@page import="java.sql.Date"%>
<%@page import="Classes.Consulta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
//    int cod_consulta  = Integer.parseInt(request.getParameter("cod_consulta"));
//    String data_consulta = request.getParameter("data_consulta");
    
     if(request.getParameter("cod_consulta") != null){
        Consulta con = new Consulta();  
//        con = con.consultarConsulta(Integer.parseInt(cod_consulta), Date.valueOf(data_consulta));
        
        if (con.excluirConsulta(Integer.parseInt(request.getParameter("cod_consulta")))) {
            response.sendRedirect("ConsultaConsulta.jsp?pmensagem=Consulta excluido");
        }else {
            response.sendRedirect("ConsultaConsulta.jsp?pmensagem=Problemas na exclusao da Consulta");
        }
             
    }
    %>
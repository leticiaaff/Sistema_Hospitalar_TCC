<%@page import="java.sql.Date"%>
<%@page import="Classes.Anamnese"%>
<%@page import="Classes.Paciente"%>
<%@page import="Classes.Medico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

//    String data_consulta  = request.getParameter("data_consulta");
    
//    if(cod_paci != null && cod_med != null && data_consulta != null){
//        Anamnese ana = new Anamnese();  
//        ana = ana.consultarAnamnese(Integer.parseInt(cod_paci), Integer.parseInt(cod_med), Date.valueOf(data_consulta));
        
      if(request.getParameter("nr_sequencia") != null){   
        String cod_paci       = request.getParameter("cod_paci");
        String cod_med        = request.getParameter("cod_med");
        Anamnese ana = new Anamnese();  
      
        if (ana.excluirAnamnese(Integer.parseInt(request.getParameter("nr_sequencia")))) {
//            response.sendRedirect("ConsultaAnamnese.jsp?pmensagem=Anamnese excluido");
            response.sendRedirect("ConsultaAnamnese.jsp?pmensagem=Anamnese excluido&idpaciente="+cod_paci+"&" + "idmedico=" + cod_med);
        }else {
            response.sendRedirect("ConsultaAnamnese.jsp?pmensagem=Problemas na exclusao da Anamnese");
        }
             
    }
    %>
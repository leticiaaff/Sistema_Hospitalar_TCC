<%@page import="Classes.Medico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%
    String cod_med = request.getParameter("cod_med");
    Medico med = new Medico();
    if (cod_med != null) {
        med = med.consultarMedico(Integer.parseInt(cod_med));
        if (med.excluirMedico()) {
            response.sendRedirect("ConsultaMedico.jsp?pmensagem=Médico excluído");
        } else {
            response.sendRedirect("ConsultaMedico.jsp?pmensagem=Medico possui anamanese em seu nome");
        }
    }
    %>

<%@page import="Classes.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%
    String cod_paci = request.getParameter("cod_paci");
    Paciente paci = new Paciente();
    if (cod_paci != null) {
        paci = paci.consultarPaciente(Integer.parseInt(cod_paci));
        if (paci.excluirPaciente()) {
            response.sendRedirect("ConsultaPaciente.jsp?pmensagem=Paciente excluido");
        } else {
            response.sendRedirect("ConsultaPaciente.jsp?pmensagem=Paciente possui anamanese em seu nome");
        }
    }
    %>


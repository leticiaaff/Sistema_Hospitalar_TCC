<%@page import="Classes.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String nr_sequencia = request.getParameter("nr_sequencia");
    Usuario usu = new Usuario();
    if (nr_sequencia != null) {
        usu = usu.consultarUsuario(Integer.parseInt(nr_sequencia));
        if (usu.excluirUsuario()) {
            response.sendRedirect("ConsultaUsuario.jsp?pmensagem=Usuario excluido");
        } else {
            response.sendRedirect("ConsultaUsuario.jsp?pmensagem=Problemas na exclusao do Usuario");
        }
    }
%>

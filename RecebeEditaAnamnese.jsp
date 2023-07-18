<%@page import="java.sql.Date"%>
<%@page import="Classes.Anamnese"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<%
    int nr_sequencia         =Integer.parseInt(request.getParameter("nr_sequencia"));
//    int cod_paci            = Integer.parseInt(request.getParameter("cod_paci"));
//    int cod_med             = Integer.parseInt(request.getParameter("cod_med"));
    String data_consulta     =  request.getParameter("data_consulta");
    String descricao        = request.getParameter("descricao");
    
    Anamnese ana = new Anamnese();
    ana.setNr_sequencia(nr_sequencia);
    ana.setData_Consulta(Date.valueOf(data_consulta));
    ana.setDescricao(descricao);
    if (ana.alterarAnamnese()) {
        response.sendRedirect("ConsultaAnamnese.jsp?pmensagem=Anamnese alterada com sucesso");
    } else {
        response.sendRedirect("ConsultaAnamnese.jsp?pmensagem=Problemas ao alterar a Anamnese");
    }
%>
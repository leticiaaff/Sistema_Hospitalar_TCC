<%@page import="Classes.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

       <%
        //recebe os valores da tela HTML
        String pUsuario = request.getParameter("usuario");
        
        
        String pSenha   = request.getParameter("senha");

        //instancia a classe Login
        Usuario usu1 = new Usuario();
        usu1 = usu1.autenticarUsuario(pUsuario, pSenha);
        String nivel_usuario = usu1.getNiv_usuario();
        /* dependendo do nivel de usuário retornado 
           o programa chama o menu que contém as opções de acesso daquele nível
        */
        if ("adm".equals(nivel_usuario)) {
            response.sendRedirect("indexAdmin.html");
        } else if ("med".equals(nivel_usuario)) {
            response.sendRedirect("indexMedico.html");
        } else if ("sec".equals(nivel_usuario)) {
            response.sendRedirect("indexSecretaria.html");
        } else {
            response.sendRedirect("index.html?pmensagem=Usuário ou Senha Inválidos");
        }
        %>
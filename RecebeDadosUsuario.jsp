<%@page import="Classes.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
     //recebe os valores da tela HTML  
     String usuario       = request.getParameter("usuario");
     String senha         = request.getParameter("senha");
     String nome_user     = request.getParameter("nome_user");
     String email_usuario = request.getParameter("email_usuario");
     String niv_usuario   = request.getParameter("niv_usuario");
     String sit_senha     = request.getParameter("sit_senha");

     Usuario usu = new Usuario();  
     usu.setUsuario      (usuario);
     usu.setSenha        (senha);
     usu.setNome_User    (nome_user);
     usu.setEmail_usuario(email_usuario);
     usu.setNiv_usuario  (niv_usuario);
     usu.setSit_senha    (sit_senha);
     
     if(usu.incluirUsuario()){
         response.sendRedirect("CadastraUsuario.jsp?pmensagem=Usuario Salvo");
     } else {
         response.sendRedirect("CadastraUsuario.jsp?pmensagem=Erro ao Salvar Usuario");
     }
     %>
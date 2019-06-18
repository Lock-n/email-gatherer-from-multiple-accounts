<%@page import="java.util.ArrayList"%>
<%@page import="bd.core.MeuResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bd.daos.*, bd.dbos.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Por favor aguarde...</title>
</head>
<body>
	<p> Por favor aguarde...</p>
	<%
		try{
			String nome  = request.getParameter("nome");
			String senha = request.getParameter("senha");
		
			if (nome == null || senha == null) {
				response.sendRedirect("index.jsp?error=Dados%20Incompletos");
				return;
			}
			
			User usuario = new User(nome, senha);
			
			Users.incluir(usuario);
			
			MeuResultSet resultado= EmailAccounts.getEmailAccountsByUser(nome);
			EmailAccount contaE;
			ArrayList<EmailAccount> contasE = new ArrayList<EmailAccount>();
			while(resultado.next()){
				contaE = new EmailAccount(resultado.getString("email"), resultado.getString("password"), resultado.getString("server_send_address"), 
		        		   resultado.getString("server_receive_address"), resultado.getString("server_send_protocol"),
		        		   resultado.getString("server_receive_protocol"), resultado.getInt("server_send_port"),
		        		   resultado.getInt("server_receive_port"), resultado.getString("name_user"));
				contasE.add(contaE);
			}
			
			session.setAttribute("name", nome);
			session.setAttribute("contasE", contasE);
			response.sendRedirect("main.jsp");
			return;
		}
		catch(Exception erro){
			erro.printStackTrace();
			response.sendRedirect("index.jsp?error=Erro%20registrando%20usuario");
			return;
		}
%>
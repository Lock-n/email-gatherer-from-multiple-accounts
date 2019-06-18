<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bd.daos.*, bd.dbos.*, java.util.Iterator" import="bd.core.MeuResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Por favor aguarde</title>
</head>
<body>

	<%
          try{

     	 	String email = request.getParameter("email");
     	 	
     	 	if (email == null) {
     	 		response.sendRedirect("remove_a_email_account.jsp?error=Dados%20incompletos");
     	 		return;
     	 	}     	 		
          	
          	EmailAccounts.excluir(email);
			
			ArrayList<EmailAccount> contasE = (ArrayList<EmailAccount>)session.getAttribute("contasE");
			
			Iterator<EmailAccount> it = contasE.iterator();
			for (int i = 0; it.hasNext(); i++) {
				EmailAccount account = it.next();
				
				if (account.getEmail().equals(email))
					contasE.remove(i);
			}
			
			session.setAttribute("contasE", contasE);         	
          	
          	response.sendRedirect("main.jsp");
          	return;
     	}
        catch(Exception erro){
           erro.printStackTrace();
           response.sendRedirect("main.jsp?error=Erro%20ao%20excluir%20conta%20de%20email");
           return;
        }
	%>
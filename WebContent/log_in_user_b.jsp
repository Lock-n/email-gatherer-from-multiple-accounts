<%@page import="java.util.ArrayList"%>
<%@page import="bd.core.MeuResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bd.daos.*, bd.dbos.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		String nome  = request.getParameter("nome");
		String senha = request.getParameter("senha");
		
		if(Users.cadastrado(nome))
		{
			User usu = Users.getUser(nome);
			
			if(senha.equals(usu.getPassword()))
			{
				
				MeuResultSet resultado= EmailAccounts.getEmailAccountsByUser(nome);
				EmailAccount contaE;
				ArrayList<EmailAccount> contasE = new ArrayList<EmailAccount>();
				
				do{
					contaE = new EmailAccount(resultado.getString("email"), resultado.getString("password"), resultado.getString("server_send_address"), 
			        		   resultado.getString("server_receive_address"), resultado.getString("server_send_protocol"),
			        		   resultado.getString("server_receive_protocol"), resultado.getInt("server_send_port"),
			        		   resultado.getInt("server_receive_port"), resultado.getString("name_user"));
					contasE.add(contaE);
				}while(resultado.next());
				
				session.setAttribute("name", nome);
				session.setAttribute("contasE", contasE);
				
				response.sendRedirect("hub.jsp");
			}
			else
			{
				response.sendRedirect("log_in_user.jsp?error=Senha incorreta");
			}
		}
		else
		{
		 	response.sendRedirect("log_in_user.jsp?error=Nome de usuario não existe");
		}
	
	%>

</body>
</html>
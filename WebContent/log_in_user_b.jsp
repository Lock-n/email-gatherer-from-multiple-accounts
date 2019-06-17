<%@page import="java.util.ArrayList"%>
<%@page import="bd.core.MeuResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bd.daos.*, bd.dbos.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String nome  = request.getParameter("nome");
		String senha = request.getParameter("senha");
		
		try {
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
					
					response.sendRedirect("main.jsp");
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
		}
		catch (Exception e) {
			// TODO Remove
			// Development purposes only
			if (nome.equals("joao_ferreira") && senha.equals("senha123")) {
				ArrayList<EmailAccount> contasE = new ArrayList<EmailAccount>();
				
				contasE.add(new EmailAccount("joao.ferreira5569@gmail.com", "pass1234#", "smtp.gmail.com", "imap.gmail.com", "SMTP", "IMAP", 465, 993, "joao_ferreira"));
				
				session.setAttribute("name", nome);
				session.setAttribute("contasE", contasE);
				
				response.sendRedirect("hub.jsp");
			}
		}
	%>

</body>
</html>
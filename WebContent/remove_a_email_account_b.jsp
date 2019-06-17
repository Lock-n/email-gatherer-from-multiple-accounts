<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bd.daos.*, bd.dbos.*" import="bd.core.MeuResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
          try{

     	 	String email = request.getParameter("email");
          	
          	EmailAccounts.excluir(email);
          	
          	MeuResultSet resultado= EmailAccounts.getEmailAccountsByUser((String)session.getAttribute("name"));
			EmailAccount contaE;
			ArrayList<EmailAccount> contasE = new ArrayList<EmailAccount>();
			do{
				contaE = new EmailAccount(resultado.getString("email"), resultado.getString("password"), resultado.getString("server_send_address"), 
		        		   resultado.getString("server_receive_address"), resultado.getString("server_send_protocol"),
		        		   resultado.getString("server_receive_protocol"), resultado.getInt("server_send_port"),
		        		   resultado.getInt("server_receive_port"), resultado.getString("name_user"));
				contasE.add(contaE);
			}while(resultado.next());
			session.setAttribute("contasE", contasE);
          	
          	
          	response.sendRedirect("main.jsp");
     	}
          catch(Exception erro){
               erro.printStackTrace();
	%>

          <p>Erro ao excluir conta, tente novamente mais tarde.</p>
     <%
          }
     %>


</body>
</html>
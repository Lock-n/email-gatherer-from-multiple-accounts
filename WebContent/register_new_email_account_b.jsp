<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bd.daos.*, bd.dbos.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	 	String email      = request.getParameter("email");
     	String password      = request.getParameter("password");
     	String server_address = request.getParameter("server_address"); 				// endereco do servidor de env
     	String server_protocol    = request.getParameter("server_protocol");					// protocolo de envio 
     	int    server_port    = Integer.parseInt(request.getParameter("server_port"));	// porta de envio
			
     	EmailAccount contaE = new EmailAccount(email, password, server_address, server_protocol, server_port);
     	
     	EmailAccounts.incluir(contaE);
     	//ligar a conta adicionada com o usuario que a adicionou, USAR A SESSION AQUI
	%>


</body>
</html>
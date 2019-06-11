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
          try{

     	 	String email            = request.getParameter("email");
          	String password         = request.getParameter("password");
          	String server_address   = request.getParameter("server_address"); 				// endereco do servidor de env
          	String server_protocol  = request.getParameter("server_protocol");					// protocolo de envio 
          	int    server_port      = Integer.parseInt(request.getParameter("server_port"));	// porta de envio
     		String name_user        = (String)session.getAttribute("name");// talvez tenha que ter request.getSession

          	EmailAccount contaE = new EmailAccount(email, password, server_address, server_protocol, server_port, name_user);
          	
          	EmailAccounts.incluir(contaE);
          	
          	response.sendRedirect("hub.jsp");
          }
          catch(Exception erro){
               erro.printStackTrace();
               
     %>
          <p>Erro ao cadastrar usuario, tente novamente mais tarde.</p>
     <%
          }
     %>
	


</body>
</html>
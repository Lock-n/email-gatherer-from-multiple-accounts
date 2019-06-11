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
          	String server_send_protocol  = request.getParameter("server_send_protocol");	// protocolo de envio 
          	String server_receive_protocol  = request.getParameter("server_receive_protocol");	// protocolo de recebimento 
          	int    server_send_port      = Integer.parseInt(request.getParameter("server_send_port"));	// porta de envio 
          	int    server_receive_port      = Integer.parseInt(request.getParameter("server_receive_port"));	// porta de recebimento
     		String name_user        = (String)session.getAttribute("name");// talvez tenha que ter request.getSession

          	EmailAccount contaE = new EmailAccount(email, password, server_address, server_send_protocol, server_receive_protocol, server_send_port, server_receive_port, name_user);
          	
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
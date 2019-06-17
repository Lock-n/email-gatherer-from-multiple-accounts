<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bd.daos.*, bd.dbos.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Por favor aguarde</title>
</head>
<body>

	<%
          try{

			String email            = request.getParameter("email");
			String password         = request.getParameter("password");
			String server_send_address   = request.getParameter("server_send_address"); 				// endereco do servidor de env
			String server_receive_address   = request.getParameter("server_receive_address"); 				// endereco do servidor de recepcao
			String server_send_protocol  = request.getParameter("server_send_protocol");	// protocolo de envio 
			String server_receive_protocol  = request.getParameter("server_receive_protocol");	// protocolo de recebimento 
			String server_send_ports      = request.getParameter("server_send_port");	// porta de envio 
			String server_receive_ports      = request.getParameter("server_receive_port");	// porta de recebimento
			String name_user        = (String)session.getAttribute("name");// talvez tenha que ter request.getSession

       		if (
         			(email == null) || (password == null) || (server_send_address == null) || (server_receive_address == null) ||
         			(server_send_protocol == null) || (server_receive_protocol == null) || (server_send_ports == null) ||
         			(server_receive_ports == null) || (name_user == null)
         			) {
       			response.sendRedirect("change_email_account.jsp?error=Dados incompletos");
       			return;
       		}
         		
         		
       		int server_receive_port = Integer.parseInt(server_receive_ports);
       		int server_send_port = Integer.parseInt(server_send_ports);
       		
           	EmailAccount contaE = new EmailAccount(email, password, server_send_address, server_receive_address, server_send_protocol, server_receive_protocol, server_send_port, server_receive_port, name_user);
          	
      		EmailAccounts.alterar(contaE);
          	response.sendRedirect("main.jsp");
          	return;
          }
          catch(Exception erro){
               erro.printStackTrace();
               response.sendRedirect("main.jsp?error=Erro ao alterar conta");
               return;
     %>
          <p>Erro ao alterar conta, tente novamente mais tarde.</p>
     <%
          }
     %>
	


</body>
</html>
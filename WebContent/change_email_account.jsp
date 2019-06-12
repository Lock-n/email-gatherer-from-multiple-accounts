<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bd.daos.*, bd.dbos.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Alterar Conta de Email</title>
</head>
<body>


	<form method="post" action="change_email_account_b.jsp">

		<label>Email:</label> 
		<input type="text" id="email" name="email">
		<br/>
		<label>Senha:</label> 
		<input type="password" id="password" name="password">
		<br/>
		<label>Endereço do servidor de envio:</label> 
		<input type="text" id="server_address" name="server_send_address">
		<br/>
		<label>Endereço do servidor de recepcao:</label> 
		<input type="text" id="server_address" name="server_receive_address">
		<br/>
		<label>Protocolo de envio:</label> 
		<input type="text" id="server_protocol" name="server_send_protocol">
		<br/>
		<label>Protocolo de recepcao:</label> 
		<input type="text" id="server_protocol" name="server_receive_protocol">
		<br/>
		<label>Porta de envio:</label> 
		<input type="text" id="server_port" name="server_send_port">
		<br/>
		<label>Porta de recepcao:</label> 
		<input type="text" id="server_port" name="server_receive_port">
		
		
		<br>
		<button>Alterar</button>
		
	</form>

</body>
</html>
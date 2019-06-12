<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bd.daos.*, bd.dbos.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Alterar Conta de Email</title>
</head>
<body>


	<form method="get" action="change_email_account_b.jsp">

		<label>Email da conta que sera alterada:</label> 
		<input type="text" id="email" name="email">
		<br/>
		<label>Nova senha:</label> 
		<input type="password" id="password" name="password">
		<br/>
		<label>Novo Endereço do servidor de envio:</label> 
		<input type="text" id="server_address" name="server_send_address">
		<br/>
		<label>Novo Endereço do servidor de recepcao:</label> 
		<input type="text" id="server_address" name="server_receive_address">
		<br/>
		<label>Novo protocolo de envio:</label> 
		<input type="text" id="server_protocol" name="server_send_protocol">
		<br/>
		<label>Novo protocolo de envio:</label> 
		<input type="text" id="server_protocol" name="server_send_protocol">
		<br/>
		<label>Nova porta de envio:</label> 
		<input type="text" id="server_port" name="server_port">
		<br/>
		<label>Nova porta de envio:</label> 
		<input type="text" id="server_port" name="server_port">
		<br/>
		
		<br>
		<button>Alterar</button>
		
	</form>

</body>
</html>
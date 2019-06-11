<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bd.daos.*, bd.dbos.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registrar Conta de Email</title>
</head>
<body>


	<form method="post" action="register_new_email_account_b.jsp">

		<label>Email:</label> 
		<input type="text" id="email" name="email">
		<br/>
		<label>Senha:</label> 
		<input type="password" id="password" name="password">
		<br/>
		<label>Endereço do servidor de envio:</label> 
		<input type="text" id="server_address" name="server_address">
		<br/>
		<label>Protocolo de envio:</label> 
		<input type="text" id="server_protocol" name="server_protocol">
		<br/>
		<label>Porta de envio:</label> 
		<input type="text" id="server_port" name="server_port">
		<br/>
		
		<br>
		<button>Cadastrar</button>
		
	</form>

</body>
</html>
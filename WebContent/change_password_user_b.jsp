<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bd.daos.*, bd.dbos.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Por favor aguarde...</title>
</head>
<body>
	<p> Por favor aguarde...</p>
	<%
		try{
			String nome  = (String)session.getAttribute("name");
			String senha = request.getParameter("nova_senha");
		
			User usuario= new User(nome, senha);
			
			Users.alterar(usuario);
		}
		catch(Exception erro){
			erro.printStackTrace();
			response.sendRedirect("sign_up_new_user.jsp?error=true");
	%>
			<p>Erro ao alterar senha de usuario, tente novamente mais tarde.</p>
	<%
		}
	%>

</body>
</html>
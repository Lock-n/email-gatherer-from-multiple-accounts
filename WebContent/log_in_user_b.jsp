<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bd.daos.*, bd.dbos.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		String nome  = request.getParameter("nome");
		String senha = request.getParameter("senha");
		
		if(Usuarios.cadastrado(nome))
		{
			Usuario usu = Usuarios.getUsuario(nome);
			
			if(senha.equals(usu.getSenha()))
			{
				%>
				<p> LOGIN BEM SUCEDIDO!
				<%
				//iniciar uma session para o usuario logado
				HttpSession sessao = request.getSession(true);
				sessao.setAttribute("nome", nome);
			}
			else
			{
				%>
				<p> SENHA INCORRETA!
				<%
			}
		}
		else
		{
		%><p> Nome de usuario não existe<%
		}
	
	%>

</body>
</html>
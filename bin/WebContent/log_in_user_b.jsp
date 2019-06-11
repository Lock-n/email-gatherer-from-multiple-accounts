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
		
		if(Users.cadastrado(nome))
		{
			User usu = Users.getUser(nome);
			
			if(senha.equals(usu.getPassword()))
			{
				%>
				<p> LOGIN BEM SUCEDIDO!
				<%
				//HttpSession session = request.getSession(true);///////nao sei se tem que iniciar///////	
				session.setAttribute("name", nome);
				response.sendRedirect("hub.jsp");
			}
			else
			{
				response.sendRedirect("log_in_user.jsp?error=Senha incorreta");
			}
		}
		else
		{
		 	response.sendRedirect("log_in_user.jsp?error=Nome de usuario não existe");
		}
	
	%>

</body>
</html>
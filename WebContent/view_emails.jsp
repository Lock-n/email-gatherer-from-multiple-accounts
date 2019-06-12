<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Usuário</title>
</head>
<body>

	<p> Por favor aguarde...</p>
	<%
		try{
			
			String[] contas = request.getParameterValues("contas")
		
			for(String conta : contas)
			{
				//chama o metedo de listar emails e passa a conta como parametro
			}


		}
		catch(Exception erro){
			erro.printStackTrace();
		}
	%>
			
	<form method="post" action="hub.jsp"> 

		<button>Voltar hub</button>
		
	 </form> 



</body>
</html>
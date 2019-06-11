<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>

<script>

function correto()
{
	if((document.getElementById("nome").value == "") || (document.getElementById("senha").value == ""))
	{
		alert("PREENCHA TODOS OS CAMPOS!");
		return;
	}

}

</script>
	
	  <form method="post" action="log_in_user_b.jsp"> 

		<label>Nome:</label> 
		<input type="text" id="nome" name="nome">
		<br/>
		<label>Senha:</label> 
		<input type="password" id="senha" name="senha">
		<br/>
		<br>
		<button onclick="correto()">Login</button>
		
	 </form> 
	


</body>
</html>
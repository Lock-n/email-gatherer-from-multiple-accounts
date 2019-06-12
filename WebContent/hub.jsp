<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HUB</title>
</head>
<body>

<script>

<%	
	
	String addConta = request.getParameter("addConta");
	String altConta = request.getParameter("altConta");
	String excConta = request.getParameter("excConta");
	String verConta = request.getParameter("verConta");
	String altSenha = request.getParameter("altSenha");
	String encSessao = request.getParameter("encSessao");

	if(addConta!=null)
		if(addConta.equals("true"))
			response.sendRedirect("register_new_email_account.jsp");
	
	if(altConta!=null)
		if(altConta.equals("true"))
			response.sendRedirect("change_email_account.jsp");
	
	if(excConta!=null)
		if(excConta.equals("true"))
			response.sendRedirect("remove_a_email_account.jsp");
	
	if(verConta!=null)
		if(verConta.equals("true"))
			response.sendRedirect("list_email_accounts_b.jsp");
	
	if(altSenha!=null)
		if(altSenha.equals("true"))
			response.sendRedirect("change_password_user.jsp");
	
	if(encSessao!=null)
		if(encSessao.equals("true"))
		{
			session.invalidate();
			response.sendRedirect("index.jsp");
	
		}
%>

function AdicionarConta(){
	document.getElementById("addConta").value = "true";
	document.getElementById("form").submit();
}

function AlterarConta(){
	document.getElementById("altConta").value = "true";
	document.getElementById("form").submit();
}

function ExcluirConta(){
	document.getElementById("excConta").value = "true";
	document.getElementById("form").submit();
}

function VerContas(){
	document.getElementById("verConta").value = "true";
	document.getElementById("form").submit();
}

function AlterarSenha(){
	document.getElementById("altSenha").value = "true";
	document.getElementById("form").submit();
}

function EncerrarSessao(){
	document.getElementById("encSessao").value = "true";
	document.getElementById("form").submit();
}

</script>
	
	
 <form method="get" action="hub.jsp" id="form"> 

	<input type="hidden" id="addConta" name="addConta">
	<input type="hidden" id="altConta" name="altConta">
	<input type="hidden" id="excConta" name="excConta">
	<input type="hidden" id="verConta" name="verConta">
	<input type="hidden" id="altSenha" name="altSenha">
	<input type="hidden" id="encSessao" name="encSessao">
    
    <button onclick="AdicionarConta()">Adicionar Conta de Email</button>
    <br/>
    <button onclick="AlterarConta()">Alterar Conta de Email</button>
    <br/>
    <button onclick="ExcluirConta()">Excluir Conta de Email</button>
    <br/>
    <button onclick="VerContas()">Ver Contas de Email</button>
    <br/>
    <button onclick="AlterarSenha()">Alterar senha de usuario</button>
    <br/>
    <button onclick="EncerrarSessao()">Encerrar sessao</button>
    

 </form> 
	


</body>
</html>
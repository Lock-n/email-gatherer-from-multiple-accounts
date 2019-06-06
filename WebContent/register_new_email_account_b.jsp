<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bd.daos.*, bd.dbos.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	 	String login      = request.getParameter("login");
     	String senha      = request.getParameter("senha");
     	String endServEnv = request.getParameter("endServEnv"); 				// endereco do servidor de env
     	String protEnv    = request.getParameter("protEnv");					// protocolo de envio 
     	int    portEnv    = Integer.parseInt(request.getParameter("portEnv"));	// porta de envio
     	String endServRec = request.getParameter("endServRec");					// endereco de servidor de recepcao
     	String protRec    = request.getParameter("protRec");					// protocolo de recepcao
     	int    portRec    = Integer.parseInt(request.getParameter("portRec"));	// porta de recpcao
			
     	ContaEmail contaE = new ContaEmail(login, senha, endServEnv, protEnv, portEnv, endServRec, protRec, portRec);
     	
     	ContasEmails.incluir(contaE);
     	//ligar a conta adicionada com o usuario que a adicionou, USAR A SESSION AQUI
	%>


</body>
</html>
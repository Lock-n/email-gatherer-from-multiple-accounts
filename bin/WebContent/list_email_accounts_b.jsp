<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bd.daos.*, bd.dbos.*, bd.core.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<table>
	<%
	try
	{
		MeuResultSet resultado = EmailAccounts.getContasEmails();
		
			
		while(resultado.next())
		{
	%>
		<tr>			
			<th>Email: <%=resultado.getString("email") %></th>			    
		</tr>
	
	
	<%
		}
	}
	catch(Exception erro)
	{
	%>
	<p>Deu erro, <%=erro.toString() %></p>
	<%
	} 
	%>
	</table>

</body>
</html>
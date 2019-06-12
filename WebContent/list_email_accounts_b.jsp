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
		String name = (String)session.getAttribute("name");
		MeuResultSet resultado = EmailAccounts.getEmailAccountsByUser(name);
		
			
		
		do{
	%>
		<tr>			
			<th>Email: <%=resultado.getString("email") %></th>			    
		</tr>
	
	
	<%
		}
		while(resultado.next());
		
		//response.sendRedirect("hub.jsp");
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
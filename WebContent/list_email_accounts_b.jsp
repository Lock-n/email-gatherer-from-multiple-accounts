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
	{		//request.getParameterValues(name)
		String name = (String)session.getAttribute("name");
		MeuResultSet resultado = EmailAccounts.getEmailAccountsByUser(name);
		
		%><form action="hub.jsp" method="post"> <% 
		
		do{
	%>

							
			<tr>
				<th>
				<input type="checkbox" name="conta" value=<%=resultado.getString("email") %>>
				<%=resultado.getString("email") %>
				</th>			    
			</tr>	
			
	
	<%
		}while(resultado.next());
		
		%> 
		<
		
		</form>
		
		<%
		
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
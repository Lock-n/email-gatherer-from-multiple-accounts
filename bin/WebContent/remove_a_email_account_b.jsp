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
          try{

     	 	String email = request.getParameter("email");
          	
          	EmailAccounts.excluir(email);

     	}
          catch(Exception erro){
               erro.printStackTrace();
	%>

          <p>Erro ao excluir conta, tente novamente mais tarde.</p>
     <%
          }
     %>


</body>
</html>
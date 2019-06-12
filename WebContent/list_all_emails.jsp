<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bd.daos.*, bd.dbos.*, java.util.Properties, javax.mail.*, java.io.File,
java.io.FileInputStream, email.EmailHelper, java.util.Queue, java.util.LinkedList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List all emails</title>
</head>
<body>
	<% 
		String email = "joao.ferreira5569@gmail.com";
		String password = "pass1234#";
		String server_send_address = "smtp.gmail.com";
		String server_receive_address = "imap.gmail.com";
		String server_send_protocol = "SMTP";
		String server_receive_protocol = "POP3";
		int server_send_port = 465;
		int server_receive_port = 993;
		String name_user = "joao_ferreira";
	
		
		Properties props = new Properties();
		  try {
			  Store store;
			  switch (server_receive_protocol) {
			  case "IMAP":
				  props.put("mail.imap.ssl.enable", "true"); // required for Gmail
				  Session mail_session = Session.getDefaultInstance(props, null);

				  store = mail_session.getStore("imaps");
				  break;
			  case "POP3":
				  props.put("mail.pop3.host", server_receive_address);
				  props.put("mail.pop3.port", server_receive_port);
				  props.put("mail.pop3.starttls.enable", "true");
			      Session emailSession = Session.getDefaultInstance(props);
			  
			      //create the POP3 store object and connect with the pop server
			      store = emailSession.getStore("pop3s");
			      break;
			  default:
				  return;
			  }
			  
			  store.connect(server_receive_address, email, password);

			  Queue<Folder> folders = new LinkedList<>();
			  ((LinkedList)folders).addAll(Arrays.asList(store.getDefaultFolder().list()));
			  
			  while  (!folders.isEmpty()) {
				  Folder f = folders.poll();
				  
				  if ((f.getType() & Folder.HOLDS_MESSAGES) != 0) {
					  %>
					  <b><%= f.getName() %></b>
					  <br>
					  <%
					  f.open(Folder.READ_ONLY);
					  request.setAttribute("messageCount", f.getMessageCount());
					  request.setAttribute("messages", f.getMessages());					
					  %> 
					  <b>Total Messages: - ${messageCount}</b>
					  
					  <hr>
					   
					  <c:forEach items="${messages}" var="message">
					  	<p>Mail Subject: ${message.getSubject()} <br>
					  	Sent Date: ${message.getSentDate()} <br>
					  	Content: ${EmailHelper.getTextFromMessage(message)}
					  	</p>
					  </c:forEach>
					  
					  <%
					  request.removeAttribute("messages");
					  f.close(true);
				  }
				  
				  if ((f.getType() & Folder.HOLDS_FOLDERS) != 0) {
					  folders.addAll(Arrays.asList(f.list()));						  
				  }
			  }
			  store.close();

		  } catch (Exception e) {
			  %>
		   	<%= e.getMessage() %>
		   	<%
		   	e.printStackTrace();
		  }
	%>
</body>
</html>
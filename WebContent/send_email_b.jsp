<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %> 
<% String result; 
   String subject = request.getParameter("assunto"); 
   String from = "joao.ferreira5569@gmail.com"; //deve pegar o email selecionado pelo usuario
   String to = request.getParameter("destino"); 
   String cc = request.getParameter("destinocc"); 
   String cco = request.getParameter("destinocco"); 
   String messageText = request.getParameter("texto"); 
   String tipo = request.getParameter("tipo"); 
   //File filename = new File(request.getParameter("anexo"));
   //String filename = request.getParameter("anexo");
   //String filename = "C:/Users/u17046/Desktop/callofdutybo2.jpg";
   //String filename = new File(request.getParameter("anexo")).getName();
   //String host = "smtp.gmail.com"; 
   
   Properties properties = System.getProperties(); 
   properties.setProperty("mail.smtp.host", "smtp.gmail.com"); 
   properties.setProperty("mail.user", "joao.ferreira5569@gmail.com"); //pegar o usuario atual
   properties.setProperty("mail.password", "pass1234#"); //pegar a senha do usuario
   Session mailSession = Session.getDefaultInstance(properties); 
   
   try{ 
	   
       MimeMessage message = new MimeMessage(mailSession);
       message.setFrom(new InternetAddress(from)); 
       
       //message.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); 
       //message.addRecipient(Message.RecipientType.CC, new InternetAddress(cc)); 
       //message.addRecipient(Message.RecipientType.BCC, new InternetAddress(cco)); 
       
       message.addRecipient(Message.RecipientType.TO, new InternetAddress("valle.drik2@gmail.com")); 
       message.addRecipient(Message.RecipientType.CC, new InternetAddress("valle.drik3@gmail.com")); 
       message.addRecipient(Message.RecipientType.BCC, new InternetAddress("valle.drik4@gmail.com")); 
       
       
       BodyPart messageBodyPart = new MimeBodyPart(); 
       messageBodyPart.setText("Esse é o corpo da mensagem"); 
       Multipart multipart = new MimeMultipart(); 
       multipart.addBodyPart(messageBodyPart); 
       messageBodyPart = new MimeBodyPart();
       DataSource source = new FileDataSource("C:/Users/u17046/Desktop/callofdutybo2.jpg"); 
       messageBodyPart.setDataHandler(new DataHandler(source)); 
       messageBodyPart.setFileName("C:/Users/u17046/Desktop/callofdutybo2.jpg"); 
       multipart.addBodyPart(messageBodyPart);   
       message.setContent(multipart); 
       Transport.send(message); 
       String title = "Enviar email"; 
       result = "Mensagem enviada com sucesso!"; 
       
    }
    catch (MessagingException mex) { 
       mex.printStackTrace(); 
       result = "Erro no envio da mensagem. Tente novamente!"; 
   }
 %> 
<html> 
<head> 
<title>Enviar email</title> 
</head> 
<body> 
<center> <h1>Enviando arquivo usando JSP...</h1> </center> 
<p align="center"> 
<% out.println("Resultado: " + result + "\n"); %> 
</p>
</body>
</html>
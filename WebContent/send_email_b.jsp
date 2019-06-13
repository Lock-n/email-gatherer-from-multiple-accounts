<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %> 

<% 

	String result; 
//	String subject = request.getParameter("assunto"); 
	//String from = "joao.ferreira5569@gmail.com"; //deve pegar o email selecionado pelo usuario
	
//	String messageText = request.getParameter("texto"); 
	//String tipo = request.getParameter("tipo"); 
   //File filename = new File(request.getParameter("anexo"));
   //String filename = request.getParameter("anexo");
   //String filename = "C:/Users/u17046/Desktop/callofdutybo2.jpg";
   //String filename = new File(request.getParameter("anexo")).getName();
   //String host = "smtp.gmail.com"; 
  	final String username = "joao.ferreira5569@gmail.com";
   	final String senha = "pass1234#";
   
   	Properties properties = System.getProperties(); 
   	properties.put("mail.smtp.host", "smtp.gmail.com"); 
   	//properties.put("mail.user", "joao.ferreira5569@gmail.com"); //pegar o usuario atual
   	//properties.put("mail.password", "pass1234#"); //pegar a senha do usuario
   	properties.put("mail.smtp.auth", "true");
   	properties.put("mail.smtp.starttls.enable", "true");
   	
   	//Session mailSession = Session.getDefaultInstance(properties); 
   
   	Session mailSession = Session.getInstance(properties,
            new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, senha);
                }
   		});
   	
	try{ 
		   
       MimeMessage message = new MimeMessage(mailSession);
       
       
       InternetAddress[] destinos = null;
       InternetAddress[] destinoscc = null;
       InternetAddress[] destinoscco = null;


       destinos = InternetAddress.parse("valle.drik2@gmail.com");//(request.getParameter("destino"));
       message.setRecipients(Message.RecipientType.TO,destinos);



       destinoscc = InternetAddress.parse("valle.drik3@gmail.com"); //(request.getParameter("destinocc"));
       message.setRecipients(Message.RecipientType.CC,destinoscc);


       destinoscco = InternetAddress.parse("valle.drik4@gmail.com"); //(request.getParameter("destinocco"));
       message.setRecipients(Message.RecipientType.BCC,destinoscco);    
       
       message.setFrom(new InternetAddress("joao.ferreira5569@gmail.com")); 
       
       message.setSubject("assunto");
       
       
      /* MimeMultipart multipart = new MimeMultipart("related");
       MimeBodyPart messageBodyPart = new MimeBodyPart();

       messageBodyPart.setContent(request.getParameter("texto"), "text/"+request.getParameter("tipo"));
       multipart.addBodyPart(messageBodyPart);
       
       
       message.addRecipient(Message.RecipientType.TO, new InternetAddress("valle.drik2@gmail.com")); 
       message.addRecipient(Message.RecipientType.CC, new InternetAddress("valle.drik3@gmail.com")); 
       message.addRecipient(Message.RecipientType.BCC, new InternetAddress("valle.drik4@gmail.com")); */
       
       
       MimeBodyPart messageBodyPart = new MimeBodyPart(); 
       messageBodyPart.setText("Esse é o corpo da mensagem"); 
       
       MimeMultipart multipart = new MimeMultipart(); 
       
       multipart.addBodyPart(messageBodyPart); 
       
       message.setContent(multipart); 
       
       
       Transport.send(message); 
       
       Transport transport = mailSession.getTransport("smtp");
       
       transport.connect("smtp.gmail.com", username, senha);
       transport.sendMessage(message, message.getAllRecipients());
       transport.close();
       
       
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
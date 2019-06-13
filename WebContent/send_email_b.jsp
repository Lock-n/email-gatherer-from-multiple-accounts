<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %> 

<%

String result ="Nao entrou"; 
String texto = request.getParameter("texto"); 
if(texto != null && !texto.equals(""))
{

	
	String subject = request.getParameter("assunto"); 

    String assunto = request.getParameter("assunto"); 

   String host = "smtp.gmail.com"; 
  	
   
   final String name_email_user = "joao.ferreira5569@gmail.com";
   	final String senha = "pass1234#";

   	
   	Properties properties = System.getProperties(); 
   	properties.put("mail.smtp.host", host); 
   	properties.put("mail.smtp.auth", "true");
   	properties.put("mail.smtp.starttls.enable", "true");
   	
   	Session mailSession = Session.getInstance(properties,
            new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(name_email_user, senha);
                }
   		});
   	
	try{ 
		   
       MimeMessage message = new MimeMessage(mailSession);
       
       
       InternetAddress[] destinos = null;
       InternetAddress[] destinoscc = null;
       InternetAddress[] destinoscco = null;


       if(request.getParameter("destino")!= null && !request.getParameter("destino").equals(""))
       {
           destinos = InternetAddress.parse(request.getParameter("destino"));
           message.setRecipients(Message.RecipientType.TO,destinos);
       }

       if(request.getParameter("destinocc")!= null && !request.getParameter("destinocc").equals(""))
       {
           destinoscc = InternetAddress.parse(request.getParameter("destinocc"));
           message.setRecipients(Message.RecipientType.CC,destinoscc);
       }

       if(request.getParameter("destinocco")!= null && !request.getParameter("destinocco").equals(""))
       {
           destinoscco = InternetAddress.parse(request.getParameter("destinocco"));
           message.setRecipients(Message.RecipientType.BCC,destinoscco);
       }
      
       
       message.setFrom(new InternetAddress(name_email_user)); 
       
       message.setSubject(assunto);
       
       
       
       MimeBodyPart messageBodyPart = new MimeBodyPart(); 
       messageBodyPart.setText(texto); 
       
       MimeMultipart multipart = new MimeMultipart(); 
       
       multipart.addBodyPart(messageBodyPart); 
       
       message.setContent(multipart); 
       
       
       Transport.send(message); 
       
       Transport transport = mailSession.getTransport("smtp");
       
       transport.connect("smtp.gmail.com", name_email_user, senha);
       transport.sendMessage(message, message.getAllRecipients());
       transport.close();
       
       
       String title = "Enviar email"; 
       result = "Mensagem enviada com sucesso!"; 
       
    }
    catch (MessagingException mex) { 
       mex.printStackTrace(); 
       result = "Erro no envio da mensagem. Tente novamente!"; 
   }
}
 %> 
<html> 
<head> 
<title>Enviar email</title> 
</head> 
<body> 
<center> <h1>Enviando arquivo usando JSP...</h1> </center> 
<p align="center"> 
<% out.println("Resultado: " + result + "\n");
	out.println("Resultado: " + texto + "\n");
%> 
</p>
</body>
</html>
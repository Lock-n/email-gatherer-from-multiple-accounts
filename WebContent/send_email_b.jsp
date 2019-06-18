<%@page import="bd.dbos.EmailAccount, java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %> 

<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("index.jsp");
	return;
}

String result ="<script>alert('Erro ao enviar a mensagem, tente novamente!');</script>"; 
String texto = request.getParameter("texto"); 
if(texto != null && !texto.equals(""))
{

    String assunto = request.getParameter("assunto"); 
    
    String filesname = request.getParameter("anexo");    
  	
    String tipo = request.getParameter("tipo");
   
   	final String name_email = request.getParameter("name_email");//"joao.ferreira5569@gmail.com";
   	
   	if ((assunto == null) || (filesname == null) || (tipo == null) || (name_email == null))
   	{
   		response.sendRedirect("send_email.jsp?error=Dados incompletos ou inválidos");
   		return;
   	}
   		
   	
   	String[] vetFiles = filesname.split(",");
   	tipo = tipo.toLowerCase();
   	
   	ArrayList<EmailAccount> contasE = (ArrayList<EmailAccount>)session.getAttribute("contasE");
   	EmailAccount contaE = null;
   	
   	Iterator<EmailAccount> it = contasE.iterator();
   	while (it.hasNext())
	{
   		EmailAccount account = it.next();
		if(name_email.equals(account.getEmail()))
		{
			contaE = account;
			break;
		}
	}  	

   	if (contaE == null) {
   		response.sendRedirect("send_email.jsp?error=Dados incompletos ou inválidos");
   		return;
   	}
   	
   	final String senha = contaE.getPassword();//"pass1234#";
   	String host = contaE.getServer_send_protocol();//"smtp.gmail.com"; 
   	
   	Properties properties = System.getProperties(); 
   	properties.put("mail.smtp.host", host); 
   	properties.put("mail.smtp.auth", "true");
   	properties.put("mail.smtp.starttls.enable", "true");
   	
   	Session mailSession = Session.getInstance(properties,
            new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(name_email, senha);
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
      
       
       message.setFrom(new InternetAddress(name_email)); 
       
       message.setSubject(assunto);
       
       
       
       MimeBodyPart messageBodyPart = new MimeBodyPart(); 
       messageBodyPart.setText(texto); 
       
       MimeMultipart multipart = new MimeMultipart(); 
       
       multipart.addBodyPart(messageBodyPart); 
       
       if (filesname != null && !filesname.trim().isEmpty()) {
           for (int i = 0; i < vetFiles.length; i++) 
           {
               MimeBodyPart attachPart = new MimeBodyPart();

               try 
               {
                   attachPart.attachFile(new File(vetFiles[i]));
               } catch (IOException ex) 
               {
                   ex.printStackTrace();
               }

                multipart.addBodyPart(attachPart);
           }
       }
       
       if(tipo.equals("html")) {
    	   MimeBodyPart bodyPart = new MimeBodyPart();
    	   bodyPart.setContent(texto, "text/html");
    	   
    	   multipart.addBodyPart(bodyPart, 0);
       }    
       //message.setContent(m_body,"text/plain");
       
       message.setContent(multipart); 
       
       Transport transport = mailSession.getTransport("smtp");
       
       transport.connect(contaE.getServer_send_address(), name_email, senha);
       transport.sendMessage(message, message.getAllRecipients());
       transport.close();
       
       
       String title = "Enviar email"; 
       result = "<script>alert('Mensagem enviada com sucesso!');" +
       "</script>";
       
       response.sendRedirect("main.jsp");
       }
    catch (MessagingException mex) { 
       //result = "<script>alert('Erro ao enviar a mensagem, tente novamente!');</script>";
       mex.printStackTrace();
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
<%= "Resultado: " + result + "\n" %> 
</p>
</body>
</html>
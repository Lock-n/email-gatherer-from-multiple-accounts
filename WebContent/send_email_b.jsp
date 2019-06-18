<%@page import="bd.dbos.EmailAccount, java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.*" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.disk.*" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.servlet.*" %>

<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("index.jsp");
	return;
}
final String filePath = "C:\\Temp\\arquivos-servidor\\";
String result ="<script>alert('Erro ao enviar a mensagem, tente novamente!');</script>";

String texto = null;
String assunto = null;
String tipo = "html";
String name_email = null;
String destino = null;
String destinocc = null;
String destinocco = null;

LinkedList<File> files_to_be_uploaded = new LinkedList<File>();
DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setSizeThreshold(5000 * 1024);
factory.setRepository(new File("c:\\temp"));
ServletFileUpload upload = new ServletFileUpload(factory);
upload.setSizeMax(5000 * 1024);

try{ 
   List fileItems = upload.parseRequest(new ServletRequestContext(request));
   
   Iterator i = fileItems.iterator();
   
   while (i.hasNext()) 
   {
      FileItem fi = (FileItem)i.next();
      if ( !fi.isFormField () )  {
          String fieldName = fi.getFieldName();
          String fileName = fi.getName().split("/")[0].split("\\\\")[0];
          //boolean isInMemory = fi.isInMemory();
          //long sizeInBytes = fi.getSize();
          File file = new File( filePath + fileName);
          fi.write(file) ;
          files_to_be_uploaded.add(file);
          //out.println("Uploaded Filename: " + filePath + fileName + "<br>");
      }
      else {
    	  switch (fi.getFieldName()) {
    	  case "texto":
    		  texto = fi.getString();
    		  break;
    	  case "assunto":
    		  assunto = fi.getString();
    		  break;
    	  case "tipo":
    		  tipo = fi.getString();
    		  break;
    	  case "name_email":
    		  name_email = fi.getString();
    		  break;
    	  case "destino":
    		  destino = fi.getString();
    		  break;
    	  case "destinocc":
    		  destinocc = fi.getString();
    		  break;
    	  case "destinocco":
    		  destinocco = fi.getString();
    		  break;
    	  }
      }
   }
   
   if ((texto == null || texto.isEmpty()) || (assunto == null || assunto.isEmpty())
	|| (tipo == null || tipo.isEmpty()) || (name_email == null || name_email.isEmpty())) {
	   response.sendRedirect("send_email_b.jsp?error=Dados%20incompletos");
	   return;
   }
   
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
 		response.sendRedirect("send_email.jsp?error=Dados%20incompletos%20ou%20inválidos");
 		return;
 	}
 	
 	final String senha = contaE.getPassword();
 	String host = contaE.getServer_send_protocol();
 	
 	Properties properties = System.getProperties(); 
 	properties.put("mail.smtp.host", host); 
 	properties.put("mail.smtp.auth", "true");
 	properties.put("mail.smtp.starttls.enable", "true");
 	
 	final String final_name_email = name_email;
 	Session mailSession = Session.getInstance(properties,
          new javax.mail.Authenticator() {
              protected PasswordAuthentication getPasswordAuthentication() {
                  return new PasswordAuthentication(final_name_email, senha);
              }
 		});
 	
	//try{ 
     MimeMessage message = new MimeMessage(mailSession);
     
     InternetAddress[] destinos = null;
     InternetAddress[] destinoscc = null;
     InternetAddress[] destinoscco = null;


     if(destino != null && !destino.isEmpty())
     {
         destinos = InternetAddress.parse(destino);
         message.setRecipients(Message.RecipientType.TO,destinos);
     }

     if(destinocc != null && !destinocc.isEmpty())
     {
         destinoscc = InternetAddress.parse(destinocc);
         message.setRecipients(Message.RecipientType.CC,destinoscc);
     }

     if(destinocco != null && !destinocco.isEmpty())
     {
         destinoscco = InternetAddress.parse(destinocco);
         message.setRecipients(Message.RecipientType.BCC,destinoscco);
     }
    
     
     message.setFrom(new InternetAddress(name_email)); 
     
     message.setSubject(assunto);
     
     MimeMultipart multipart = new MimeMultipart(); 
     
     {
    	MimeBodyPart bodyPart = new MimeBodyPart();
    	 
    	if(tipo.equals("html")) {
      	   bodyPart.setContent(texto, "text/html");
       }
       else {
    	   bodyPart.setText(texto);
       }
    	 
    	multipart.addBodyPart(bodyPart, 0);
     }
     
     if (!files_to_be_uploaded.isEmpty()) {
  	   Iterator<File> it2 = files_to_be_uploaded.iterator();
  	   while (it2.hasNext()) {
  		   MimeBodyPart attachPart = new MimeBodyPart();

             try 
             {
                 attachPart.attachFile(it2.next());
             } catch (IOException ex) 
             {
                 ex.printStackTrace();
             }

              multipart.addBodyPart(attachPart);
  	   }
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
}catch(Exception ex) {
   ex.printStackTrace();
}

//=========================================================
  

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
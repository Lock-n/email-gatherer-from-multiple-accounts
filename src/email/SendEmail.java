package email;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
 
import javax.mail.*;
import javax.mail.Message;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.*;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author u17046, u17168, u17172
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,   // 2MB
                maxFileSize = 1024 * 1024 * 10,         // 10MB
                maxRequestSize = 1024 * 1024 * 50)      // 50MB
public class SendEmail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private String resultado;
    public  List<File> uploadedFiles;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        try 
        {
            uploadedFiles = saveUploadedFiles(request);

            Properties propriedades = new Properties();
                    Session minhaSessao;
                    Store minhaStore;
                    final String username = "contajavamail1@gmail.com";
                    final String senha = "javamail";

                    propriedades.put("mail.smtp.host", "smtp.gmail.com");
                    propriedades.put("mail.smtp.port", "587");
                    propriedades.put("mail.smtp.auth", "true");
                    propriedades.put("mail.smtp.starttls.enable", "true");

                    Session sessaoDoEmail = Session.getInstance(propriedades,
                    new javax.mail.Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(username, senha);
                        }
                    });

                    MimeMessage msg = new MimeMessage(sessaoDoEmail);

                    InternetAddress[] destinos = null;
                    InternetAddress[] destinoscc = null;
                    InternetAddress[] destinoscco = null;

                    if(request.getParameter("destino")!= null & !request.getParameter("destino").equals(""))
                    {
                        destinos = InternetAddress.parse(request.getParameter("destino"));
                        msg.setRecipients(Message.RecipientType.TO,destinos);
                    }

                    if(request.getParameter("destinocc")!= null & !request.getParameter("destinocc").equals(""))
                    {
                        destinoscc = InternetAddress.parse(request.getParameter("destinocc"));
                        msg.setRecipients(Message.RecipientType.CC,destinoscc);
                    }

                    if(request.getParameter("destinocco")!= null & !request.getParameter("destinocco").equals(""))
                    {
                        destinoscco = InternetAddress.parse(request.getParameter("destinocco"));
                        msg.setRecipients(Message.RecipientType.BCC,destinoscco);
                    }



                    msg.setFrom(new InternetAddress(username));
                    msg.setSubject(request.getParameter("assunto"));


                    MimeMultipart multipart = new MimeMultipart("related");
                    MimeBodyPart messageBodyPart = new MimeBodyPart();

                    messageBodyPart.setContent(request.getParameter("texto"), "text/"+request.getParameter("tipo"));
                    multipart.addBodyPart(messageBodyPart);
                    
                    if (uploadedFiles != null && uploadedFiles.size() > 0) {
                    for (File aFile : uploadedFiles) 
                    {
                        MimeBodyPart attachPart = new MimeBodyPart();

                        try 
                        {
                            attachPart.attachFile(aFile);
                        } catch (IOException ex) 
                        {
                            ex.printStackTrace();
                        }
 
                         multipart.addBodyPart(attachPart);
                    }
                    
                    msg.setContent(multipart);
                
                
                Transport transport = sessaoDoEmail.getTransport("smtp");
                
                transport.connect("smtp.gmail.com", username, senha);
                transport.sendMessage(msg, msg.getAllRecipients());
                transport.close();
        }

                resultado = "<h1>Email enviado!</h1>";
            } catch (Exception ex) 
            {
                ex.printStackTrace();
               resultado = "<h1>Erro:" + ex.getMessage()+"</h1>";
            } finally 
        {
                deleteUploadFiles(uploadedFiles);
                
                response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Enviar email</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println(resultado);
            out.println("<h1>Enviar email</h1>\n" +
"        <form action=\"enviarEmail\" method=\"post\" enctype=\"multipart/form-data\">\n" +
"            Assunto:\n" +
"            <input type=\"text\" name=\"assunto\" id=\"assunto\" placeholder=\"Assunto\">           \n" +
"            </br>\n" +
"            </br>\n" +
"            Destino:\n" +
"            <input type=\"text\" name=\"destino\" id=\"destino\" placeholder=\"Destino\">\n" +
"            </br>\n" +
"            </br>\n" +
"            DestinoCC:\n" +
"            <input type=\"text\" name=\"destinocc\" id=\"destinocc\" placeholder=\"DestinoCC\">\n" +
"            </br>\n" +
"            </br>\n" +
"            DestinoCCO:\n" +
"            <input type=\"text\" name=\"destinocco\" id=\"destinocco\" placeholder=\"DestinoCCO\">\n" +
"            </br>\n" +
"            </br>\n" +
"            Texto:\n" +
"            <textarea name=\"texto\" id=\"texto\" placeholder=\"Texto\" cols=\"40\" rows=\"5\"></textarea>\n" +
"            </br>\n" +
"            </br>\n" +
"            Tipo:\n" +
"            <input type=\"text\" name=\"tipo\" id=\"tipo\" placeholder=\"plain,html,...\" size=\"25\">\n" +
"            </br>\n" +
"            </br>\n" +
"            Anexo\n" +
"            <input type=\"file\" name=\"anexo\" id=\"anexo\" size=\"50\" multiple>\n" +
"            </br>\n" +
"            </br>\n" +
"            <input type=\"submit\" value=\"Enviar\">\n" +
"        </form>\n" +
"    </body>");
            out.println("</body>");
            out.println("</html>");
        }
                
            }
        }
 
    /**
     * Saves files uploaded from the client and return a list of these files
     * which will be attached to the e-mail message.
     */
    private List<File> saveUploadedFiles(HttpServletRequest request)
            throws IllegalStateException, IOException, ServletException {
        List<File> listFiles = new ArrayList<File>();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        Collection<Part> multiparts = request.getParts();
        if (multiparts.size() > 0) {
            for (Part part : request.getParts()) {
                // creates a file to be saved
                String fileName = extractFileName(part);
                if (fileName == null || fileName.equals("")) {
                    // not attachment part, continue
                    continue;
                }
                 
                File saveFile = new File(fileName);
                System.out.println("saveFile: " + saveFile.getAbsolutePath());
                FileOutputStream outputStream = new FileOutputStream(saveFile);
                 
                // saves uploaded file
                InputStream inputStream = part.getInputStream();
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                outputStream.close();
                inputStream.close();
                 
                listFiles.add(saveFile);
            }
        }
        return listFiles;
    }
 
    /**
     * Retrieves file name of a upload part from its HTTP header
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return null;
    }
     
    /**
     * Deletes all uploaded files, should be called after the e-mail was sent.
     */
    private void deleteUploadFiles(List<File> listFiles) {
        if (listFiles != null && listFiles.size() > 0) {
            for (File aFile : listFiles) {
                aFile.delete();
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

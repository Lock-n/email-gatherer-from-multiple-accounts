<%@page import="java.util.ArrayList"%>
<%@page import="bd.dbos.EmailAccount"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Enviar Email</title>
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
      <link rel="stylesheet" href="./css/style.css">

  
</head>

<body>

  <div class="form">
      
      <!--
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>-->
      
      <div class="tab-content">
        
        <div >   
          <h1>Envie um email</h1>
          
          <form action="send_email_b.jsp" method="post">
          
           
          <div class="field-wrap">
            
            <span >Selecione a conta de email</span>

            
            <div class="select-style">
            <select class="select-style" name="name_email" id="name_email">
			<%
			ArrayList<EmailAccount> contasE = (ArrayList<EmailAccount>)session.getAttribute("contasE");
				for(EmailAccount conta : contasE)
				{
					%> <option value="<%=conta.getEmail()%>"> <%=conta.getEmail() %> </option> <%
				}
			%>
			</select>
			</div>
          </div>
          
          <div class="field-wrap">
            <label>
              Assunto<span class="req">*</span>
            </label>
            <input type="text" name="assunto" id="assunto" required autocomplete="off"/>
          </div>
          
           <div class="field-wrap">
            <label>
              Destino<span class="req">*</span>
            </label>
            <input type="text" name="destino" id="destino" required autocomplete="off"/>
          </div>
          

           <div class="field-wrap">
            <label>
              DestinoCC
            </label>
            <input type="text" name="destinocc" id="destinocc" />
          </div>
          
          
           <div class="field-wrap">
            <label>
              DestinoCCO
            </label>
            <input type="text" name="destinocco" id="destinocco" />
          </div>
          
           <div class="field-wrap">
            <label>
             Texto<span class="req">*</span>
            </label>
            <textarea type="text" name="texto" id="texto" cols="40" rows="5" required autocomplete="off"/></textarea>
          </div>
          
           <div class="field-wrap">
            <label>
              Tipo
            </label>
            <input type="text" name="tipo" id="tipo" />
          </div>
          
           <div class="field-wrap">
            <label>
              Anexo
            </label>
            <input type="file" name="anexo" multiple = "multiple" id="anexo" size="50">
          </div>
          
         
         
         
          <button type="submit" class="button button-block"/>Enviar</button>
          
          </form>

        </div>
        
  		<div></div><!--  precisa desse bagulho ai kkkkkkkk-->
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  

    <script  src="./script/script.js"></script>




</body>

</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% if (session.getAttribute("name") == null) { response.sendRedirect("index.jsp"); return; }%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Alterar Conta Email</title>
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
          <h1>Altere uma conta de email</h1>
          
          <form action="change_email_account_b.jsp" method="post">
          
           

          <div class="field-wrap">
            <label>
              Email que sera alterado:<span class="req">*</span>
            </label>
            <input type="email" id="email" name="email" value="<%= request.getParameter("email")%>" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Nova senha<span class="req">*</span>
            </label>
            <input type="password" id="password" name="password" value="<%= request.getParameter("password")%>" required autocomplete="off"/>
          </div>
          
           <div class="field-wrap">
            <label>
             Novo endereço do servidor de envio<span class="req">*</span>
            </label>
            <input type="text" id="server_address" name="server_send_address" value="<%= request.getParameter("server_send_address")%>" required autocomplete="off"/>
          </div>
          
           <div class="field-wrap">
            <label>
              Novo endereço do servidor de recepcao<span class="req">*</span>
            </label>
            <input type="text" id="server_address" name="server_receive_address" value="<%= request.getParameter("server_receive_address")%>" required autocomplete="off"/>
          </div>
          
           <div class="field-wrap">
            <label>
              Novo protocolo de envio<span class="req">*</span>
            </label>
            <input type="text" id="server_protocol" name="server_send_protocol" value="<%= request.getParameter("server_send_protocol")%>" required autocomplete="off"/>
          </div>
          
           <div class="field-wrap">
            <label>
              Novo protocolo de recepcao<span class="req">*</span>
            </label>
            <input type="text" id="server_protocol" name="server_receive_protocol" value="<%= request.getParameter("server_receive_protocol")%>" required autocomplete="off"/>
          </div>
          
           <div class="field-wrap">
            <label>
              Nova porta de envio<span class="req">*</span>
            </label>
            <input type="text" id="server_port" name="server_send_port" value="<%= request.getParameter("server_send_port")%>" required autocomplete="off"/>
          </div>
          
           <div class="field-wrap">
            <label>
              Nova porta de recepcao<span class="req">*</span>
            </label>
            <input type="text" id="server_port" name="server_receive_port"  value="<%= request.getParameter("server_receive_port")%>" required autocomplete="off"/>
          </div>
          
         
         
         
          <button type="submit" class="button button-block"/>Alterar</button>
          
          </form>

        </div>
        
  		<div></div><!--  precisa desse bagulho ai kkkkkkkk-->
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  

    <script  src="./script/script.js"></script>




</body>

</html>

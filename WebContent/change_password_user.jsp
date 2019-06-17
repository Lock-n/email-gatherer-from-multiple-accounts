<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% if (session.getAttribute("name") == null) { response.sendRedirect("index.jsp"); return; }%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Alterar Senha Usuario</title>
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
          <h1>Digite sua nova senha</h1>
          
          <form action="change_password_user_b.jsp" method="post">
          
           

          <div class="field-wrap">
            <label>
              Nova Senha<span class="req">*</span>
            </label>
            <input type="password" id="nova_senha" name="nova_senha" required autocomplete="off"/>
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

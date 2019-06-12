<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Sign-Up/Login</title>
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
      <link rel="stylesheet" href="./css/style.css">

  
</head>

<body>

  <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h1>Cadastre se</h1>
          
          <form action="sign_up_new_user_b.jsp" method="post">
          
          <!-- -->

          <div class="field-wrap">
            <label>
              Nome de Usuario<span class="req">*</span>
            </label>
            <input type="text" id="nome" name="nome" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Senha<span class="req">*</span>
            </label>
            <input type="password" id="senha" name="senha" required autocomplete="off"/>
          </div>
          
          <button type="submit" class="button button-block"/>Vamos comecar!</button>
          
          </form>

        </div>
        
        <div id="login">   
          <h1>Bem Vindo de Volta!</h1>
          
          <form action="log_in_user_b.jsp" method="post">
          
            <div class="field-wrap">
            <label>
              Nome de usuario<span class="req">*</span>
            </label>
            <input type="text" id="nome" name="nome" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Senha<span class="req">*</span>
            </label>
            <input type="password" id="senha" name="senha" required autocomplete="off"/>
          </div>
          
          
          <button class="button button-block"/>Log In</button>
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  

    <script  src="./script/script.js"></script>




</body>

</html>

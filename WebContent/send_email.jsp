<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enviar Email</title>
</head>
<body>

<script>

<%	

%>

</script>

<form action="enviarEmail" method="post" enctype="multipart/form-data">
	Assunto:
	<input type="text" name="assunto" id="assunto" placeholder="Assunto">
	</br>
	</br>
	Destino:
	<input type="text" name="destino" id="destino" placeholder="Destino">
	</br>
	</br>
	DestinoCC:
	<input type="text" name="destinocc" id="destinocc" placeholder="DestinoCC">
	</br>
	</br>
	DestinoCCO:
	<input type="text" name="destinocco" id="destinocco" placeholder="DestinoCCO">
	</br>
	</br>
	Texto:
	<textarea name="texto" id="texto" placeholder="Texto" cols="40" rows="5"></textarea>
	</br>
	</br>
	Tipo:
	<input type="text" name="tipo" id="tipo" placeholder="plain,html,..." size="25">
	</br>
	</br>
	Anexo:
	<input type="file" name="anexo" id="anexo" size="50" multiple>
	</br>
	</br>
	<input type="submit" value="Enviar">
	</form>
</body>
</html>
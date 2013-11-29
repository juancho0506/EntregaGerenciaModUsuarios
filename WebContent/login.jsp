<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="US-ASCII">
	<title>Sistema de Votaci&oacute;n - Modulo Usuarios</title>
	
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="css/jquery.realperson.css"> 
	<style type="text/css">
		.realperson-challenge { display: inline-block }
	</style>
	
	<!-- js libraries -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript" src="js/jquery.realperson.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#defaultReal').realperson();
		});
	</script>
</head>
<body>
	<article>
		<section id="loginSection" style="width: 300px; margin-left: 40%;">
			<h1>Bienvenido al Sistema de Votaci&oacute;n</h1>
			<fieldset title="Datos del Login">
				<h2>Ingrese sus datos: </h2>
				<form action="LoginServlet" method="post">		
					<div id="divFormaUsuarios" style="width: 80%">
						<label for="username" >Username: <input id="username" name="username" type="text" placeholder="Ingrese su usuario"></label>
						<label for="password" >Password: <input id="password" name="password" type="password" placeholder="Ingrese su contrase&nacute;a"></label>
						
						<br /><p><label>Por favor escriba las letras de abajo:</label><br/>
						<input type="text" id="defaultReal" name="defaultReal"></p>
						<br /><input type="submit" id="enviarLogin" name="enviarLogin" value="Login">
					</div>
				</form>
			</fieldset>
			<%if(request.getParameter("error")!=null){ 
			
				if(request.getParameter("error").equals("invalidCaptcha")){ %>
					<div style="background-color: red; color: white">
					<label>Captcha invalido, por favot vulva a interlo.</label>
					</div>
				<%}else{ %>
					<div style="background-color: red; color: white">
						<label>Usuario no existe o datos incorrectos, vuelva a intentarlo.</label>
					</div>
				<% }
				}%>
		</section>	
	</article>
</body>
</html>
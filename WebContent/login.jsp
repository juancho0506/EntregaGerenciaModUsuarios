<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<title>Sistema de Votaci&oacute;n - Modulo Usuarios</title>
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
						<br /><input type="submit" id="enviarLogin" name="enviarLogin" value="Login">
					</div>
				</form>
			</fieldset>
			<%if(request.getParameter("error")!=null){ %>
				<div style="background-color: red; color: white">
					<label>Usuario no existe o datos incorrectos, vuelva a intentarlo.</label>
				</div>
			<% }%>
		</section>	
	</article>
</body>
</html>
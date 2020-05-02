<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.events.rsvp.ConfigLoader" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
	<link type="text/css" rel="stylesheet" href="/stylesheets/main.css"/>
</head>

<body>

<%
String evento = ConfigLoader.EVENT_NAME;
pageContext.setAttribute("evento", evento);
%>

<h1> Inscribite al evento ${fn:escapeXml(evento)} </h1>

<form action="/confirmarAsistencia" method="post">
	<div><label>Nombre</label><input type="text" name="nombre"/></div>
	<div><label>Apellido</label><input type="text" name="apellido"/></div>
	<div><label>Mail</label><input type="email" name="mail" required/></div>
	<div><label>Compañía</label><input type="text" name="cnia" required/></div>
	<div><input type="submit" value="Registrar"/></div>
</form>

<form action="./consultarInvitado.jsp" method="get">
	<div><label>Mail</label><input type="email" name="c_mail" required/></div>
	<input type="submit" value="Consultar Invitado"/>
</form>

</body>
</html>

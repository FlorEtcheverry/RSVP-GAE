<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.events.rsvp.Persona" %>
<%@ page import="com.events.rsvp.ConsultarController" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css"/>
</head>

<body>

<%
    String mail = request.getParameter("c_mail");
    pageContext.setAttribute("c_mail", mail);
	ConsultarController consultador = new ConsultarController();
	Persona persona = consultador.getPersona(mail);
    if (persona != null) {
	    String nombre = persona.getNombre();
	    pageContext.setAttribute("nombre", nombre);
	    String apellido = persona.getApellido();
	    pageContext.setAttribute("apellido", apellido);
	    String cnia = persona.getCompania();
	    pageContext.setAttribute("cnia", cnia);
%>
		<p>El mail ${fn:escapeXml(mail)} se encuentra registrado.</p>
		<p>Nombre: ${fn:escapeXml(nombre)}</p>
		<p>Apellido: ${fn:escapeXml(apellido)}</p>
		<p>Compañía: ${fn:escapeXml(cnia)}</p>
<%
	} else {
%>
		<p style='background:red'>El mail ${fn:escapeXml(mail)} 
		no se encuentra registrado en el evento.</p>
<%
    }
%>
</body>
</html>

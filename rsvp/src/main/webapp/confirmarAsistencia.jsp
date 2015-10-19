<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.events.rsvp.ConfigLoader" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
	<link type="text/css" rel="stylesheet" href="/stylesheets/main.css"/>
</head>

<body>

<%
	String mail = request.getParameter("mail");
	pageContext.setAttribute("mail", mail);
	String success = request.getParameter("success");
	pageContext.setAttribute("success", success);
	if (success == null && mail != null && mail.equals("false")) {
%>
		<p> Debes ingresas un mail para inscribirte en el evento.</p>
<%
	} else {
		String eventStr = ConfigLoader.EVENT_NAME;
		pageContext.setAttribute("eventStr", eventStr);	
		if (success.equals("true")) {
%>
			<p> Te has resgistrado exitosamente al evento 
			<i>${fn:escapeXml(eventStr)}</i>. </p>
<%
		} else {
%>
			<p>No te has podido resgistar al evento 
			<i>${fn:escapeXml(eventStr)}</i> porque el cupo está lleno. </p>
<%
		}
	}
%>

</body>
</html>

package com.events.rsvp;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.objectify.ObjectifyService;

@SuppressWarnings("serial")
public class ConfirmarServlet extends HttpServlet {

	// Process the http POST of the form
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		Persona persona;
		String nombre = req.getParameter("nombre");
		String apellido = req.getParameter("apellido");
		String mail = req.getParameter("mail");
		String cnia = req.getParameter("cnia");
		if (mail == null) {
			resp.sendRedirect("/confirmarAsistencia.jsp?mail=" + false);
		} else {
			String evento = ConfigLoader.EVENT_NAME;
			persona = new Persona(evento, nombre, apellido, mail, cnia);
			Boolean res = ObjectifyService.ofy()
										.transact(new ConfirmarWork(persona));
			resp.sendRedirect("/confirmarAsistencia.jsp?success=" + res);
		}		
	}
}

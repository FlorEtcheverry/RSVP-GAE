package com.events.rsvp;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.ObjectifyService;

public class ConsultarController {

	public Persona getPersona(String mail) {

		Persona personaConsultada = null;
		if (mail != null) {
			Key<Event> evento = Key.create(Event.class,ConfigLoader.EVENT_NAME);
			Key<Persona> persona = Key.create(evento, Persona.class, mail);
			personaConsultada = ObjectifyService.ofy()
					.load()
					.key(persona).now();	
		}
		return personaConsultada;
	}
}

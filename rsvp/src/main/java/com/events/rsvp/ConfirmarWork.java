package com.events.rsvp;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.Work;

public class ConfirmarWork implements Work<Boolean> {
	
	private Persona persona;

	public ConfirmarWork(Persona persona) {
		this.persona = persona;
	}

	@Override
	public Boolean run() {
		int max = ConfigLoader.MAX;
		String eventStr = ConfigLoader.EVENT_NAME;

		Key<Event> event = Key.create(Event.class,eventStr);

		// get cant invitados
		int cant = ObjectifyService.ofy()
				.load()
				.type(Persona.class)
				.ancestor(event).count();
		
		if (cant < max) {
			ObjectifyService.ofy().save().entity(persona).now();
			return true;
		} 
		return false;
	}

}

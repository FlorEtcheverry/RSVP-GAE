package com.events.rsvp;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class Event {
	@Id public String name;
}

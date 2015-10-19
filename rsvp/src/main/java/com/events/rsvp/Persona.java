package com.events.rsvp;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Parent;

/**
 * The @Entity tells Objectify about our entity. We also register it in
 * {@link OfyHelper} Our primary key @Id is set automatically by the Google
 * Datastore for us.
 *
 * We add a @Parent to tell the object about its ancestor. We are doing this to
 * support many guestbooks. Objectify, unlike the AppEngine library requires
 * that you specify the fields you want to index using @Index. Only indexing the
 * fields you need can lead to substantial gains in performance -- though if not
 * indexing your data from the start will require indexing it later.
 *
 **/
@Entity
public class Persona {
	@Parent	Key<Event> event;
	@Id	private String mail;
	private String nombre;
	private String apellido;
	private String cnia;

	@SuppressWarnings("unused")
	private Persona() {
	}

	public Persona(String e, String n, String a, String m, String c) {
		event = Key.create(Event.class, e); // Creating the Ancestor key
		nombre = n;
		apellido = a;
		mail = m;
		cnia = c;
	}

	public String getMail() {
		return mail;
	}

	public String getNombre() {
		return nombre;
	}

	/*
	 * @Parent Key<Rsvp> theBook; TODO
	 * 
	 * @Id public Long id;
	 * 
	 * public String author_email; public String author_id; public String
	 * content;
	 * 
	 * @Index public Date date;
	 * 
	 * /** Simple constructor just sets the date* public Attendance() { date =
	 * new Date(); }
	 * 
	 * /** A connivence constructor* public Attendance(String book, String
	 * content) { this(); if( book != null ) { theBook = Key.create(Rsvp.class,
	 * book); // Creating the Ancestor key } else { theBook =
	 * Key.create(Rsvp.class, "default"); } this.content = content; }
	 * 
	 * /** Takes all important fields* public Attendance(String book, String
	 * content, String id, String email) { this(book, content); author_email =
	 * email; author_id = id; }
	 */

	public String getApellido() {
		return apellido;
	}

	public String getCompania() {
		return cnia;
	}
}

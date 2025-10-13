package com.assignments.assignment1.data;

import com.assignments.assignment1.model.Event;

import java.util.ArrayList;
import java.util.List;

public class EventData {
	
	// member variables
	private static final List<Event> events = new ArrayList<>();
	
	static {
		events.add(new Event(
			"1",
			"Tech Talk: Modern Web Patterns",
			"Oct 8, 2025 -- 18:00",
			"Room H 110 SGW",
			"Short talk about modern web architecture patterns and best practices for team projects.",
			15
		));
		
		events.add(new Event(
			"2",
			"Hands-on Workshop: REST APIs",
			"Oct 15, 2025 -- 14:00",
			"Room H 962 SGW",
			"Practical workshop where attendees build and consume REST APIs using Express and Java Servlets.",
			25
		));
		
		events.add(new Event(
			"3",
			"24-Hour Hackathon",
			"Nov 2, 2025 -- 09:00",
			"Mezanine Hall SGW",
			"Team-based hackathon. Bring your laptop and ideas. Limited spots available.",
			10
		));
	}
	
	// getters
	public static List<Event> getAllEvents() { return events; }

	// utility
	public static Event getEventById(String id) {
		for (Event event : events) {
			if (event.getId().equals(id)) {
				return event;
			}
		}
		
		return null;
	}
}

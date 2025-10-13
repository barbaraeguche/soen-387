package com.assignments.assignment1.model;

public class Event {
	
	// member variables
	private final String id, name, dateTime, location, description;
	private final int pricePerParticipant;
	
	// parameterized constructor
	public Event(String id, String name, String dateTime, String location, String description, int pricePerParticipant) {
		this.id = id;
		this.name = name;
		this.dateTime = dateTime;
		this.location = location;
		this.description = description;
		this.pricePerParticipant = pricePerParticipant;
	}
	
	// getters
	public String getId() { return id; }
	public String getName() { return name; }
	public String getDateTime() { return dateTime; }
	public String getLocation() { return location; }
	public String getDescription() { return description; }
	public int getPricePerParticipant() { return pricePerParticipant; }
}

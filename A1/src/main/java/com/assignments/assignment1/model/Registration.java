package com.assignments.assignment1.model;

public class Registration {

	// member variables
	private final Event event;
	private int numOfParticipants;
	
	// parameterized constructor
	public Registration(Event event, int numOfParticipants) {
		this.event = event;
		this.numOfParticipants = numOfParticipants;
	}
	
	// getters
	public Event getEvent() { return event; }
	public int getNumOfParticipants() { return numOfParticipants; }
	
	// setters
	public void setNumOfParticipants(int numOfParticipants) { this.numOfParticipants = numOfParticipants; }
	
	// utility
	public int getTotalCost() { return event.getPricePerParticipant() * numOfParticipants; }
}

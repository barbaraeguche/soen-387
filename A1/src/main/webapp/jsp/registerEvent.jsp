<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.assignments.assignment1.model.Event" %>
<%@ page import="com.assignments.assignment1.data.EventData" %>
<%@ page import="com.assignments.assignment1.model.Registration" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
	String eventId = request.getParameter("eventId");
	int participants = Integer.parseInt(request.getParameter("participants"));
	
	@SuppressWarnings("unchecked")
	List<Registration> registrations = (List<Registration>) session.getAttribute("registrations");
	
	// prevent null pointer error
	if (registrations == null) {
		registrations = new ArrayList<>();
	}
	
	Event event = EventData.getEventById(eventId);
	if (event != null) {
		boolean isRegistered = false;
		
		for (Registration reg : registrations) {
			if (reg.getEvent().getId().equals(eventId)) {
				reg.setNumOfParticipants(participants);
				isRegistered = true;
				break;
			}
		}
		
		// avoid duplicate events
		if (!isRegistered) {
			registrations.add(new Registration(event, participants));
		}
		
		// store updated registrations
		session.setAttribute("registrations", registrations);
	}
	
	// stay on the same page
	response.sendRedirect("%s/jsp/eventListing.jsp".formatted(request.getContextPath()));
%>
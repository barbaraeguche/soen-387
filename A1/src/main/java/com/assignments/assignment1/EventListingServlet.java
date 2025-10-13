package com.assignments.assignment1;

import com.assignments.assignment1.data.EventData;
import com.assignments.assignment1.model.Event;
import com.assignments.assignment1.model.Registration;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/servlet/events")
public class EventListingServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		List<Event> events = EventData.getAllEvents();
		
		@SuppressWarnings("unchecked")
		List<Registration> registrations = (List<Registration>) session.getAttribute("registrations");
		int registrationCount = registrations == null ? 0: registrations.size();
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Event Listing</title>");
		out.println("<link rel='stylesheet' href='" + request.getContextPath() + "/css/style.css'>");
		out.println("</head>");
		out.println("<body>");
		
		out.println("<div class='container'>");
		out.println("<header>");
		out.println("<h2>Upcoming Events</h2>");
		out.println("<a href='" + request.getContextPath() + "/servlet/registrations' class='my-registrations'>");
		out.println("My registrations (" + registrationCount + ")");
		out.println("</a>");
		out.println("</header>");
		
		out.println("<div class='events-list'>");
		out.println("<p>Choose the number of participants then click <b>Register</b>.</p>");
		out.println("<div");
		
		for (Event event : events) {
			out.println("<div class='event-card'>");
			
			// event details
			out.println("<h3>" + event.getName() + "</h3>");
			out.println("<p>Date: " + event.getDateTime() + " | Location: " + event.getLocation() + "</p>");
			out.println("<p>" + event.getDescription() + "</p>");
			
			// registration form
			out.println("<form method='post' action='" + request.getContextPath() + "/servlet/events' class='registration-form'>");
			out.println("<input type='hidden' name='eventId' value='" + event.getId() + "'>");
			out.println("<label for='participants-" + event.getId() + "'>Participants:");
			out.println("<select name='participants' id='participants-" + event.getId() + "'>");
			for (int i = 1; i <= 5; i++) {
				out.println("<option value='" + i + "'>" + i + "</option>");
			}
			out.println("</select>");
			out.println("</label>");
			out.println("<div>");
			out.println("<button type='submit' class='btn-register'>Register</button>");
			out.println("<p>Price: $" + event.getPricePerParticipant() + " / participant</p>");
			out.println("</div>");
			out.println("</form>");
			
			out.println("</div>");
		}
		
		out.println("/<div");
		out.println("</div>"); // .events-list
		out.println("</div>"); // .container
		out.println("</body>");
		out.println("</html>");
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String eventId = request.getParameter("eventId");
		int participants = Integer.parseInt(request.getParameter("participants"));
		
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		List<Registration> registrations = (List<Registration>) session.getAttribute("registrations");
		
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
			
			if (!isRegistered) {
				registrations.add(new Registration(event, participants));
			}
			session.setAttribute("registrations", registrations);
		}
		
		response.sendRedirect(request.getContextPath() + "/servlet/events");
	}
}

<%@ page import="java.util.List" %>
<%@ page import="com.assignments.assignment1.model.Event" %>
<%@ page import="com.assignments.assignment1.data.EventData" %>
<%@ page import="com.assignments.assignment1.model.Registration" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>Event Listing</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
	<div class="container">
		<header>
			<h2>Upcoming Events</h2>
			<a href="<%= request.getContextPath() %>/jsp/registrationSummary.jsp" class="my-registrations">
				<%
					@SuppressWarnings("unchecked")
					List<Registration> registrations = (List<Registration>) session.getAttribute("registrations");
				%>
				My registrations (<%= registrations == null ? 0 : registrations.size() %>)
			</a>
		</header>
		
		<div class="events-list">
			<p>Choose the number of participants then click <b>Register</b>.</p>
			
			<div>
				<%
					List<Event> events = EventData.getAllEvents();
					for (Event event : events) {
				%>
						<div class="event-card">
							<%-- heading --%>
							<h3><%= event.getName() %></h3>
							<p>Date: <%= event.getDateTime() %> | Location: <%= event.getLocation() %></p>
							
							<%-- description --%>
							<p><%= event.getDescription() %></p>
							
							<%-- registration + price --%>
							<form
								method="post"
								class="registration-form"
								action="<%= request.getContextPath() %>/jsp/registerEvent.jsp"
							>
								<input type="hidden" name="eventId" value="<%= event.getId() %>">
								
								<label for="participants-<%= event.getId() %>">
									Participants:
									<select name="participants" id="participants-<%= event.getId() %>">
										<% for (int i = 1; i <= 5; i++) { %>
											<option value="<%= i %>"><%= i %></option>
										<% } %>
									</select>
								</label>
								
								<div>
									<button type="submit" class="btn-register">Register</button>
									<p>Price: $<%= event.getPricePerParticipant() %> / participant</p>
								</div>
							</form>
						</div>
				<% } %>
			</div>
		</div>
	</div>
</body>
</html>
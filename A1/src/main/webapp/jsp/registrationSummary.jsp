<%@ page import="java.util.List" %>
<%@ page import="com.assignments.assignment1.model.Registration" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>Registration Summary</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
	<div class="container">
		<header>
			<h2>My Registrations</h2>
			<a href="<%= request.getContextPath() %>/jsp/eventListing.jsp" class="upcoming-events">
				Continue Browsing
			</a>
		</header>
		
		<%
			@SuppressWarnings("unchecked")
			List<Registration> registrations = (List<Registration>) session.getAttribute("registrations");
			
			if (registrations == null || registrations.isEmpty()) {
		%>
			<p class="no-registrations">You have no registrations yet.</p>
		<% } else { %>
			<table class="registration-table">
				<thead>
					<tr>
						<th>Event</th>
						<th>Date / Time</th>
						<th>Participants</th>
						<th>Price / participant</th>
						<th>Total</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < registrations.size(); i++) {
							Registration reg = registrations.get(i);
					%>
							<tr>
								<td><%= reg.getEvent().getName() %></td>
								<td><%= reg.getEvent().getDateTime() %></td>
								
								<%-- update --%>
								<td>
									<form
										method="post"
										style="display:inline;"
										action="<%= request.getContextPath() %>/jsp/updateRegistration.jsp"
									>
										<input type="hidden" name="action" value="update">
										<input type="hidden" name="index" value="<%= i %>">
										<input
											type="number"
											min="0" max="5"
											name="participants"
											class="participant-input"
											value="<%= reg.getNumOfParticipants() %>"
										>
										<button type="submit" class="btn-update">Update</button>
									</form>
								</td>
								
								<td>$<%= reg.getEvent().getPricePerParticipant() %></td>
								<td>$<%= reg.getTotalCost() %></td>
								
								<td>
									<form
										method="post"
										style="display:inline;"
										action="<%= request.getContextPath() %>/jsp/updateRegistration.jsp"
									>
										<input type="hidden" name="action" value="cancel">
										<input type="hidden" name="index" value="<%= i %>">
										<button type="submit" class="btn-cancel">Cancel</button>
									</form>
								</td>
							</tr>
					<% } %>
				</tbody>
			</table>
		
			<div class="action-buttons">
				<a href="<%= request.getContextPath() %>/jsp/eventListing.jsp" class="upcoming-events">
					Continue Browsing
				</a>
				<form method="post" action="<%= request.getContextPath() %>/jsp/confirmation.jsp" style="display:inline;">
					<button type="submit" class="btn-confirm">Confirm Registration</button>
				</form>
			</div>
		<% } %>
	</div>
</body>
</html>
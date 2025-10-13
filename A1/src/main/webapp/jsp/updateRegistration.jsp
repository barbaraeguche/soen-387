<%@ page import="java.util.List" %>
<%@ page import="com.assignments.assignment1.model.Registration" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
	@SuppressWarnings("unchecked")
	List<Registration> registrations = (List<Registration>) session.getAttribute("registrations");
	
	if (registrations != null) {
		String action = request.getParameter("action");
		int index = Integer.parseInt(request.getParameter("index"));
		
		if (action.equals("update")) {
			int participants = Integer.parseInt(request.getParameter("participants"));
			if (participants == 0) {
				// show warning, do not remove registration
%>
<!DOCTYPE html>
<html>
<head>
	<title>Warming</title>
</head>
<body>
	<script>
		alert("Warning: 0 participants entered. Registration not removed.");
		window.location = "<%= request.getContextPath() %>/jsp/registrationSummary.jsp";
	</script>
</body>
</html>
<%
				return;
			} else {
				registrations.get(index).setNumOfParticipants(participants);
			}
		} else if (action.equals("cancel")) {
			registrations.remove(index);
		}
		session.setAttribute("registrations", registrations);
	}
	
	response.sendRedirect("%s/jsp/registrationSummary.jsp".formatted(request.getContextPath()));
%>
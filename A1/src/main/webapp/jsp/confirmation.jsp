<%@ page contentType="text/html;charset=UTF-8" %>
<%
	// clear registrations after confirmation
	session.setAttribute("registrations", null);
%>
<!DOCTYPE html>
<html>
<head>
	<title>Registration Confirmation</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
	<div class="container">
		<div class="confirmation-box">
			<h1>Registration Confirmed!</h1>
			<p>Thank you --- your registrations have been recorded.</p>
			<p>An email confirmation is <i>not</i> required for this assignment.</p>
			<a href="<%= request.getContextPath() %>/jsp/eventListing.jsp" class="btn-home">
				Back to Events
			</a>
		</div>
	</div>
</body>
</html>
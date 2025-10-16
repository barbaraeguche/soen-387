<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>Event Registration System</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/home.css">
</head>
<body>
	<div class="welcome-container">
		<h1>🎉 Event Registration System</h1>
		<p>Choose your implementation version:</p>
		
		<div class="version-buttons">
			<a href="servlet/events" class="version-btn servlet">
				Servlet Version
			</a>
			<a href="jsp/eventListing.jsp" class="version-btn jsp">
				JSP Version
			</a>
		</div>
		
		<div class="note">
			<h3>About this Project</h3>
			<ul>
				<li>Two separate implementations: Servlets and JSP</li>
				<li>Event listing with registration functionality</li>
				<li>Registration management (update/cancel)</li>
				<li>Session-based cart system</li>
				<li>Responsive CSS styling</li>
			</ul>
		</div>
	</div>
</body>
</html>
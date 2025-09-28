<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>Event Listing</title>
</head>
<body>
	<div>
		<div>
			<h2>Upcoming Events</h2>
			<button>
				My registration (X)
			</button>
		</div>
		<div>
			<p>Choose the number of participants then click <b>Register</b>.</p>
			<div>
				<div>
					<%-- heading --%>
					<div>
						<h3>Tech Talk: Modern Web Patterns</h3>
						<p>Date: Oct 8, 2025 -- 18:00 | Location: Room H 110 SGW</p>
					</div>
					
					<%-- description + user input --%>
					<div>
						<p>Short talk about modern web architecture patterns and best practices for team projects.</p>
						<label>
							Participants:
							<select>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
						</label>
					</div>
					
					<%-- register + price --%>
					<div>
						<button>
							Register
						</button>
						<p>Price: $15 / participant</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
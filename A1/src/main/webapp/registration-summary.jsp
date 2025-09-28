<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>Registration Summary</title>
</head>
<body>
	<div>
		<div>
			<h2>My Registrations</h2>
			<button>
				Continue Browsing
			</button>
		</div>
		<table>
			<thead>
				<tr>Event</tr>
				<tr>Date / Time</tr>
				<tr>Participants</tr>
				<tr>Price / participant</tr>
				<tr>Total</tr>
				<tr>Actions</tr>
			</thead>
			<tbody>
				<tr>
					<td>Tech Talk: Modern Web Patterns</td>
					<td>Oct 8, 2025 -- 18:00</td>
					<td>
						<input type="number" min="1" max="5"/>
						<button>Update</button>
					</td>
					<td>$15</td>
					<td>$30</td>
					<td>
						<button>Cancel</button>
					</td>
				</tr>
			</tbody>
		</table>
		<div>
			<a>Continue Browsing</a>
			<button>Confirm Registration</button>
		</div>
	</div>
</body>
</html>
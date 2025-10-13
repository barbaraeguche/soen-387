package com.assignments.assignment1;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/servlet/confirmation")
public class ConfirmationServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		// clear registrations after confirmation
		session.setAttribute("registrations", null);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Registration Confirmation</title>");
		out.println("<link rel='stylesheet' href='" + request.getContextPath() + "/css/style.css'>");
		out.println("</head>");
		out.println("<body>");
		out.println("<div class='container'>");
		out.println("<div class='confirmation-box'>");
		out.println("<h1>Registration Confirmed!</h1>");
		out.println("<p>Thank you --- your registrations have been recorded.</p>");
		out.println("<a href='" + request.getContextPath() + "/servlet/events' class='btn-home'>Back to Events</a>");
		out.println("</div>"); // .container
		out.println("</div>"); // .confirmation-box
		out.println("</body>");
		out.println("</html>");
	}
}

package com.feedbacks;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            addFeedback(request, response);
        }
    }

    private void addFeedback(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String feedback = request.getParameter("feedback");
        int rating = Integer.parseInt(request.getParameter("rating"));

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO feedbacks (name, email, feedback, rating, created_at) VALUES (?, ?, ?, ?, NOW())";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, feedback);
            stmt.setInt(4, rating);
            stmt.executeUpdate();

            // Set attributes for JSP
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("feedback", feedback);
            request.setAttribute("rating", rating);

            // Forward to view-feedback.jsp
            request.getRequestDispatcher("view-feedback.jsp?email=" + email).forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}

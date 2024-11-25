package com.feedbacks;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/EditFeedbackServlet")
public class EditFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle GET request to load feedback data for editing
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the feedback email from the request parameter
        String email = request.getParameter("email");

        try (Connection conn = DBConnection.getConnection()) {
            // Select feedback based on email
            String sql = "SELECT * FROM feedbacks WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            // If feedback found, set attributes to forward to the edit-feedback.jsp
            if (rs.next()) {
                request.setAttribute("id", rs.getInt("id")); // This is needed if the ID is being passed back
                request.setAttribute("name", rs.getString("name"));
                request.setAttribute("email", rs.getString("email"));
                request.setAttribute("feedback", rs.getString("feedback"));
                request.setAttribute("rating", rs.getInt("rating"));
            }

            // Forward to the edit-feedback.jsp page to show the data in the form
            request.getRequestDispatcher("edit-feedback.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Handle POST request to update the feedback data
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve updated feedback details from the form
        int id = Integer.parseInt(request.getParameter("id")); // Hidden input for the ID
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String feedback = request.getParameter("feedback");
        int rating = Integer.parseInt(request.getParameter("rating"));

        try (Connection conn = DBConnection.getConnection()) {
            // Update feedback based on feedback ID
            String sql = "UPDATE feedbacks SET name = ?, email = ?, feedback = ?, rating = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, feedback);
            stmt.setInt(4, rating);
            stmt.setInt(5, id); // Using the feedback ID to ensure the correct row is updated
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Redirect back to the view feedback page after update
        response.sendRedirect("view-feedback.jsp?id=" + id + "&name=" + name + "&email=" + email + "&feedback=" + feedback + "&rating=" + rating);
    }
}

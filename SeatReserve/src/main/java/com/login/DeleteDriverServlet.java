package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/deleteDriverServlet")
public class DeleteDriverServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String driverId = request.getParameter("id");
        
        boolean isDeleted = com.login.loginDButil.deleteDriver(driverId);// Delete driver
        
        if (isDeleted) {
            response.sendRedirect("drivers.jsp");  // Redirect back to driver details page
        } else {
            response.getWriter().write("Error deleting driver. Please try again.");
        }
    }
}

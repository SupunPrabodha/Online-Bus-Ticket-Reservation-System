package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateDriverServlet")
public class UpdateDriverServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String driverId = request.getParameter("id");
        String dname = request.getParameter("dname");
        String phone = request.getParameter("phonenum");
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");
        String username = request.getParameter("uname");
        String password = request.getParameter("pass");
        
        try {
        }catch (Exception e) {
			e.printStackTrace();
		}

        boolean isUpdated = com.login.loginDButil.updateDriver(driverId, dname, phone, email, nic, username, password);  // Update driver in database
        
        if (isUpdated) {
            response.sendRedirect("driverDetails.jsp");  // Redirect to driver details page
        } else {
            response.getWriter().write("Error updating driver. Please try again.");
        }
    }
}

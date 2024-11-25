package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/updateDriverFormServlet")
public class UpdateDriverFormServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String driverId = request.getParameter("id");
        
        // Assuming DriverDAO class handles database operations.
        loginDButil driverDAO = new loginDButil();
        Driver driver = driverDAO.getDriverById(driverId);  // Fetch driver details by ID

        request.setAttribute("driver", driver);  // Pass the driver details to the JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("updateDriver.jsp");
        dispatcher.forward(request, response);
    }
}

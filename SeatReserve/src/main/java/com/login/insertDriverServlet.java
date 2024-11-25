package com.login;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/insertDriverServlet")
public class insertDriverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("dname");
		String phone = request.getParameter("phonenum");
		String email = request.getParameter("email");
		String nic = request.getParameter("nic");
		String username = request.getParameter("uname");
		String password = request.getParameter("pass");
		
		boolean isTrue;
		
		isTrue = loginDButil.insertdriver(name, phone, email, nic, username, password);
		
		 List<Driver> driverDetails = loginDButil.selectAllDrivers();
	     request.setAttribute("driverDetails", driverDetails);


		if(isTrue==true) {
			RequestDispatcher dis = request.getRequestDispatcher("drivers.jsp");
			dis.forward(request, response);	
		}
		else
		{
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
	}

}




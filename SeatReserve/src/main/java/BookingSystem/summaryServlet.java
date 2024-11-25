package BookingSystem;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/summaryServlet")
public class summaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(); 
		Integer userId = (Integer) session.getAttribute("userId");
		
		if(userId == null) {
			response.getWriter().println("<script> alert ('Please log in first, '); window.location.href = 'Login.jsp' </script> ");
			return;
		}
		
		List<BookingModel> bookings = BkControl.displayBooking(userId);
		
		request.setAttribute("bookings", bookings);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("passengerProfile.jsp");
		dispatcher.forward(request, response);
		
	}


}

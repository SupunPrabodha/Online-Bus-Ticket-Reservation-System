package BookingSystem;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int busId = Integer.parseInt(request.getParameter("busId"));
			String date = request.getParameter("date");
			
			List<BusModel> bookedBus = BusController.getBookingsBybusId(busId);
			
			// Check if any bookings exist for the bus
			if (bookedBus != null && !bookedBus.isEmpty()) {
				
				request.setAttribute("bookedBus", bookedBus);
				request.setAttribute("date", date);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("Booking.jsp");
				dispatcher.forward(request, response);
			} else {
				
				response.getWriter().print("No bookings found for this bus.");
			}
			
		} catch (NumberFormatException e) {
			//  invalid bus ID format (not an integer)
			response.getWriter().print("Invalid bus ID.");
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print("An error occurred while retrieving bus information.");
		}
		
	}
	
}


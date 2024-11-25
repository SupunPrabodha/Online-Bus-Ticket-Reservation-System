package BookingSystem;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/BusSearchServlet")
public class BusSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    /*public BusSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
	}*/
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String startPoint = request.getParameter("startPoint");
		String endPoint = request.getParameter("endPoint");
		String dateStr = request.getParameter("date");
		
		Date date = null;
	    if (dateStr != null && !dateStr.isEmpty()) {
	        try {
	            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
	            date = formatter.parse(dateStr);
	            System.out.println("Parsed Date from Input: " + date);  
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }
	    }
		
		List<BusModel> buses = BookingSystem.BusController.searchBuses(startPoint, endPoint);
		request.setAttribute("buses", buses);
		request.setAttribute("date", dateStr);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("AvailableBus.jsp");
		dispatcher.forward(request, response);
		
		doGet(request, response);
	}

}

package BookingSystem;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SubmitServlet
 */
@WebServlet("/SubmitServlet")
public class SubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out =response.getWriter();
		
		
		  HttpSession session = request.getSession(false); 
		  String userName = (String)session.getAttribute("full_name"); 
		  int userId = (int)session.getAttribute("userId");
		  System.out.println(userName);
		  System.out.println(userId);
		  
		  if(userName==null || userId==0) { 
			  response.getWriter().println("<script> alert ('Please log in first.'); window.location.href = 'Login.jsp'</script>"); 
			  return;
		  }
		 
		
		String busIdStr = request.getParameter("busId");
		String dateStr = request.getParameter("date");
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String departureTime = request.getParameter("departureTime");
		String noOfSeats = request.getParameter("numSeats");
		String TtlCost = request.getParameter("totalCost");
		
		
		System.out.println(dateStr);
		System.out.println(departureTime);
		
		  int busId = 0; 
		  if (busIdStr != null && !busIdStr.isEmpty()) { 
			  try { 
				  busId = Integer.parseInt(busIdStr); 
			  } catch (NumberFormatException e) {
				  e.printStackTrace(); 
			  }
		  }
		  
	        int seat = 0;
	        if (noOfSeats != null && !noOfSeats.isEmpty()) {
	            try {
	                seat = Integer.parseInt(noOfSeats);  // Convert String to int
	            } catch (NumberFormatException e) {
	                e.printStackTrace();  
	            }
	        }
		  
		  
	        double totalCost = 0.0;
	        if (TtlCost != null && !TtlCost.isEmpty()) {
	            try {
	                totalCost = Double.parseDouble(TtlCost);  
	            
	            } catch (NumberFormatException e) {
	                e.printStackTrace();  
	            }
	        }
	
        BookingModel b = new BookingModel(userName, from, to, dateStr, departureTime, seat, totalCost, busId, userId);
        
        int status = BkControl.insertdata(b);
        
        if(status > 0) {
        	String alertMessage = "Your Data Was Submitted";
		    response.getWriter().println("<script> alert ('"+alertMessage+"');  </script>");
		   
		    response.sendRedirect("summaryServlet");
        }else {
        	out.println("sorry! Unable to save the record.");
        }
        
        out.close();
        
        ArrayList<BookingModel> bookings = new ArrayList<BookingModel>();
        bookings.add(b);
        
  
	}

}

package BookingSystem;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updateServlet
 */
@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String resIdStr = request.getParameter("resId");
		String name = request.getParameter("name");
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		System.out.println(resIdStr);
		System.out.println(name);
		System.out.println(from);
		System.out.println(to);
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String seatCountStr = request.getParameter("seatCount");
		String costStr = request.getParameter("cost");
		System.out.println(date);
		System.out.println(time);
		System.out.println(seatCountStr);
		System.out.println(costStr);
		
		
		
		int resId = 0;
		try {
			resId= Integer.parseInt(resIdStr);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(resId);
		
		int seatCount = 0;
		try {
			seatCount= Integer.parseInt(seatCountStr);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(seatCount);
		
		double cost=0.0;
		try {
			cost= Double.parseDouble(costStr);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(cost);
		
		boolean isTrue;
		
		isTrue = BkControl.updateBooking(resId, date, seatCount, cost);
		
		if(isTrue) {
			String alertMessage = "Booking Updated!";
			response.getWriter().println("<script> alert ('"+alertMessage+"'); window.location.href = 'summaryServlet'</script>");
		}else {
			String alertMessage = "Booking Update Unsuccessfull!";
			response.getWriter().println("<script> alert ('"+alertMessage+"'); window.location.href = 'summaryServlet'</script>");
		}
		
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

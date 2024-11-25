package pay_gate;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PaymentServelet")
public class PaymentServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String Passenger_name = request.getParameter("passengerName");
		String email = request.getParameter("email");
		
		try {
			
		List<Passenger> passDetails = PaymentDBUtil.validate(Passenger_name, email);
		request.setAttribute("passDetails", passDetails);

		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("pass_details.jsp");
		dis.forward(request, response);
	}

}

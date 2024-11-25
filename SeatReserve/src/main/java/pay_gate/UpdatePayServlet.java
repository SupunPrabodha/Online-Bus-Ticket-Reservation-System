package pay_gate;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdatePayServlet")
public class UpdatePayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UpdatePayServlet() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pid = request.getParameter("pid");
		String Passenger_name  = request.getParameter("passengerName");
		String email  = request.getParameter("email");
		String card_number  = request.getParameter("cardNumber");
		String CVV_code  = request.getParameter("cvv");
		String Expiry_date  = request.getParameter("expiryDate");
		String Payment_Amount  = request.getParameter("paymentAmount");
		
		boolean isTrue;
		
		isTrue = PaymentDBUtil.updatePassenger(pid, Passenger_name, email, card_number, CVV_code, Expiry_date, Payment_Amount);
		
		if(isTrue == true) {
			
			List<Passenger> passDetails = PaymentDBUtil.getPassengerDetails(pid);
			request.setAttribute("passDetails", passDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("pass_details.jsp");
			dis.forward(request, response);
		}
		else {
			List<Passenger> passDetails = PaymentDBUtil.getPassengerDetails(pid);
			request.setAttribute("passDetails", passDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("pass_details.jsp");
			dis.forward(request, response);
		}
	}

}
 
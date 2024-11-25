package pay_gate;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PassengerInsertServelet")
public class PassengerInsertServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public PassengerInsertServelet() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String Passenger_name = request.getParameter("passengerName");
		String card_number = request.getParameter("cardNumber");
		String CVV_code = request.getParameter("cvv");
		String Expiry_date = request.getParameter("expiryDate");
		String email = request.getParameter("email");
		String Payment_Amount = request.getParameter("paymentAmount");
		
		boolean isTrue;
		
		isTrue = PaymentDBUtil.insertPassenger(Passenger_name, card_number, CVV_code, Expiry_date, email, Payment_Amount);
		
		if(isTrue == true) {
			request.setAttribute("PaymentSuccess", true);
			RequestDispatcher dis = request.getRequestDispatcher("paymentsuccess.jsp");
			dis.forward(request, response);
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("paymentunsuccess.jsp");
			dis2.forward(request, response);
		}
	}

}

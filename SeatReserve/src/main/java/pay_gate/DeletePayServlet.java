package pay_gate;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeletePayServlet")
public class DeletePayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pid = request.getParameter("pid");
		
		boolean isTrue;
		isTrue = PaymentDBUtil.deletePassenger(pid);
		
		if (isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("PassengerInsert.jsp");
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

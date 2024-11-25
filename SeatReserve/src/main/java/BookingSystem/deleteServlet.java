package BookingSystem;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class deleteServlet
 */
@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   /* public deleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }*/

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String resId = request.getParameter("id");
		boolean isTrue;
		
		int id =0;
		//int resID = Integer.parseInt(resId);
		try {
			id = Integer.parseInt(resId);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		isTrue = BkControl.delete(id);
		
		if(isTrue == true) {
			String alertMessage = "Data Deleted Successfully!";
			response.getWriter().println("<script> alert ('"+alertMessage+"');"+"window.location.href='SummaryServlet';<script>");
		}
		
		response.sendRedirect("summaryServlet");
		
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

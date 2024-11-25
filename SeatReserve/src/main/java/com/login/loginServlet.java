package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
        String username = request.getParameter("uid");
        String password = request.getParameter("pass");
        
        boolean isTrue;
        
        isTrue = loginDButil.validate(username, password);
        
        if (isTrue) {
            // Create session if login is successful
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            
            // Fetch user details and store them in session or request scope
            List<User> usDetails = loginDButil.getUser(username);
            session.setAttribute("userDetails", usDetails);  // Save user details in session
            
            User user = new User(username,password);
            if("admin".equalsIgnoreCase(user.getUsername())) {
            	response.sendRedirect("adminpage.jsp");
            }else {
            
            // Forward to user account page
            RequestDispatcher dis = request.getRequestDispatcher("useraccount.jsp");
            dis.forward(request, response);
            }
        } else {
            // If login fails, send an alert and redirect to login page
            out.println("<script type='text/javascript'>");
            out.println("alert('Your username or password is incorrect');");
            out.println("location='login.jsp';");
            out.println("</script>");
        }
    }
}

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="BookingSystem.BookingModel" %>

<%
    HttpSession sessionn = request.getSession(false);
    String fullName = null;

    if(sessionn == null || sessionn.getAttribute("full_name") == null){
        response.sendRedirect("log.jsp");
    }else{
        fullName = (String) sessionn.getAttribute("full_name");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SeatReserve - Online Bus Ticket Reservation</title>
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Fade-in animation */
        @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        html, body {
            height: 100%;
        }

        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #f4f4f4;
            color: #333;
            animation: fadeIn 1s ease-in forwards;
            display: flex;
            flex-direction: column;
        }

        /* Container */
        .container {
            width: 90%;
            margin: 0 auto;
            max-width: 1200px;
        }

        /* Header Styles */
        header {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
            width: 100%;
            position: relative;
            z-index: 10;
        }

        header h1 {
            float: left;
            margin-left: 20px;
        }

        header nav ul {
            list-style: none;
            float: right;
            margin-right: 20px;
        }

        header nav ul li {
            display: inline;
            margin-left: 20px;
        }

        header nav ul li a {
            color: #fff;
            text-decoration: none;
        }

        header nav ul li a:hover {
            text-decoration: underline;
        }

        /* Background Section Styles */
        .background-section {
            background: url('css/Bus.jpg') no-repeat center center/cover;
            position: relative;
            min-height: 100vh;
            text-align: center;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .background-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }

        /* Active Section Styles */
        .active {
            position: relative;
            z-index: 2;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.7);
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin: 20px;
            color: #333;
            width: 100%;
            max-width: 1200px;
        }

        .active h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        /* Table Styles */
        #activeTable {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        #activeTable th, #activeTable td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
            color: #333;
        }

        #activeTable th {
            background-color: #333;
            color: #fff;
        }

        #activeTable tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #activeTable tr:hover {
            background-color: #ddd;
        }

        /* Button Styles */
        button.btn1, button.btn2, button.btn12 {
            padding: 8px 12px;
            border-radius: 5px;
            background-color: #ff6b6b;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        button.btn1:hover, button.btn2:hover, button.btn12:hover {
            background-color: #ff4a4a;
        }

        /* Footer Section */
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 20px 0;
            width: 100%;
            position: relative;
            bottom: 0;
            z-index: 10;
        }

        footer p {
            margin-bottom: 10px;
        }

        footer .social-links {
            list-style: none;
            display: flex;
            justify-content: center;
        }

        footer .social-links li {
            margin: 0 10px;
        }

        footer .social-links li a {
            color: white;
            text-decoration: none;
        }

        footer .social-links li a:hover {
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            header h1 {
                float: none;
                text-align: center;
                margin-bottom: 10px;
            }

            header nav ul {
                float: none;
                text-align: center;
                margin: 0;
            }

            header nav ul li {
                display: block;
                margin: 10px 0;
            }

            .active {
                padding: 20px;
            }

            #activeTable th, #activeTable td {
                padding: 8px;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <h1>SeatReserve</h1>
            <nav>
                <ul>
                    <li><a href="homepage.jsp">Home</a></li>
                    <li><a href="BusSearch.jsp">Book a Ticket</a></li>
                    <li><a href="passengerProfile.jsp">Passenger Profile</a></li>
                    <li><a href="feedback.jsp">Feedback</a></li>
                    <li><a href="aboutus.jsp">About Us</a></li>
                    <li><a href="contactus.jsp">Contact</a></li>
                    <li><a href="logoutServlet">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <div class="background-section">
        <section>
            <div class="active">
                <h2>Welcome, <%=fullName %></h2>
                <h2 id="activTitle">Active Reservations</h2>

                <table id="activeTable">
                    <tr class="theader">
                        <th>Res.ID</th>
                        <th>Name</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Departure Date</th>
                        <th>Time</th>
                        <th>No.Of Seats</th>
                        <th>Cost</th>
                        <th colspan="3">Action</th>
                    </tr>
                    <%
                        List<BookingModel> bookings = (List<BookingModel>) request.getAttribute("bookings");
                        if(bookings != null && !bookings.isEmpty()){
                            Boolean isTrue = false;

                            for (BookingModel booking : bookings) { 
                                isTrue = booking.displayActive(booking);
                                if(isTrue){ %>
                                    <tr>
                                        <td><%= booking.getResId() %></td>
                                        <td><%= booking.getName() %></td>
                                        <td><%= booking.getFrom() %></td>
                                        <td><%= booking.getTo() %></td>
                                        <td><%= booking.getDepartureDate() %></td>
                                        <td><%= booking.getDepartureTime() %></td>
                                        <td><%= booking.getSeatCount() %></td>
                                        <td><%= booking.getCost() %></td>                                                        
                                        <td>
                                            <a href="update.jsp?resId=<%= booking.getResId()%>&name=<%= booking.getName()%>&from=<%= booking.getFrom()%>&to=<%= booking.getTo()%>&date=<%= booking.getDepartureDate()%>&time=<%= booking.getDepartureTime()%>&seatCount=<%= booking.getSeatCount()%>&cost=<%= booking.getCost()%>">
                                                <button class="btn2">Update</button>
                                            </a>
                                        </td>
                                        <td>
                                            <form action="deleteServlet" method="post">
                                                <input type="hidden" name="id" value="<%= booking.getResId() %>"/>
                                                <button class="btn1">Delete</button>
                                            </form>
                                        </td>
                                        <td>
                                            <form action="ConfirmBook.html" method="post">
                                                <button class="btn12">Confirm</button>
                                            </form>
                                        </td>
                                    </tr>
                                <% }
                            } 
                        } else { %>
                            <tr>
                                <td colspan="11">No Active Booking Records!</td>
                            </tr>
                        <% } %>
                </table>
            </div>

            <div class="active">
                <h2 id="activTitle">Reservations History</h2>
                <table id="activeTable">
                    <tr class="theader">
                        <th>Res.ID</th>
                        <th>Name</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Departure Date</th>
                        <th>Time</th>
                        <th>No.Of Seats</th>
                        <th>Cost</th>
                        <th>Action</th>
                    </tr>
                    <%
                        if(bookings != null && !bookings.isEmpty()){
                            Boolean isTrue = false;

                            for(BookingModel booking : bookings){
                                isTrue = booking.displayInactive(booking);
                                if(isTrue){ %>
                                    <tr>
                                        <td><%= booking.getResId() %></td>
                                        <td><%= booking.getName() %></td>
                                        <td><%= booking.getFrom() %></td>
                                        <td><%= booking.getTo() %></td>
                                        <td><%= booking.getDepartureDate() %></td>
                                        <td><%= booking.getDepartureTime() %></td>
                                        <td><%= booking.getSeatCount() %></td>
                                        <td><%= booking.getCost() %></td>
                                        <td>
                                            <form action="deleteServlet" method="post">
                                                <input type="hidden" name="id" value="<%= booking.getResId() %>"/>
                                                <button class="btn1">Delete</button>
                                            </form>
                                        </td>
                                    </tr>
                                <% }
                            }
                        } else { %>
                            <tr>
                                <td colspan="9">No Booking History!</td>
                            </tr>
                        <% } %>
                </table>
            </div>
        </section>
    </div>

    <footer>
        <div class="container">
            <p>&copy; 2024 SeatReserve. All rights reserved.</p>
            <ul class="social-links">
                <li><a href="#">Facebook</a></li>
                <li><a href="#">Twitter</a></li>
                <li><a href="#">Instagram</a></li>
            </ul>
        </div>
    </footer>
</body>
</html>

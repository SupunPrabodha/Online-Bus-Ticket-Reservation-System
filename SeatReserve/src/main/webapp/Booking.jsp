<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, BookingSystem.BusModel" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SeatReserve | Reserve Seat</title>

    <style>
        /* General Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%; /* Ensure the body takes full viewport height */
        }

        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #f4f4f4;
            position: relative;
            display: flex;
            flex-direction: column;
            color: #333;
            animation: fadeIn 1s ease-in forwards;
        }
                @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        /* Dark overlay with opacity 0.5 */
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black overlay */
            z-index: 1; /* Ensures the overlay stays behind the content */
        }

        .content {
            position: relative;
                        background: url('css/Bus.jpg') no-repeat center center/cover; /* Set the background image */
            z-index: 2; /* Ensure content is on top of the overlay */
        }

        @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 1; }
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


        /* Booking Form Section */
        form {
            max-width: 600px;
            margin: 40px auto;
            background-color: rgba(255, 255, 255, 0.9); /* Slightly transparent white background for the form */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            color: #333;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        input[type="text"],
        input[type="time"],
        input[type="number"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[readonly] {
            background-color: #e9e9e9;
            cursor: not-allowed;
        }

        button {
            background-color: #344C64;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }

        button:hover {
            background-color: #240750;
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

            .hero h2 {
                font-size: 2rem;
            }

            .hero p {
                font-size: 1rem;
            }

            .login-section form {
                padding: 20px;
            }
        }
    </style>

    <script>
        function calculateTotalCost() {
            const seats = document.getElementById("numSeats").value;
            const costPerSeat = document.getElementById("costPerSeat").value;
            const totalCost = seats * costPerSeat;
            document.getElementById("totalCost").value = totalCost.toFixed(2);
        }
    </script>
</head>
<body>
    <header>
        <div class="container">
            <h1>SeatReserve</h1>
            <nav>
                <ul>
                    <li><a href="homepage.jsp">Home</a></li>
                    <li><a href="log.jsp">Book a Ticket</a></li>
                    <li><a href="login.jsp">Feedback</a></li>
                    <li><a href="aboutus.jsp">About Us</a></li>
                    <li><a href="contactus.jsp">Contact</a></li>
                    <li><a href="logoutServlet">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <div class="content">
        <h1 style="color:white"><center>Bus Booking Form</center></h1>

        <%
            List<BusModel> bookedBuses = (List<BusModel>) request.getAttribute("bookedBus");
            if (bookedBuses != null && !bookedBuses.isEmpty()) {
                for (BusModel bus : bookedBuses) {
        %>
        <form action="SubmitServlet" method="POST">
            <input type="hidden" id="busId" name="busId" value="<%= bus.getId() %>">
            
            <label for="date">Date:</label>
            <input type="text" id="date" name="date" value="<%= request.getAttribute("date") %>" readonly><br><br>

            <label for="from">From:</label>
            <input type="text" id="from" name="from" value="<%= bus.getStart_point() %>" readonly><br><br>

            <label for="to">To:</label>
            <input type="text" id="to" name="to" value="<%= bus.getEnd_point() %>" readonly><br><br>

            <label for="departureTime">Departure Time:</label>
            <input type="time" id="departureTime" name="departureTime" value="<%= bus.getDepartureTime() %>" readonly><br><br>

            <label for="numSeats">Number of Seats:</label>
            <input type="number" id="numSeats" name="numSeats" min="1" max="55" required oninput="calculateTotalCost()"><br><br>

            <label for="costPerSeat">Cost per Seat (LKR):</label>
            <input type="number" id="costPerSeat" name="costPerSeat" value="<%= bus.getCostPerSeat() %>" readonly><br><br>

            <label for="totalCost">Total Cost (LKR):</label>
            <input type="number" id="totalCost" name="totalCost" readonly><br><br>

            <button type="submit">Book Now</button>
        </form>
        <%
                }
            } else {
        %>
            <p>No bookings found for this bus.</p>
        <%
            }
        %>
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

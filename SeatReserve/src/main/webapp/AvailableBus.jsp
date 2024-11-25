<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="BookingSystem.BusModel" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SeatReserve | Available Buses</title>

<style>
    * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html, body {
    height: 100%;
}

body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    background-color: #f4f4f4;
    display: flex;
    flex-direction: column;
    color: #333;
    animation: fadeIn 1s ease-in forwards;
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

.hero {
    background: url('css/Bus.jpg') no-repeat center center/cover;
    min-height: 100vh;
    color: #fff;
    text-align: center;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    position: relative;
}

.hero::before {
    content: '';
    position: absolute;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* Overlay for better text readability */
    z-index: 1;
}

.hero h2 {
    font-size: 3rem;
    margin-bottom: 10px;
    position: relative;
    z-index: 2; /* Ensure text is above the overlay */
}

.hero p {
    font-size: 1.2rem;
    margin-bottom: 20px;
    position: relative;
    z-index: 2;
}

.hero .btn {
    background-color: #ff6b6b;
    color: #fff;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 5px;
    margin-top: 20px;
    position: relative;
    z-index: 2;
}

.hero .btn:hover {
    background-color: #ff4a4a;
}

/* Bus Cards */
.bus-container {
    display: flex;
    flex-wrap: wrap; /* Allow wrapping for responsive design */
    justify-content: space-around;
    position: relative;
    z-index: 2; /* Ensure bus cards are above the overlay */
}

.bus-card {
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin: 20px;
    max-width: 300px; /* Set a fixed width for the cards */
    transition: transform 0.3s ease;
}

.bus-card h2 {
    font-size: 1.5rem;
    color: #40534C;
    margin-bottom: 10px;
}

.bus-card p {
    font-size: 1rem;
    color: #555;
    margin: 8px 0;
}

.bus-card a {
    display: inline-block;
    text-decoration: none;
    background-color: #344C64;
    color: white;
    padding: 10px 20px;
    border-radius: 5px;
    font-weight: bold;
    transition: background-color 0.3s ease;
    margin-top: 15px;
}

.bus-card a:hover {
    background-color: #240750;
}

.bus-card:hover {
    transform: translateY(-5px);
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
    .bus-container {
        flex-direction: column; /* Stack cards vertically on smaller screens */
        align-items: center;
    }

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
                <li><a href="log.jsp">Book a Ticket</a></li>
                <li><a href="passengerProfile.jsp">Passenger Profile</a></li>
                <li><a href="aboutus.jsp">About Us</a></li>
                <li><a href="contactus.jsp">Contact</a></li>
                <li><a href="logoutServlet">Logout</a></li>
            </ul>
        </nav>
    </div>
</header>

<section class="hero">
    <div class="container">
        <h2>Available Buses</h2>

        <div class="bus-container">
            <%
                List<BusModel> buses = (List<BusModel>) request.getAttribute("buses");
                if (buses != null && !buses.isEmpty()) {
                    for (BusModel bus : buses) {
            %>

            <div class="bus-card">
                <h2><%= bus.getStart_point() %> to <%= bus.getEnd_point() %></h2>
                <p>Departure Time: <%= bus.getDepartureTime() %></p>
                <p>Arrival Time: <%= bus.getArrivalTime() %></p>
                <p>Available Seats: <%= bus.getAvailableSeats() %></p>
                <p>Cost per Seat: LKR <%= bus.getCostPerSeat() %></p>

                <a href="BookingServlet?busId=<%= bus.getId() %>&date=<%= request.getAttribute("date") %>">Book My Seat</a>
            </div>

            <%
                    }
                } else {
            %>  
            <p>No buses available for the selected route and date.</p>
            <%
                }
            %>
        </div>
    </div>
</section>

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

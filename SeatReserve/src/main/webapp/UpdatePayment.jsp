<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
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
    display: flex;
    flex-direction: column;
    color: #333;
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
		
       /* Hero Section Styles */
.hero {
    background: url('css/Bus.jpg') no-repeat center center/cover;
    min-height: 100vh; /* Ensure the hero section covers full viewport height */
    color: #fff;
    text-align: center;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.hero h2 {
    font-size: 3rem;
    margin-bottom: 10px;
}

.hero p {
    font-size: 1.2rem;
    margin-bottom: 20px;
}

.hero .btn {
    background-color: #ff6b6b;
    color: #fff;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 5px;
    margin-top: 20px;
}

.hero .btn:hover {
    background-color: #ff4a4a;
}

/* Booking Form Section */
#booking-form {
    background-color: #fff;
    padding: 30px 0;
    text-align: center;
    min-height: calc(100vh - 60px); /* Ensures form section covers remaining viewport height */
}

#booking-form h3 {
    margin-bottom: 20px;
    font-size: 2rem;
}

.form-group {
    margin-bottom: 15px;
}

.form-group input,
button {
    padding: 10px;
    font-size: 1rem;
    width: 100%;
    max-width: 300px;
    margin: 0 auto;
    display: block;
}

button.btn {
    background-color: #ff6b6b;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

button.btn:hover {
    background-color: #ff4a4a;
}

/* Login and Registration Section Styles */
.login-section {
    background: url('css/Bus.jpg') no-repeat center center/cover;
    position: relative;
    min-height: 100vh; /* Ensure login and registration sections take full viewport height */
    text-align: center;
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

.login-section::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* Overlay for better text readability */
    z-index: 1;
}

.login-section h2,
.login-section form,
.login-section p {
    position: relative;
    z-index: 2; /* Ensure the content is above the overlay */
}

.login-section h2 {
    margin-bottom: 30px;
    font-size: 2rem;
}

.login-section form {
    max-width: 400px;
    margin: 0 auto;
    background: rgba(255, 255, 255, 0.8);
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.login-section .form-group {
    margin-bottom: 15px;
    text-align: left;
}

.login-section .form-group label {
    display: block;
    font-size: 1rem;
    color: #333;
    margin-bottom: 5px;
}

.login-section .form-group input,
.login-section .form-group textarea {
    width: 800px;
    padding: 10px;
    font-size: 1rem;
    border: 1px solid #ccc;
    border-radius: 20px;
   
}

.login-section .form-group textarea {
    resize: none; /* Disable textarea resizing */
    height: 150px; /* Set a specific height for feedback text area */
}

.login-section button.btn {
    width: 100%;
    padding: 10px;
    background-color: #ff6b6b;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1.1rem;
}

.login-section button.btn:hover {
    background-color: #ff4a4a;
}

.login-section p {
    margin-top: 15px;
    font-size: 0.9rem;
}

.login-section p a {
    color: #ff6b6b;
    text-decoration: none;
}

.login-section p a:hover {
    text-decoration: underline;
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
    <title>SeatReserve | Update Payment</title>
</head>
<body>
	<header>
        <div class="container">
            <h1>SeatReserve</h1>
            <nav>
                <ul>
                    <li><a href="homepage.jsp">Home</a></li>
                    <li><a href="log.jsp">Book a Ticket</a></li>
                    <li><a href="feedback.jsp">Feedback</a></li>
                    <li><a href="aboutus.jsp">About Us</a></li>
                    <li><a href="contactus.jsp">Contact</a></li>
                    <li><a href="logoutServlet">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <%
    String pid = request.getParameter("pid");
    String passenger_name = request.getParameter("passenger_name");
    String card_number = request.getParameter("card_number");
    String CVV_code = request.getParameter("CVV_code");
    String expire_date = request.getParameter("expire_date");
    String email = request.getParameter("email");
    String payment_amount = request.getParameter("payment_amount");
    %>
	<section class="login-section">
        <div class="container">
    <h2>Update Payment Details</h2>
    <form action="UpdatePayServlet" method="post">
        <!-- Card_holder Information -->
        <div class="form-group"><label for="passengerName">ID:</label>
        <input type="text" id="pid" name="pid" value="<%= pid %>" required readonly></div>
        
        <div class="form-group"><label for="passengerName">Passenger Name:</label>
        <input type="text" id="passengerName" name="passengerName" value="<%= passenger_name %>" required></div>
        
        <div class="form-group"><label for="email">Email:</label>
        <input type="email" id="email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}" value="<%= email %>" required></div>

        <div class="form-group"><!-- Card Details -->
        <label for="cardNumber">Card Number:</label>
        <input type="text" id="cardNumber" name="cardNumber" pattern="\d{13,19}" title="Card number must be between 13 and 19 digits" value="<%= card_number %>" required></div>
        
        <div class="form-group"><label for="cvv">CVV:</label>
        <input type="text" id="cvv" name="cvv" pattern="\d{3,4}" title="CVV must be 3 or 4 digits" value="<%= CVV_code %>" required></div>

        <div class="form-group"><label for="expiryDate">Expiry Date (MM/YY):</label>
        <input type="text" id="expiryDate" name="expiryDate" value="<%= expire_date %>" pattern="(0[1-9]|1[0-2])\/[0-9]{2}" title="Enter a valid date in MM/YY format" placeholder="MM/YY" required></div>
        
        <div class="form-group"><label for="paymentAmount">Payment Amount:</label>
        <input type="text" id="paymentAmount" name="paymentAmount" value="<%= payment_amount %>" placeholder="LKR/Rs." required></div>
        

        <!-- Submit Button (Updated) -->
        <button type="submit" name= "submit" class="btn" value="Update Payment Details">Update Payment Details</button>
    </form>
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
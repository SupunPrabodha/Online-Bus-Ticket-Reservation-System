<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SeatReserve | Payment Page</title>
    <style>
        /* General Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%; /* Ensure the body takes full viewport height */
            scroll-behavior: smooth; /* Add smooth scrolling */
        }

        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            color: #333;
            opacity: 0;
            animation: fadeIn 1s ease-in forwards; /* Apply fade-in animation */
        }

        /* Fade-in animation */
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
            position: sticky;
            z-index: 10;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            float: left;
            margin-left: 20px;
        }

        header nav ul {
            list-style: none;
            float: right;
            display: flex;
            justify-content: flex-end;
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

        /* Hero Section */
        .hero {
            position: relative; /* Position relative for absolute overlay */
            background: url('css/Bus.jpg') no-repeat center center/cover;
            min-height: 100vh; /* Ensure the hero section covers full viewport height */
            color: #fff;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        
        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5); /* Dark overlay for better text visibility */
            z-index: 1; /* Position behind text */
        }

        .hero h1, .hero button {
            position: relative; /* Position relative to stack on top of overlay */
            z-index: 2; /* Ensure content is above the overlay */
        }

        .hero h1 {
            font-size: 3rem;
            margin-bottom: 10px;
        }

        .hero p {
            font-size: 1.2rem;
            margin-bottom: 20px;
        }

        /* Payment Confirmation Container */
        .payment-confirmation {
            background-color: rgba(255, 255, 255, 0.9); /* White background with some transparency */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            text-align: left;
            margin: 20px auto; /* Center the container */
            width: 80%; /* Set width for the confirmation box */
            position: relative; /* Ensure this container is positioned above the overlay */
            z-index: 3; /* Set a higher z-index to bring it in front of the overlay */
        }

        /* Form Styles */
        .form-group {
            margin-bottom: 15px;
            position: relative;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333; /* Label color for better visibility */
        }

        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            font-size: 16px; /* Increased font size for better readability */
        }

        button {
            background-color: #ff6b6b;
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 5px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px; /* Increased font size for better readability */
        }

        button:hover {
            background-color: #ff4a4a;
        }

        button:nth-child(2) {
            background-color: #dc3545;
        }

        button:nth-child(2):hover {
            background-color: #c82333;
        }

        /* Footer Styles */
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 20px 0;
            position: relative;
            width: 100%;
            bottom: 0;
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
                    <li><a href="aboutus.jsp">About Us</a></li>
                    <li><a href="contactus.jsp">Contact</a></li>
                    <li><a href="logoutServlet">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <section class="hero">
        <div class="container">
            <h1>Payment Details</h1>
            <div class="payment-confirmation">
                <form id="payment-form" action="PassengerInsertServelet" method="post" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="passengerName">Passenger Name:</label>
                        <input type="text" id="passengerName" name="passengerName" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}" required>
                    </div>
                    <div class="form-group">
                        <label for="cardNumber">Card Number:</label>
                        <input type="text" id="cardNumber" name="cardNumber" pattern="\d{13,19}" title="Card number must be between 13 and 19 digits" required>
                    </div>
                    <div class="form-group">
                        <label for="cvv">CVV:</label>
                        <input type="text" id="cvv" name="cvv" pattern="\d{3,4}" title="CVV must be 3 or 4 digits" required>
                    </div>
                    <div class="form-group">
                        <label for="expiryDate">Expiry Date (MM/YY):</label>
                        <input type="text" id="expiryDate" name="expiryDate" required pattern="(0[1-9]|1[0-2])\/[0-9]{2}" title="Enter a valid date in MM/YY format" placeholder="MM/YY">
                    </div>
                    <div class="form-group">
                        <label for="paymentAmount">Payment Amount:</label>
                        <input type="text" id="paymentAmount" name="paymentAmount" min="0" step="0.01" oninput="preventMinus(event)" required>

                    </div>
                    <center><button type="submit">Submit Payment</button></center>
                </form>
            </div>
        </div>
    </section>
<script>
               function preventMinus(event) {
               const input = event.target;
               // Remove any minus signs from the input
               input.value = input.value.replace(/-/g, '');
             }

               function validateForm() {
               const form = document.getElementById('payment-form');
               const paymentAmountInput = document.getElementById('paymentAmount');
               let paymentAmount = paymentAmountInput.value;

        // Check if the form is valid
        if (!form.checkValidity()) {
            form.reportValidity(); // Display the default validation messages
            return false;
        }

        // Validate that paymentAmount is a non-negative number
        const amountPattern = /^\d+(\.\d{2})?$/;
        if (!amountPattern.test(paymentAmount)) {
            alert("Please enter a valid payment amount in the format '1200.00'.");
            return false;
        }

        // If payment amount does not include decimal, add .00
        if (!paymentAmount.includes(".")) {
            paymentAmount += ".00";
        } else {
            // If there is a decimal but less than two digits, pad with zeros
            const decimalIndex = paymentAmount.indexOf(".");
            const decimalPlaces = paymentAmount.length - decimalIndex - 1;
            if (decimalPlaces < 2) {
                paymentAmount += "0".repeat(2 - decimalPlaces);
            }
        }

        // Update the input field with the formatted value
        paymentAmountInput.value = paymentAmount;

        // Show confirmation alert
        alert("Confirm Payment");
        return true; // Allow form submission
    }
</script>

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

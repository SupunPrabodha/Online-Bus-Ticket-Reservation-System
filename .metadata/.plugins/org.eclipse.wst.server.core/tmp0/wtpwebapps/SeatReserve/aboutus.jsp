<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
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

        /* About Us Section */
        .about-section {
            background: url('css/Bus.jpg') no-repeat center center/cover; /* Background image */
            background-size: cover; /* Ensure background image covers the entire section */
            min-height: calc(100vh - 60px); /* Full height minus header and footer */
            color: #fff; /* Text color for better contrast */
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 50px 20px; /* Add padding for spacing */
            text-align: center;
            position: relative; /* Set position relative for overlay */
        }

        .about-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5); /* Dark overlay for better text visibility */
            z-index: 1; /* Position behind text */
        }

        .transparent-container {
            background-color: rgba(255, 255, 255, 0.5); /* White background with transparency */
            padding: 20px; /* Padding for spacing */
            border-radius: 10px; /* Rounded corners */
            max-width: 800px; /* Limit max width for readability */
            margin: auto; /* Center the container */
            position: relative; /* Ensure it is above the overlay */
            z-index: 2; /* Position above the overlay */
        }

        .about-section h2 {
            font-size: 2.5rem;
            color: white;
            margin-bottom: 20px;
            position: relative; /* To bring text above overlay */
            z-index: 2; /* Position above the overlay */
        }

        .about-section p {
            font-size: 1.2rem;
            margin-bottom: 40px;
            line-height: 1.8;
            text-align: left;
            position: relative; /* To bring text above overlay */
            z-index: 2; /* Position above the overlay */
        }

        /* Responsive Footer */
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

        /* Media Queries */
        @media (max-width: 768px) {
            header h1 {
                font-size: 1.5rem;
                margin-left: 10px;
            }

            header nav ul li {
                margin-left: 10px;
            }

            .about-section h2 {
                font-size: 2rem;
            }

            .about-section p {
                font-size: 1rem;
            }
        }
    </style>
    <title>SeatReserve | About Us</title>
</head>
<body>
    <!-- Header Section -->
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
                    <li><a href="useraccount.jsp">User Account</a></li>
                    <li><a href="logoutServlet">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- About Section -->
    <section class="about-section">
        <div class="container">
            <h2>About SeatReserve</h2>
            <div class="transparent-container"> <!-- New transparent container -->
                <p>
                    SeatReserve is a dedicated online platform for bus seat reservations. We aim to provide travelers with an easy, fast, and reliable way to book bus tickets from the comfort of their homes or while on the go. Our user-friendly interface allows you to search for available bus routes, compare schedules, and book seats in a matter of minutes.
                </p>
                <p>
                    Founded in 2024, SeatReserve was built with a mission to simplify the bus ticketing process and enhance the travel experience for passengers. Whether you're planning a quick trip to a nearby city or a long-distance journey, we make sure your seat is reserved in advance, so you can travel with peace of mind.
                </p>
                <p>
                    Our core values include customer satisfaction, transparency, and convenience. We work closely with bus operators to ensure accurate schedules and real-time availability of seats, and our 24/7 customer support is always ready to assist you with any questions or concerns.
                </p>
                <p>
                    At SeatReserve, we believe in making bus travel accessible and stress-free for everyone. Join us and experience the future of bus reservations today!
                </p>
            </div>
        </div>
    </section>

    <!-- Footer Section -->
    <footer>
        <div class="container">
            <p>&copy; 2024 SeatReserve. All Rights Reserved.</p>
            <ul class="social-links">
                <li><a href="https://www.facebook.com" target="_blank">Facebook</a></li>
                <li><a href="https://www.twitter.com" target="_blank">Twitter</a></li>
                <li><a href="https://www.instagram.com" target="_blank">Instagram</a></li>
            </ul>
        </div>
    </footer>
</body>
</html>

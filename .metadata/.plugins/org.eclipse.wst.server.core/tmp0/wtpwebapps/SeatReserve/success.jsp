<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

        /* Header Styles */
        header {
            background-color: #222; /* Darker background for the header */
            padding: 15px 0; /* Padding for header */
        }

        header h1 {
            color: #fff;
            font-size: 2.5rem; /* Adjusted font size */
            text-align: center; /* Centered text */
        }

        header nav ul {
            list-style: none;
            text-align: center; /* Center align navigation */
            padding: 0; /* Remove default padding */
        }

        header nav ul li {
            display: inline;
            margin: 0 15px; /* Spacing between items */
        }

        header nav ul li a {
            color: #fff;
            text-decoration: none;
            font-size: 1.2rem; /* Increased font size for links */
        }

        header nav ul li a:hover {
            text-decoration: underline; /* Underline on hover */
        }

        /* Main Content */
        .main-content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 50px 20px; /* Padding for spacing */
        }

        .main-content h1 {
            font-size: 3rem; /* Large heading */
            color: #ff6b6b; /* Bright color for emphasis */
            margin-bottom: 20px;
        }

        .main-content p {
            font-size: 1.2rem; /* Increased font size for readability */
            margin-bottom: 20px;
        }

        .btn {
            background-color: #ff6b6b; /* Button color */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #ff4a4a; /* Darker shade on hover */
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
    </style>
    <title>SeatReserve | Successful</title>
</head>
<body>
    <!-- Header Section -->
    <header>
        <div class="container">
            <h1>SeatReserve</h1>
            <nav>
                <ul>
                    <li><a href="#">Book a Ticket</a></li>
                    <li><a href="feedback.jsp">Feedback</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Main Content -->
    <div class="main-content">
        <div>
            <h1>Successful</h1>
            <a class="btn" href="homepage.jsp">Go Back to Home</a>
        </div>
    </div>

    <!-- Footer Section -->
    <footer>
        <div class="container">
            <p>&copy; 2024 SeatReserve. All Rights Reserved.</p>
            <ul class="social-links">
                <li><a href="#">Facebook</a></li>
                <li><a href="#">Twitter</a></li>
                <li><a href="#">Instagram</a></li>
            </ul>
        </div>
    </footer>
</body>
</html>

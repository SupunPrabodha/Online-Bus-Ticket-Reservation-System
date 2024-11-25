
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
            height: 100%;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #1e1e1e; /* Dark background */
            color: #d1d1d1; /* Light gray text */
            display: flex;
            flex-direction: column;
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
            background-color: #2b2b2b; /* Darker header */
            color: #f4f4f4; /* Light text */
            padding: 15px 0;
            width: 100%;
            position: relative;
            z-index: 10;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5); /* Slight shadow for depth */
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
            color: #f4f4f4;
            text-decoration: none;
        }

        header nav ul li a:hover {
            text-decoration: underline;
        }

        /* Admin Hero Section Styles */
        .hero {
            background: url('css/bus.jpg') no-repeat center center/cover;
            min-height: 60vh;
            color: #f4f4f4;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            border-bottom: 5px solid #ff6b6b;
        }

        .hero h2 {
            font-size: 2.5rem;
            margin-bottom: 10px;
        }

        .hero p {
            font-size: 1.2rem;
            margin-bottom: 20px;
        }

        /* Admin Navigation Bar */
        .admin-nav {
            display: flex;
            justify-content: space-around;
            background-color: #333;
            padding: 15px 0;
            margin-top: 20px;
        }

        .admin-nav a {
            color: #f4f4f4;
            text-decoration: none;
            font-weight: bold;
        }

        .admin-nav a:hover {
            color: #ff6b6b;
        }

        /* Form Section */
        .form-section {
            background-color: #2b2b2b;
            padding: 30px;
            text-align: center;
            min-height: 60vh;
        }

        .form-section h3 {
            color: #f4f4f4;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            color: #d1d1d1;
            display: block;
            margin-bottom: 10px;
        }

        .form-group input,
        button {
            padding: 12px;
            font-size: 1rem;
            width: 100%;
            max-width: 400px;
            margin: 0 auto;
            display: block;
            border-radius: 5px;
            border: none;
        }

        .form-group input {
            background-color: #3c3c3c;
            color: #f4f4f4;
        }

        button.btn {
            background-color: #ff6b6b;
            color: white;
            cursor: pointer;
        }

        button.btn:hover {
            background-color: #ff4a4a;
        }

        /* Footer Section */
        footer {
            background-color: #2b2b2b;
            color: #f4f4f4;
            text-align: center;
            padding: 20px 0;
            width: 100%;
            position: relative;
            bottom: 0;
            z-index: 10;
            box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.5); /* Shadow for top edge */
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
            color: #f4f4f4;
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

            .form-section form {
                padding: 20px;
            }
        }
    </style>
    <title>Admin Dashboard | SeatReserve</title>
</head>
<body>
    <!-- Header Section -->
    <header>
        <div class="container">
            <h1>SeatReserve Admin</h1>
            <nav>
                <ul>
                    <li><a href="#">Dashboard</a></li>
                    <li><a href="insertdriver.jsp">Add Driver</a></li>
                    <li><a href="#">Bus Schedules</a></li>
                    <li><a href="#">Reports</a></li>
                    <li><a href="logoutServlet">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <h2>Welcome, Admin</h2>
            <p>Manage all bus reservations, users, and more with ease.</p>
        </div>
    </section>

    <!-- Admin Navigation Section -->
    <section class="admin-nav">
        <div class="container">
            <a href="#">Users</a>
            <a href="#">Buses</a>
            <a href="#">Reservations</a>
            <a href="#">Feedback</a>
            <a href="#">Reports</a>
        </div>
    </section>

    <!-- Form Section for Admin Actions -->
    <section class="form-section">
        <div class="container">
            <h3>Manage Bus Schedules</h3>
            <form action="#">
                <div class="form-group">
                    <label for="bus-id">Bus ID</label>
                    <input type="text" id="bus-id" name="bus-id" placeholder="Enter Bus ID">
                </div>
                <div class="form-group">
                    <label for="route">Route</label>
                    <input type="text" id="route" name="route" placeholder="Enter Route">
                </div>
                <div class="form-group">
                    <label for="date">Date</label>
                    <input type="date" id="date" name="date">
                </div>
                <button type="submit" class="btn">Update Schedule</button>
            </form>
        </div>
    </section>

    <!-- Footer Section -->
    <footer>
        <div class="container">
            <p>&copy; 2024 SeatReserve Admin Dashboard. All rights reserved.</p>
            <ul class="social-links">
                <li><a href="#">Facebook</a></li>
                <li><a href="#">Twitter</a></li>
                <li><a href="#">Instagram</a></li>
            </ul>
        </div>
    </footer>
</body>
</html>


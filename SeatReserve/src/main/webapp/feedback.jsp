<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        /* General Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            scroll-behavior: smooth;
        }

        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            color: #333;
            opacity: 0;
            animation: fadeIn 1s ease-in forwards;
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
            top: 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            float: left;
            margin-left: 20px;
        }

        header nav ul {
            list-style: none;
            float: right;
            margin-right: 20px;
            display: flex;
            justify-content: flex-end;
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

        /* Background Section for Feedback and Form */
        .testimonial-background {
            background: url('css/Bus.jpg') no-repeat center center/cover;
            padding: 100px 0;
            color: #fff;
            position: relative;
        }

        .testimonial-background::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6); /* Dark overlay to enhance readability */
            z-index: 1;
        }

        .testimonial-content {
            position: relative;
            z-index: 2; /* Keep content on top */
            text-align: center;
            color: #fff;
        }

        .testimonial-header h1, .testimonial-header h4 {
            color: white;
        }

        .testimonial-carousel {
            margin: 30px 0;
        }

        /* Centering Feedback Title */
        .feedback-title {
            text-align: center;
            color: #fff;
            margin-bottom: 40px; /* Space below the title */
        }

        /* Feedback Item Styles */
        .testimonial-item {
            background-color: rgba(40, 40, 40, 0.9); /* Darker background for visibility */
            border-radius: 10px;
            padding: 20px;
            margin: 10px; /* Spacing between feedback items */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            color: #fff; /* Text color for readability */
        }

        .testimonial-item h4 {
            margin-top: 10px;
            color: #ff6b6b; /* Different color for client name */
        }

        /* Form Styles */
        .form-container {
            background-color: rgba(255, 255, 255, 0.9); /* Slightly transparent background for the form */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 30px auto;
            z-index: 3; /* Ensure form is above background */
            position: relative; /* Make sure it's positioned above the background */
        }

        .form-container h4 {
            color: #333;
        }

        input[type="text"], input[type="email"], select, textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #ff6b6b;
            color: #fff;
            border: none;
            padding: 15px 30px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        input[type="submit"]:hover {
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

            .testimonial-header h1 {
                font-size: 2rem;
            }

            .testimonial-carousel {
                padding: 0 15px;
            }
        }
    </style>
    <title>SeatReserve | Feedback Page</title>
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
                    <li><a href="useraccount.jsp">User Account</a></li>
                    <li><a href="logoutServlet">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Page Header Start -->
    <!-- Page Header End -->

    <!-- Background Section for Feedback and Form -->
    <div class="testimonial-background">
        <div class="container testimonial-content">
            <!-- Feedback Title -->
            <div class="feedback-title">
                <h1>Our Feedbacks</h1>
                <h2 class="display-5 mb-5">What Our Clients Are Saying</h2>
            </div>
            
            <div class="owl-carousel testimonial-carousel">
                <!-- Retrieve Feedbacks from Database -->
                <%
                    Connection conn = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/seatreserve", "root", "");
                        ps = conn.prepareStatement("SELECT * FROM feedbacks");
                        rs = ps.executeQuery();
                        while (rs.next()) {
                            String clientName = rs.getString("name");
                            String feedback = rs.getString("feedback");
                            int rating = rs.getInt("rating");
                %>
                <div class="testimonial-item">
                    <div class="position-relative">
                        <i class="fa fa-quote-right fa-2x text-secondary position-absolute" style="bottom: 30px; right: 0;"></i>
                        <div class="mb-4 pb-4 border-bottom border-secondary">
                            <p class="mb-0"><%= feedback %></p>
                        </div>
                        <div class="d-flex align-items-center">
                            <h4 class="text-dark"><%= clientName %></h4>
                            <div class="d-flex ms-4">
                                <% for (int i = 1; i <= rating; i++) { %>
                                    <i class="fas fa-star text-primary"></i>
                                <% } %>
                                <% for (int i = rating + 1; i <= 5; i++) { %>
                                    <i class="fas fa-star"></i>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
                <% } } catch (Exception e) { e.printStackTrace(); } finally { if (conn != null) conn.close(); } %>
            </div>
           
            <!-- Feedback Display Section End -->

            <!-- Add New Feedback Form Start -->
            <div class="form-container">
                <form action="FeedbackServlet" method="POST">
                    <h4 class="mb-4">Add New Feedback</h4>
                    <div class="row g-4">
                        <div class="col-lg-6">
                            <input type="text" name="name" placeholder="Your Name *" required>
                        </div>
                        <div class="col-lg-6">
                            <input type="email" name="email" placeholder="Your Email *" required>
                        </div>
                        <div class="col-lg-6">
                            <select name="rating" required>
                                <option value="" disabled selected>Rating *</option>
                                <option value="1">1 Star</option>
                                <option value="2">2 Stars</option>
                                <option value="3">3 Stars</option>
                                <option value="4">4 Stars</option>
                                <option value="5">5 Stars</option>
                            </select>
                        </div>
                        <div class="col-lg-12">
                            <textarea name="feedback" rows="5" placeholder="Feedback *" required></textarea>
                        </div>
                    </div>
                    <input type="submit" class="btn btn-success mt-4 py-3 px-5" value="Submit Feedback">
                </form>
            </div>
            <!-- Add New Feedback Form End -->
        </div>
    </div>

    <!-- Footer Start -->
    <footer>
        <p>&copy; 2024 SeatReserve. All Rights Reserved.</p>
        <ul class="social-links">
            <li><a href="#">Facebook</a></li>
            <li><a href="#">Twitter</a></li>
            <li><a href="#">Instagram</a></li>
        </ul>
    </footer>
    <!-- Footer End -->
</body>
</html>
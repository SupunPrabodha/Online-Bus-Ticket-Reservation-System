<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Submitted</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome for star icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
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
            color: #fff;
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
            position: relative;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Overlay for better text readability */
            z-index: 1;
        }

        .hero h1 {
            position: relative; /* Position relative to the hero */
            z-index: 2; /* Ensure the title is above the overlay */
        }

        .hero .card {
        max-width: 400px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 2; /* Ensure the card is above the overlay */
        }

        .card {
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
       
        .card-title {
            font-weight: 600;
            color: whilte;
        }
        .feedback-details p {
            font-size: 1.1rem;
            margin-bottom: 0.8rem;
            color: #333;
        }
        .feedback-details p strong {
            color: #333;
        }
        .fas.fa-star {
            color: #f5c518; /* Gold color for stars */
        }
        .btn-back, .btn-edit, .btn-delete {
            
            padding: 10px;
            background-color: #ff6b6b;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1rem;
        }
        .btn-back {
            background-color: #ff6b6b;
            color: white;
        }
        .btn-back:hover {
            background-color: #ff4a4a;
            color: white;
        }
        .btn-edit {
            background-color: #ff6b6b;
            color: white;
        }
        .btn-edit:hover {
            background-color: #ff4a4a;
            color: white;
        }
        .btn-delete {
            background-color: #ff6b6b;
            color: white;
        }
        .btn-delete:hover {
            background-color: #ff4a4a;
            color: white;
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

            .hero h1 {
                font-size: 2rem;
            }

            .login-section form {
                padding: 20px;
            }
        }
    </style>
    <title>SeatReserve | View Feedback</title>
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
        <h1 class="text-center mb-5">Thank you for your feedback!</h1>
        <div class="card mx-auto" style="max-width: 600px;">
            <div class="card-body">
                <h4 class="card-title">Feedback Details</h4>
                <div class="feedback-details">
                    <p><strong>Name:</strong> <%= request.getParameter("name") %></p>
                    <p><strong>Email:</strong> <%= request.getParameter("email") %></p>
                    <p><strong>Feedback:</strong> <%= request.getParameter("feedback") %></p>
                    <p><strong>Rating:</strong>
                        <% 
                            String ratingStr = request.getParameter("rating");
                            int rating = 0;
                            if (ratingStr != null) {
                                rating = Integer.parseInt(ratingStr);
                            }

                            // Display star icons based on rating
                            for (int i = 1; i <= rating; i++) {
                        %>
                            <i class="fas fa-star"></i>
                        <% 
                            }
                        %>
                    </p>

        <div class="text-center">
            <!-- Use feedback ID for edit and delete actions -->
            <a href="feedback.jsp" class="btn btn-back">Back to Home</a>
            <a href="EditFeedbackServlet?email=<%= request.getParameter("email") %>" class="btn btn-edit">Edit Feedback</a>
            <a href="DeleteFeedbackServlet?email=<%= request.getParameter("email") %>" class="btn btn-delete" 
               onclick="return confirm('Are you sure you want to delete this feedback?');">Delete Feedback</a>
        </div>
                        </div>
            </div>
        </div>
    </section>

    <!-- Bootstrap JS and Font Awesome JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

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

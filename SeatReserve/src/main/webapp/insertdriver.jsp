<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

            .form-section form {
                padding: 20px;
            }
        }
    </style>
    <title>SeatReserve | Add Driver</title>
</head>
<body>

    <!-- Header Section -->
    <header>
        <div class="container">
            <h1>SeatReserve Admin</h1>
            <nav>
                <ul>
                    <li><a href="#">Dashboard</a></li>
                    <li><a href="#">Manage Users</a></li>
                    <li><a href="#">Bus Schedules</a></li>
                    <li><a href="#">Reports</a></li>
                    <li><a href="logoutServlet">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Form Section for Adding Driver -->
    <section class="form-section">
        <div class="container">
            <h3>Add a New Driver</h3>
            <form action="insertDriverServlet" method="post">
                <div class="form-group">
                    <label for="drivername">Driver Name</label>
                    <input type="text" name="dname" required>
                </div>
                <div class="form-group">
                    <label for="phoneNum">Phone Number</label>
                    <input type="text" name="phonenum" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="nic">National Identity Number</label>
                    <input type="text" name="nic" required>
                </div>
                <div class="form-group">
                    <label for="username">Assign a User Name</label>
                    <input type="text" name="uname" required>
                </div>
                <div class="form-group">
                    <label for="password">Assign a Password</label>
                    <input type="password" name="pass" required>
                </div>
                <button type="submit" class="btn">Add Driver</button>
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

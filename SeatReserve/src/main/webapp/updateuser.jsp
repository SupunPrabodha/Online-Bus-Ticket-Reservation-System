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
    <title>SeatReserve | Update User Account</title>
     <script>
    function validatePasswords() {
        const password = document.querySelector('input[name="pass"]').value; // Updated to match the password field name
        const confirmPassword = document.querySelector('input[name="confirmPass"]').value; // Updated to match the confirm password field name

        if (password !== confirmPassword) {
            alert("Passwords do not match. Please try again.");
            return false; // Prevent form submission
        }
        return true; // Allow form submission
    }

    function validatePhoneNumber() {
        const phone = document.querySelector('input[name="phone"]').value;
        const phonePattern = /^0\d{9}$/; // Pattern for phone number: starts with '0' and followed by exactly 9 digits

        if (!phonePattern.test(phone)) {
            alert("Phone number must be exactly 10 digits long and start with '0'.");
            return false; // Prevent form submission
        }
        return true; // Allow form submission
    }

    function validateForm() {
        // Check if phone number validation passes and if the password validation passes
        return validatePhoneNumber() && validatePasswords(); 
    }
</script>

    <link rel="stylesheet" href="Style.css">
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
	
	<%
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
	%>
	<section class="login-section">
        <div class="container">
	<h2>Edit Details</h2>
	<form action ="UpdateUserServlet" method="post" onsubmit="return validateForm()">
		<div class="form-group">
			<label for = "username">User ID</label>
			<input type="text" name="uid" value="<%= id %>"readonly>
		</div>
		<div class="form-group">
			<label for="name">Name</label>
			<input type="text" name = "name" value="<%= name %>">
		</div>
		<div class="form-group">
			<label for="phonenum">Phone number</label>
			<input type="tel" name = "phone" value="<%= phone %>">
		</div>
		<div class="form-group">
			<label for="email">Email</label>
			<input type = "email" name="email" value="<%= email %>">
		</div>
		<div class="form-group">
			<label for ="username">User Name</label>
			<input type="text" name="username" value="<%= username %>">
		</div>
		<div class="form-group">
			<label for ="paswword">Password</label>
			<input type="password" name="pass" value="<%= password %>">
		</div>
		<div class="form-group">
			<label for="confirmPassword">Re-enter Password</label>
            <input type="password" name="confirmPass"value="<%=password %>">
		</div>
	<button type="submit"name="submit" class="btn" value="update">Update Account</button>
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
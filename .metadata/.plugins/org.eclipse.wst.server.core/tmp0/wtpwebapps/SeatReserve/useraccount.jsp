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

        /* Darkened background with overlay for the account section */
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
            background-color: rgba(0, 0, 0, 0.5); /* Darkened overlay for better text readability */
            z-index: 1;
        }

        .account-details {
            background: rgba(255, 255, 255, 0.80); /* Light background with 80% opacity */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 700px;
            width: 100%;
            z-index: 2; /* Ensure it stays above the overlay */
            position: relative;
        }

        .account-details h3 {
            font-size: 2rem;
            margin-bottom: 20px;
            color: #333;
        }

        .account-details table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }

        .account-details table td {
            padding: 15px;
            border-bottom: 1px solid #666;
            font-size: 1.1rem;
            color: #333;
        }

        .account-details table td:first-child {
            font-weight: bold;
            color: #000;
        }

        /* Button Styles */
        .btn {
            background-color: #ff6b6b;
            color: white;
            padding: 10px 15px;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
            width: 48%;
            margin: 5px 1%;
            font-size: 1rem;
        }

        .btn:hover {
            background-color: #ff4a4a;
        }

        /* Footer Styles */
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
    <title>SeatReserve | User Account</title>
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

<section class="login-section">
    <div class="account-details">
        <h3>User Account Details</h3>
        <table>
            <c:forEach var="us" items="${userDetails}">
                <c:set var="id" value="${us.id}" />
                <c:set var="name" value="${us.name}" />
                <c:set var="phone" value="${us.phone}" />
                <c:set var="email" value="${us.email}" />
                <c:set var="username" value="${us.username}" />
                <c:set var="password" value="${us.password}" />

                <tr>
                    <td>User ID:</td>
                    <td>${us.id}</td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td>${us.name}</td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td>${us.phone}</td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>${us.email}</td>
                </tr>
                <tr>
                    <td>Username:</td>
                    <td>${us.username}</td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>${us.password}</td>
                </tr>
            </c:forEach>
        </table>

        <div style="display: flex; justify-content: space-between;">
            <c:url value="updateuser.jsp" var="usupdate">
                <c:param name="id" value="${id}" />
                <c:param name="name" value="${name}" />
                <c:param name="phone" value="${phone}" />
                <c:param name="email" value="${email}" />
                <c:param name="username" value="${username}" />
                <c:param name="password" value="${password}" />
            </c:url>
            <a href="homepage.jsp" class="btn">Go to Homepage</a>
            <a href="${usupdate}" class="btn">Update Data</a>

            <c:url value="deleteuser.jsp" var="usdelete">
                <c:param name="id" value ="${id}"/>
 				<c:param name="name" value ="${name}"/>
 				<c:param name="phone" value ="${phone}"/>
 				<c:param name="email" value ="${email}"/>
 				<c:param name="username" value ="${username}"/>
 				<c:param name="password" value ="${password}"/>
            </c:url>
            <a href="${usdelete}" class="btn">Delete Account</a>
             
        </div>
    </div>
</section>

<footer>
    <p>&copy; 2024 SeatReserve. All rights reserved.</p>
    <ul class="social-links">
        <li><a href="#">Facebook</a></li>
        <li><a href="#">Twitter</a></li>
        <li><a href="#">Instagram</a></li>
    </ul>
</footer>

</body>
</html>

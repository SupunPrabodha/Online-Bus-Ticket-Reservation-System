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

        /* Table Section */
        .table-section {
            background-color: #2b2b2b;
            padding: 30px;
            text-align: center;
            min-height: 60vh;
        }

        .table-section h2 {
            color: #f4f4f4;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #d1d1d1;
        }

        th, td {
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #3c3c3c;
            color: #f4f4f4;
        }

        td {
            background-color: #3c3c3c;
            color: #d1d1d1;
        }

        a {
            color: #ff6b6b;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        button {
            background-color: #ff6b6b;
            color: white;
            cursor: pointer;
            border: none;
            padding: 10px;
            border-radius: 5px;
        }

        button:hover {
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

            .table-section table {
                font-size: 0.9rem;
            }
        }
    </style>
    <title>SeatReserve | Driver Details</title>
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

    <!-- Table Section for Driver Details -->
    <section class="table-section">
        <div class="container">
            <h2>Driver Details</h2>
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>NIC</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dr" items="${driverDetails}">
                        <tr>
                            <td>${dr.dname}</td>
                            <td>${dr.phone}</td>
                            <td>${dr.demail}</td>
                            <td>${dr.nic}</td>
                            <td>${dr.dusername}</td>
                            <td>${dr.dpassword}</td>
                            <td>
                                <!-- Update action -->
                                <a href="updateDriverFormServlet?id=${dr.did}">Update</a> | 
                                
                                <!-- Delete action -->
                                <form action="deleteDriverServlet" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="${dr.did}" />
                                    <button type="submit" onclick="return confirm('Are you sure you want to delete this driver?');">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty driverDetails}">
                        <tr>
                            <td colspan="7">No drivers found.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
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

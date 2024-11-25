<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SeatReserve | Update Reservation</title>
<script>

	window.onload = function(){
		calculateCostPerSeat();
	}
	
	let costPerSeat;
    // Function to calculate total cost dynamically
    function calculateCostPerSeat() {
    	
        const seatCount = document.getElementById("seatCount").value;
        console.log("Hello");
        console.log("seatcount = " ,seatCount);
        const totalCost = document.getElementById("totalCost").value;
        console.log("total = " , totalCost);
        costPerSeat = (totalCost / seatCount);
        console.log("costperseat = " , costPerSeat); // Display result in 2 decimal places
    }
    
    function calUpdatedTotalCost(){
    	const seatCount = document.getElementById("seatCount").value;
    	 console.log("seatcount = " ,seatCount);
    	const updateTtlCost = seatCount * costPerSeat;
    	 console.log("updatedTtl = " ,updateTtlCost);
    	 document.getElementById("totalCost").value = updateTtlCost.toFixed(2);
    	
    }
    
</script>

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
        }

    form {
        max-width: 600px;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    label {
        display: block;
        margin-bottom: 8px;
        font-size: 1rem;
        color: #333;
        font-weight: bold;
    }

    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1rem;
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
        .hero::before {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Overlay for better text readability */
            z-index: 1;
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
    
    .btn-submit {
    background-color: #091057; 
    color: white;
    font-size: 1.1rem;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s ease, transform 0.2s ease;
	}

	.btn-submit:hover {
    background-color: #001F3F; 
    transform: translateY(-2px); 
	}

	.btn-submit:active {
    background-color: #091057; 
    transform: translateY(0); 
	}

	.btn-submit:focus {
    outline: none; 
    box-shadow: 0 0 0 3px rgba(40, 167, 69, 0.5); 
	}
	
	input[type="date"] {
    width: 100%;
    padding: 10px;
    font-size: 1rem;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
    margin-bottom: 20px;
    background-color: #f9f9f9;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

	.hero form {
            max-width: 400px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            z-index: 2;
        }
	        .hero button.btn {
            width: 100%;
            padding: 10px;
            background-color: #ff6b6b;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1rem;
        }

        .hero button.btn:hover {
            background-color: #ff4a4a;
        }
	

   
    @media (max-width: 768px) {
        body {
            padding: 20px;
        }

        form {
            padding: 15px;
            
        }

        label, input {
            font-size: 0.9rem;
        }
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
</head>
<body>
<header>
        <div class="container">
            <h1>SeatReserve</h1>
            <nav>
                <ul>
                    <li><a href="homepage.jsp">Home</a></li>
                    <li><a href="feedback.jsp">Feedback</a></li>
                    <li><a href="aboutus.jsp">About Us</a></li>
                    <li><a href="contactus.jsp">Contact</a></li>
                    <li><a href="logoutServlet">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

	<%
		String resId = request.getParameter("resId");
		String name = request.getParameter("name");
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String seatCount = request.getParameter("seatCount");
		String cost = request.getParameter("cost");
	%>
<section class="hero">
	<form action="updateServlet" method="post">
		<label for="resId">Reservation Id</label>
		<input type="text" id="resId" name="resId" value="<%= resId%>" readonly>
		
		<label for="name">Name</label>
		<input type="text" id="name" name="name" value="<%= name%>" readonly>
		
		<label for="from">From</label>
		<input type="text" id="from" name="from" value="<%= from%>" readonly>
		
		<label for="to">To</label>
		<input type="text" id="to" name="to" value="<%= to%>" readonly>
		
		<label for="date">Departure Date</label>
		<input type="date" id="date" name="date" value="<%= date%>">
		
		<label for="time">Departure Time</label>
		<input type="text" id="time" name="time" value="<%= time%>" readonly>
		
		<label>Seat Count</label>
		<input type="text" id="seatCount" name="seatCount" min="1" max="55" value="<%= seatCount%>" oninput="calUpdatedTotalCost()">
		
		<label for="cost">Cost</label>
		<input type="text" id="totalCost" name="cost" value="<%= cost%>" readonly>
		
		<button type="submit" class="btn" value="Update" class="btn-submit">Update</button>
	</form>
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
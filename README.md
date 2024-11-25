# Online Bus Ticket Reservation System  

This project was developed as the **2nd-year, 1st-semester Object-Oriented Programming (OOP) group project of SLIIT**. It is a robust web-based application designed to simplify and enhance the process of reserving bus tickets online.  

## Features  

### Passenger Features:  
- **User Registration & Login**  
- **Account Management**: Update and delete user accounts.  
- **Feedback Management**: Add, update, view, and delete feedback.  
- **Bus Reservation**:  
  - View available buses.  
  - Book seats based on customer requirements.  
  - Update or cancel reservations.  
- **Payment System**:  
  - Add, view, and delete card details.  
  - Proceed with payments.  
  - Receive payment confirmations.  
- **Miscellaneous**:  
  - View "About Us" and "Contact Us" pages.  
  - Logout securely.  

### Admin Features:  
- **Add Drivers**: Add, view, update and delete the driver detials.

## Technologies Used  

### Languages:  
- HTML  
- CSS  
- SCSS  
- Java  
- JavaScript  
- SQL  

### Tools:  
- **Eclipse IDE**  
- **MySQL Workbench**  
- **Apache Tomcat Server**  

## How to Run  

### Prerequisites:  
1. Install **Java Development Kit (JDK)**.  
2. Install **Eclipse IDE**.  
3. Set up **Apache Tomcat Server**.  
4. Install **MySQL Workbench** and configure the database.  

### Steps to Deploy:  
1. **Clone the Repository**:  
   ```bash  
   git clone https://github.com/your-github-username/online-bus-ticket-reservation.git  
2. Import Project into Eclipse:

- Open Eclipse IDE.
- Select **File > Import > Existing Projects into Workspace**.
- Choose the cloned project folder and click **Finish**.

3. Set Up Database:

- Open MySQL Workbench and create a new database (e.g., `bus_ticket_db`).
- Import the provided SQL script (`database_script.sql`) to initialize the database schema and populate it with sample data.

4. Configure Tomcat Server:

- In Eclipse, go to **Servers*** view and add a new **Apache Tomcat Server**.
- Set the deployment path to the project.

5. Run the Application:

- Right-click on the project in Eclipse.
- Select **Run As > Run on Server**.
- Choose the configured Tomcat Server and click Finish.

6. Access the Application:

- Open a web browser and navigate to`http://localhost:8080/online-bus-ticket-reservation`.

## Default Admin Credentials:

- Set the **username** and **password** for the admin in the **workbench** database. Because there are no any registration method for the administrator.

## Project Structure
- **Frontend**: Built with HTML, CSS, SCSS, and JavaScript.
- **Backend**: Java-powered servlets and JSPs.
- **Database**: MySQL, for storing user accounts, feedback, reservations, and transactions.

## License

This project is licensed under the MIT License.


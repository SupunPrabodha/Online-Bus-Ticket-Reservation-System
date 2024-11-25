
package pay_gate;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	private static String url = "jdbc:mysql://127.0.0.1:3306/seatreserve";
	private static String user = "root";
	private static String password = "";
	
	private static Connection con;
	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, user, password);
			
		}
		catch(Exception e) {
			System.out.println("Database Connection is not Success!");
		}
		return con;
	}
}

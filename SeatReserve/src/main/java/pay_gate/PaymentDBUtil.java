package pay_gate;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PaymentDBUtil {
	
	private static boolean isSuccess;
	private static Connection con =null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static List<Passenger> validate(String Passenger_name, String card_number){
		
		ArrayList<Passenger> pas = new ArrayList<>();
		
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from payment where Passenger_name = '"+Passenger_name+"' and email = '"+card_number+"'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				int pid = rs.getInt(1);
				String pass_name = rs.getString(2);
				String P_card_num = rs.getString(3);
				String CVV_c = rs.getString(4);
				String Expiry_d = rs.getString(5);
				String P_email = rs.getString(6);
				String P_amount = rs.getString(7);
				
				Passenger P = new Passenger(pid,pass_name,P_card_num,CVV_c,Expiry_d,P_email,P_amount);
				pas.add(P);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		
		return pas;
	}
	
	
	public static boolean insertPassenger(String Passenger_name,String card_number,String CVV_code,String Expiry_date,String email,String Payment_Amount) {
		
		boolean isSuccess = false;
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "insert into payment values(0,'"+Passenger_name+"', '"+card_number+"', '"+CVV_code+"', '"+Expiry_date+"', '"+email+"', '"+Payment_Amount+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
				
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
		
		
	}
	
	public static boolean updatePassenger(String pid,String Passenger_name,String email,String card_number,String CVV_code,String Expiry_date,String Payment_Amount) {
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "update payment set PID = '"+pid+"',Passenger_name='"+Passenger_name+"', email='"+email+"', card_number='"+card_number+"',CVV_code='"+CVV_code+"', Expiry_date='"+Expiry_date+"', Payment_Amount='"+Payment_Amount+"' Where PID='"+pid+"'";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public static List<Passenger> getPassengerDetails(String pid){
		//convert String to integer
		int convertID = Integer.parseInt(pid);
		
		ArrayList<Passenger> pass = new ArrayList<>();
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "Select * from payment where pid = '"+convertID+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int PID = rs.getInt(1);
				String Passenger_name = rs.getString(2);
				String card_number = rs.getString(3);
				String CVV_code = rs.getString(4);
				String Expire_date = rs.getString(5);
				String email = rs.getString(6);
				String Payment_amount = rs.getString(7);
				
				Passenger p = new Passenger(PID,Passenger_name,card_number,CVV_code,Expire_date,email,Payment_amount);
				pass.add(p);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return pass;
	}
	
	public static boolean deletePassenger(String pid) {
		
		int convID = Integer.parseInt(pid);
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "Delete from payment where PID='"+convID+"'";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
}

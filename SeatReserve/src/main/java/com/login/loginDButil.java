package com.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class loginDButil {
	public static boolean validate(String UserName, String Password){
		boolean isSuccess = false;
		
		String url ="jdbc:mysql://127.0.0.1:3306/seatreserve";
		String user = "root";
		String pass = "";
		
		User U = User.getInstance();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, user, pass);
			Statement stmt = con.createStatement();
					
			String sql = "SELECT * FROM login WHERE username='"+UserName+"' and password='"+Password+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	
	public static List<User> getUser(String userName){
		ArrayList<User> us = new ArrayList<>();
		
		String url ="jdbc:mysql://127.0.0.1:3306/seatreserve";
		String user = "root";
		String pass = "";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, user, pass);
			Statement stmt = con.createStatement();
			
			String sql = "SELECT * FROM login WHERE username='"+userName+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String phone = rs.getString(3);
				String email = rs.getString(4);
				String username = rs.getString(5);
				String password = rs.getString(6);
				
				User u = new User(id,name,phone,email,username,password);
				us.add(u);
			}
			
		}catch(Exception e) {
			e.getStackTrace();
		}
		return us;
	}
	
	public static boolean insertuser(String name,String phone, String email,String username,String password) {
		boolean isSuccess = false;

		String url ="jdbc:mysql://127.0.0.1:3306/seatreserve";
		String user = "root";
		String pass = "";
				
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, user, pass);
			Statement stmt = con.createStatement();
					
			String sql = "INSERT INTO login VALUES (0,'"+name+"','"+phone+"','"+email+"','"+username+"','"+password+"')"; 
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public static boolean updateuser(String id,String name,String phone,String email,String username,String password) {
		
		boolean isSuccess=false;

		String url ="jdbc:mysql://127.0.0.1:3306/seatreserve";
		String user = "root";
		String pass = "";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, user, pass);
			Statement stmt = con.createStatement();
			
			String sql="UPDATE login SET name='"+name+"',phone='"+phone+"',email='"+email+"',username='"+username+"',password='"+password+"'"+"where id='"+id+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess=true;
			}else {
				isSuccess=false;
			}
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public static List<User> getUserDetails(String Id){
		
		int convertedID = Integer.parseInt(Id);
		
		ArrayList<User> us = new ArrayList<>();
		
		String url ="jdbc:mysql://127.0.0.1:3306/seatreserve";
		String user = "root";
		String pass = "";
		
		try {
			
			Connection con = DriverManager.getConnection(url, user, pass);
			Statement stmt = con.createStatement();
			
			String sql = "SELECT * FROM login WHERE id='"+convertedID+"' ";
			
			ResultSet rs = stmt.executeQuery(sql);

			
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String phone = rs.getString(3);
				String email = rs.getString(4);
				String username = rs.getString(5);
				String password = rs.getString(6);
				
				User u = new User(id, name, phone, email, username, password);
				
				us.add(u);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return us;
	}
	
	public static boolean deleteUser(String id) {
		boolean isSuccess=false;
		
		int convertID = Integer.parseInt(id);

		String url ="jdbc:mysql://127.0.0.1:3306/seatreserve";
		String user = "root";
		String pass = "";
		
		try {
			Connection con = DriverManager.getConnection(url, user, pass);
			Statement stmt = con.createStatement();
			
			String sql = "DELETE FROM login WHERE id='"+convertID+"'";
			
			int r = stmt.executeUpdate(sql);
			
			if(r>0) {
				isSuccess =true;
			}else {
				isSuccess=false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}
	
	
	
	
	
	
	
	
	public static boolean insertdriver(String name,String phone, String email,String nic, String username,String password) {
		boolean isSuccess = false;

		String url ="jdbc:mysql://127.0.0.1:3306/seatreserve";
		String user = "root";
		String pass = "";
				
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, user, pass);
			Statement stmt = con.createStatement();
					
			String sql = "INSERT INTO driver VALUES (0,'"+name+"','"+phone+"','"+email+"','"+nic+"','"+username+"','"+password+"')"; 
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
public static ArrayList<Driver> getDriverDetails(String Id){
		
		int convertedID = Integer.parseInt(Id);
		
		ArrayList<Driver> D = new ArrayList<>();
		
		String url ="jdbc:mysql://127.0.0.1:3306/seatreserve";
		String user = "root";
		String pass = "";
		
		try {
			
			Connection con = DriverManager.getConnection(url, user, pass);
			Statement stmt = con.createStatement();
			
			String sql = "SELECT * FROM driver WHERE did='"+convertedID+"' ";
			
			ResultSet rs = stmt.executeQuery(sql);

			
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String phone = rs.getString(3);
				String email = rs.getString(4);
				String nic = rs.getString(5);
				String username = rs.getString(6);
				String password = rs.getString(7);
				
				Driver d = new Driver(id, name, phone, email, nic, username, password);
				
				D.add(d);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return D;
	}

	public static List<Driver> selectAllDrivers(){
		ArrayList<Driver> dr = new ArrayList<>();
		
		String url ="jdbc:mysql://127.0.0.1:3306/seatreserve";
		String user = "root";
		String pass = "";
		
		try {
			Connection con = DriverManager.getConnection(url, user, pass);
			Statement stmt = con.createStatement();
			
			String sql = "SELECT * FROM driver";
				
			ResultSet rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					int id = rs.getInt(1);
					String name = rs.getString(2);
					String phone = rs.getString(3);
					String email = rs.getString(4);
					String nic = rs.getString(5);
					String username = rs.getString(6);
					String password = rs.getString(7);
					
					dr.add(new Driver(id,name,phone,email,nic,username,password));
				}
	}catch(Exception e) {
		e.printStackTrace();
					
		}
		return dr;
	}
	
	public Driver getDriverById(String driverId) {
        Driver driver = null;
        
		String url ="jdbc:mysql://127.0.0.1:3306/seatreserve";
		String user = "root";
		String pass = "";
		
        try (Connection connection = DriverManager.getConnection(url,user,pass)) {
            String query = "SELECT * FROM driver WHERE did = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, driverId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                driver = new Driver(rs.getInt("id"), rs.getString("dname"), 
                        rs.getString("phone"), rs.getString("email"), 
                        rs.getString("nic"), rs.getString("username"), rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return driver;
    }


	public static boolean deleteDriver(String driverId) {
		boolean isSuccess=false;
		
		int convertID = Integer.parseInt(driverId);

		String url ="jdbc:mysql://127.0.0.1:3306/seatreserve";
		String user = "root";
		String pass = "";
		
		try {
			Connection con = DriverManager.getConnection(url, user, pass);
			Statement stmt = con.createStatement();
			
			String sql = "DELETE FROM driver WHERE did='"+convertID+"'";
			
			int r = stmt.executeUpdate(sql);
			
			if(r>0) {
				isSuccess =true;
			}else {
				isSuccess=false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}
	
    
	public static boolean updateDriver(String did,String name,String phone,String email, String nic,String username,String password) {
		
		boolean isSuccess=false;

		String url ="jdbc:mysql://127.0.0.1:3306/seatreserve";
		String user = "root";
		String pass = "";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, user, pass);
			Statement stmt = con.createStatement();
			
			String sql="UPDATE driver SET dname='"+name+"',dphone='"+phone+"',demail='"+email+"',dnic='"+nic+"', dusername='"+username+"',dpassword='"+password+"' where did='"+did+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess=true;
			}else {
				isSuccess=false;
			}
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
}
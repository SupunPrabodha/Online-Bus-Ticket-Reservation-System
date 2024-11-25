package BookingSystem;

import java.sql.*;
import java.util.*;

public class BkControl {

	public static int insertdata(BookingModel b) {      //insert function
		int status =0;
		
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps =con.prepareStatement(
					"insert into booking(name, from_loc, to_loc, departure_date, departure_time, seat_count, cost, bus_id, user_id) values (?,?,?,?,?,?,?,?,?)");
			
			ps.setString(1, b.getName());
			ps.setString(2, b.getFrom());
			ps.setString(3, b.getTo());
			ps.setString(4, b.getDepartureDate());
			ps.setString(5, b.getDepartureTime());
			ps.setInt(6, b.getSeatCount());
			ps.setDouble(7, b.getCost());
			ps.setInt(8, b.getBusId());
			ps.setInt(9, b.getUserId());
			
			status = ps.executeUpdate();
			
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}
	
	
	public static List<BookingModel> displayBooking(int userId) {       //read function
		
		List<BookingModel> bookings = new ArrayList<>();
		
		String sql = "select * from booking where user_id=?";
		
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			
			
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				BookingModel b = new BookingModel();
				
				b.setResId(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setFrom(rs.getString(3));
				b.setTo(rs.getString(4));
				b.setDepartureDate(rs.getString(5));
				b.setDepartureTime(rs.getString(6));
				b.setSeatCount(rs.getInt(7));
				b.setCost(rs.getDouble(8));
				b.setBusId(rs.getInt(9));
				b.setUserId(rs.getInt(10));
				
				bookings.add(b);
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return bookings;
	}
	
	
	public static boolean delete(int bookingID) {           //delete function
        boolean isSuccess = false;
        
        String sql = "DELETE FROM booking WHERE resId = ?";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            
            preparedStatement.setInt(1, bookingID);
            
            int result = preparedStatement.executeUpdate();
            
            if (result > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return isSuccess;
    }
	
	
	
	public static boolean updateBooking(int resID, String date, int seatCount, double cost) {         //update function
		boolean isSuccess=false;
		
		String sql = "UPDATE booking SET departure_date = ?, seat_count = ?, cost = ? WHERE resId = ?";
		
		try(Connection con = DBConnection.getConnection()){
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, date);
			ps.setInt(2, seatCount);
			ps.setDouble(3, cost);
			ps.setInt(4, resID);
			
			
			int result = ps.executeUpdate();
			
			isSuccess = result > 0;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	 
	 
}

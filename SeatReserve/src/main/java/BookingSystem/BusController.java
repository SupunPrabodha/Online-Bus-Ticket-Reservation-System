package BookingSystem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BusController {
	
	public static List<BusModel> searchBuses (String startPoint, String endPoint){
		List<BusModel> buses = new ArrayList<>();
		
		String sql = "SELECT * FROM buses WHERE start_point = ? AND end_point = ?";
		
		try(Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
			
			ps.setString(1, startPoint);
			ps.setString(2, endPoint);
		
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				int busID = rs.getInt("id");
				String start = rs.getString("start_point");
				String end = rs.getString("end_point");
				Time departureTime = rs.getTime("departure_time");
				Time arrival_time = rs.getTime("arrival_time");
				int seatcount = rs.getInt("available_seats");
				Double cost = rs.getDouble("cost_per_seat");
				Date datee = rs.getDate("date");
				
				BusModel bus = new BusModel( busID, start, end, departureTime, arrival_time, seatcount, cost, datee);
				
				buses.add(bus);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		return buses;
	}
	
	
	
	public static List<BusModel> getBookingsBybusId(int busId) {
        List<BusModel> bookedBus = new ArrayList<>();
        
        String sql = "SELECT * FROM buses WHERE id = ?";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            
            preparedStatement.setInt(1, busId);
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()) {
                int id = rs.getInt("id");
                String start_point = rs.getString("start_point");
                String end_point = rs.getString("end_point");
                Time departure_time = rs.getTime("departure_time");
                Time arrival_time = rs.getTime("arrival_time");
                int available_seats = rs.getInt("available_seats");
                double cost_per_seat = rs.getDouble("cost_per_seat");
                Date date = rs.getDate("date");
                
                BusModel busDe = new BusModel(id, start_point, end_point, departure_time, arrival_time, available_seats, cost_per_seat, date);
                bookedBus.add(busDe);
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return bookedBus;
    }

}

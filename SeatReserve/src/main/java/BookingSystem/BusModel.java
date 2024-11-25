package BookingSystem;

import java.sql.Time;
import java.util.Date;

public class BusModel {
	private int id;
	private String start_point;
	private String end_point;
	private Time departureTime;
    private Time arrivalTime;
    private int availableSeats;
    private double costPerSeat;
    private Date date;
    
    
	public BusModel(int id, String start_point, String end_point, Time departureTime, Time arrivalTime,
			int availableSeats, double costPerSeat, Date date) {
		this.id = id;
		this.start_point = start_point;
		this.end_point = end_point;
		this.departureTime = departureTime;
		this.arrivalTime = arrivalTime;
		this.availableSeats = availableSeats;
		this.costPerSeat = costPerSeat;
		this.date = date;
	}
	
	
	

	public BusModel() {
		super();
	}




	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStart_point() {
		return start_point;
	}

	public void setStart_point(String start_point) {
		this.start_point = start_point;
	}

	public String getEnd_point() {
		return end_point;
	}

	public void setEnd_point(String end_point) {
		this.end_point = end_point;
	}

	public Time getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(Time departureTime) {
		this.departureTime = departureTime;
	}

	public Time getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(Time arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	public int getAvailableSeats() {
		return availableSeats;
	}

	public void setAvailableSeats(int availableSeats) {
		this.availableSeats = availableSeats;
	}

	public double getCostPerSeat() {
		return costPerSeat;
	}

	public void setCostPerSeat(double costPerSeat) {
		this.costPerSeat = costPerSeat;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	
}

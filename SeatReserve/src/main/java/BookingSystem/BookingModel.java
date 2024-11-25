package BookingSystem;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

public class BookingModel {
	private int resId;
	private String name;
	private String from;
	private String to;
	private String departureDate;
	private String departureTime;
	private int seatCount;
	private double cost;
	private int busId;
	private int userId;
	
	
	public BookingModel() {
		
	}
	
	
	  public BookingModel(String name, String from, String to, String departureDate,String departureTime, int seatCount, double cost, int busId, int userId) { 
		  super();
	  this.name = name; 
	  this.from = from; 
	  this.to = to; 
	  this.departureDate = departureDate; 
	  this.departureTime = departureTime; 
	  this.seatCount = seatCount; 
	  this.cost = cost; 
	  this.busId = busId; 
	  this.userId=userId;
	  
	  }
	  
	  
	  
	  public BookingModel(String name, String from, String to, int seatCount, double cost, int busId) { 
		  super();
	  this.name = name; 
	  this.from = from; 
	  this.to = to; 
	  this.seatCount = seatCount; 
	  this.cost = cost; 
	  this.busId = busId; 
	  
	  }
	  
	  
	  
	  public BookingModel(String name, String from, String to, String departureTime, int seatCount, double cost, int busId) { 
		  super();
	  this.name = name; 
	  this.from = from; 
	  this.to = to; 
	  this.seatCount = seatCount; 
	  this.cost = cost; 
	  this.busId = busId; 
	  
	  }
	 

	  public int getUserId() {
		return userId;
	}


	  public void setUserId(int userId) {
		this.userId = userId;
	  }


	  public int getBusId() {
		  return busId;
	  }
	  
	  public void setBusId(int busId) {
		  this.busId = busId;
	  }
	  
	  public int getResId() {
		  return resId; 
	  }
	  
	  
	  public void setResId(int resId) {
		  this.resId = resId; 
	  }
	  
	  
	  public String getName() {
		  return name;
	  }
	  
	  
	  public void setName(String name) { 
		  this.name = name; 
	  }
	 


	public String getFrom() {
		return from;
	}


	public void setFrom(String from) {
		this.from = from;
	}


	public String getTo() {
		return to;
	}


	public void setTo(String to) {
		this.to = to;
	}


	
	  public String getDepartureDate() {
		  return departureDate;
	  }
	  
	  
	  public void setDepartureDate(String departureDate) {
		  this.departureDate = departureDate; 
	  }
	  
	  
	  public String getDepartureTime() {
		  return departureTime; 
	  }
	  
	  
	  public void setDepartureTime(String departureTime) {
		  this.departureTime = departureTime; 
	  }
	  
	  
	  public int getSeatCount() {
		  return seatCount; 
	  }
	  
	  
	  public void setSeatCount(int seatCount) {
		  this.seatCount = seatCount; 
	  }
	  
	  
	  public double getCost() {
		  return cost; 
	  }
	  
	  
	  public void setCost(double cost) {
		  this.cost = cost; 
	  }
	  
	  
	  public static void controlBookings(BookingModel bm) {
		  
	  }
	  
	  
	  //method to filter active bookings
	  public  boolean displayActive(BookingModel bm) {
		  
		  Boolean isTrue = false;
		  
		  String dateStr = bm.getDepartureDate();
		  
		  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		  
		  try {
			  LocalDate inputDate = LocalDate.parse(dateStr,formatter);
			  
			  LocalDate currentDate = LocalDate.now();
			  
			  if(inputDate.isAfter(currentDate)) {
				  isTrue=true;
			  }else {
				  isTrue=false;
			  }
		  }catch(DateTimeParseException e) {
			  e.printStackTrace();
		  }
		  
		 return isTrue;
		 
	  }
	  
	  //method to filter past bookings
	  public boolean displayInactive(BookingModel bm) {
		  
		  Boolean isTrue=false;
		  
		  String dateStr = bm.getDepartureDate();
		  
		  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		  
		  try {
			  LocalDate inputDate = LocalDate.parse(dateStr,formatter);
			  
			  LocalDate currentDate = LocalDate.now();
			  
			  if(inputDate.isBefore(currentDate)) {
				  isTrue=true;
			  }else {
				  isTrue=false;
			  }
			  
		  }catch(DateTimeParseException e) {
			  e.printStackTrace();
		  }
		  
		  return isTrue;
		  
		  
	  }
	 
	
	
}

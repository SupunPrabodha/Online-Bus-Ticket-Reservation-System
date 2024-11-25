package pay_gate;

public class Passenger {
	private int pid;
	private String Passenger_name;
	private String card_number;
	private String CVV_code;
	private String Expire_date;
	private String email;
	private String Payment_amount;
	
	public Passenger(int pid, String passenger_name, String card_number, String cVV_code, String expire_date,String email, String payment_amount) {
		this.pid = pid;
		Passenger_name = passenger_name;
		this.card_number = card_number;
		CVV_code = cVV_code;
		Expire_date = expire_date;
		this.email = email;
		Payment_amount = payment_amount;
	}

	public int getPid() {
		return pid;
	}

	public String getPassenger_name() {
		return Passenger_name;
	}

	public String getCard_number() {
		return card_number;
	}

	public String getCVV_code() {
		return CVV_code;
	}

	public String getExpire_date() {
		return Expire_date;
	}

	public String getEmail() {
		return email;
	}

	public String getPayment_amount() {
		return Payment_amount;
	}

	
	
	 
}

package data;

public class Transaction {
	private int id;
	private String source;
	private String dest;
	private double amount;
	private String type;
	private String time;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getSource() {
		return source;
	}

	public void setSource(String name) {
		this.source = name;
	}
	
	public String getDest() {
		return dest;
	}

	public void setDest(String name) {
		this.dest = name;
	}
	
	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public String getTime() {
		return time;
	}	
	
	public void setTime(String time) {
		this.time = time;
	}	
}

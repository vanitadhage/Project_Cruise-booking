package cruisebooking.dao;

import java.util.Arrays;

public class CreateCruise {
	private int id;
	private String cruiseId;
	private String poiletId;
	private String fromLocation;
	private String toLocation;
	private String date;
	private String time;
	private double price;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCruiseId() {
		return cruiseId;
	}
	public void setCruiseId(String cruiseId) {
		this.cruiseId = cruiseId;
	}
	public String getPoiletId() {
		return poiletId;
	}
	public void setPoiletId(String poiletId) {
		this.poiletId = poiletId;
	}
	public String getFromLocation() {
		return fromLocation;
	}
	public void setFromLocation(String fromLocation) {
		this.fromLocation = fromLocation;
	}
	public String getToLocation() {
		return toLocation;
	}
	public void setToLocation(String toLocation) {
		this.toLocation = toLocation;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "CreateCruise [id=" + id + ", cruiseId=" + cruiseId + ", poiletId=" + poiletId + ", fromLocation="
				+ fromLocation + ", toLocation=" + toLocation + ", date=" + date + ", time=" + time + ", price=" + price
				+ "]";
	}
	
	
	
	
	

}

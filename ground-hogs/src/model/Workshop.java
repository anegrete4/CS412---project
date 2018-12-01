package model;

public class Workshop {
	public Workshop(int workshopId, String workshopName, String workshopDescription, String workshopDay, String workshopTime, int workshopCapacity, int registration) {
		this.workshopId=workshopId;
		this.workshopName=workshopName;
		this.workshopDescription=workshopDescription;
		this.workshopDay=workshopDay;
		this.workshopTime=workshopTime;
		this.workshopCapacity=workshopCapacity;
		this.registration=registration;
	}
	public int getWorkshopId() {
		return workshopId;
	}
	public String getWorkshopName() {
		return workshopName;
	}
	public String getWorkshopDescription() {
		return workshopDescription;
	}
	public String getWorkshopDay() {
		return workshopDay;
	}
	public String getWorkshopTime() {
		return workshopTime;
	}
	public int getWorkshopCapacity() {
		return workshopCapacity;
	}
	public int getRegistration() {
		return registration;
	}
	private int workshopId;
	private String workshopName;
	private String workshopDescription;
	private String workshopDay;
	private String workshopTime;
	private int workshopCapacity;
	private int registration;
	
}

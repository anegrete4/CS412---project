package model;

import java.util.ArrayList;

public class Order {
	private int orderId;
	private double flatDiscountAmount;
	private double percentDiscountRate;
	private boolean isNewOrder;
	private ArrayList <SalesItem> items;
	private double taxRate;
	
	public void addItem(SalesItem item) {
		items.add(item);
	}
	public void removeItem(SalesItem item) {
		
	}
	private double getTotalAmount() {
		double amount=0;
		for(SalesItem item:items) {
			amount+=item.getItemPrice();
		}
		return amount;
	}
	private double getAmountBeforeTax() {
		return (1-percentDiscountRate)*(getTotalAmount()-flatDiscountAmount);
	}
	private double getTaxAmount() {
		return (getAmountBeforeTax())*taxRate;
	}
	public double getCalculatedAmount() {
		return getAmountBeforeTax()+getTaxAmount();
	}
	public void setFlatDiscount(double discount) {
		this.flatDiscountAmount=discount;
	}
	public void setPercentDiscountAmount(double pctDiscount) {
		if(pctDiscount<=1) {
			this.percentDiscountRate=pctDiscount;
		}
		else {
			this.percentDiscountRate=0;
		}
	}
	public void checkOutOrder() {
		
	}
}

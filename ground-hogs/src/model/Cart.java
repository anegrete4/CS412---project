package model;

import java.util.Enumeration;
import java.util.Hashtable;

public class Cart {
	public static final double TAX_PERCENT = 0.078;
	private Hashtable<Integer, CartItem> cartItems = new Hashtable<Integer, CartItem>();
	private double shippmentAmount = 5.00;

	public void setShippmentAmount(double amt) {
		this.shippmentAmount = amt;
	}

	public double getShippmentAmount() {
		return shippmentAmount;
	}

	public Enumeration<CartItem> getCartItems() {
		return cartItems.elements();
	}

	public void addItem(int quantity, SalesItem item) {
		if (cartItems.get(item.getItemId()) != null) {
			CartItem cartItem = cartItems.get(item.getItemId());
			cartItem.add(quantity);
		} else {
			cartItems.put(item.getItemId(), new CartItem(quantity, item));
		}
	}

	public void updateQuantity(int id, int newCount) {
		CartItem item = cartItems.get(id);
		if (newCount <= 0) {
			cartItems.remove(id);
		} else {
			item.setItemCount(newCount);
		}
	}

	public double getSubTotal() {
		double total = 0.0;
		Enumeration<CartItem> e = cartItems.elements();
		while (e.hasMoreElements()) {
			total = total + e.nextElement().getTotalPrice();
		}
		return total;
	}

	public int getTotalItems() {
		int total = 0;
		Enumeration<CartItem> e = cartItems.elements();
		while (e.hasMoreElements()) {
			total = total + e.nextElement().getItemCount();
		}
		return total;
	}

	public double getTotalBeforeTax() {
		return getShippmentAmount() + getSubTotal();
	}

	public double getTax() {
		return getTotalBeforeTax() * (Cart.TAX_PERCENT);
	}

	public double getOrderTotal() {
		return getTotalBeforeTax() * (1 + Cart.TAX_PERCENT);
	}

	public String getTaxPercent() {
		return Cart.TAX_PERCENT * 100 + "%";
	}

	public void disPose() {
		Enumeration<CartItem> e = cartItems.elements();
		while (e.hasMoreElements()) {
			e.nextElement().setItemCount(0);
		}
	}
}

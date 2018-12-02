package model;

import java.util.Enumeration;
import java.util.Hashtable;

public class Cart {
	public static final double TAX_PERCENT=0.058;
	private Hashtable<Integer,CartItem> cartItems=new Hashtable<Integer,CartItem>();
	private double shippmentAmount;
	public void setShippmentAmount(double amt) {
		this.shippmentAmount=amt;
	}
	public double getShippmentAmount() {
		return shippmentAmount;
	}
	
	public Enumeration<CartItem> getCartItems() {
		return cartItems.elements();
	}

	
	public void addItem(int quantity, SalesItem item) {
		if(cartItems.get(item.getItemId())!=null ) {
			CartItem cartItem = (CartItem) cartItems.get(item.getItemId());
			cartItem.add(quantity);
		}
		else {
			cartItems.put(item.getItemId(),new CartItem(quantity,item));
		}
	}

	public void updateQuantity(int id, int newCount) {
		CartItem item = (CartItem) cartItems.get(id);
		if(newCount<=0) {
			cartItems.remove(id);
		}
		else {
			item.setItemCount(newCount);
		}	
	}
		      
		public double getSubTotal() {
			double total=0.0;
			Enumeration<CartItem> e = cartItems.elements();
			while(e.hasMoreElements()) {
				total= total+((CartItem)e.nextElement()).getTotalPrice();
			}
			return total;
		}
		public int getTotalItems() {
			int total=0;
			Enumeration<CartItem> e = cartItems.elements();
			while(e.hasMoreElements()) {
				total= total+((CartItem)e.nextElement()).getItemCount();
			}
			return total;
		}
		
}

